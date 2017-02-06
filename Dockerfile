# Base our image on an official, minimal image of our preferred Ruby
# Repeated in Gemfile
FROM ruby:2.4.0-slim

# Install essential Linux packages
RUN \
  apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y build-essential libpq-dev postgresql-client libsqlite3-dev && \
  apt-get install -y wget libfreetype6 libfontconfig bzip2


# Install phanton js (https://hub.docker.com/r/cmfatih/phantomjs/~/dockerfile/, https://gist.github.com/jakemauer/99227bc5f7c0fef375f2, https://gist.github.com/julionc/7476620)
ENV PHANTOMJS_VERSION 2.1.1
RUN \
  wget -q --no-check-certificate -O /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 && \
  tar -xjf /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 -C /tmp && \
  rm -f /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 && \
  mv /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64/ /usr/local/share/phantomjs && \
  ln -s /usr/local/share/phantomjs/bin/phantomjs /usr/local/bin/phantomjs

# Define where our application will live inside the image
ENV RAILS_ROOT /var/www/planning-poker

# Create application home. App server will need the pids dir so just create everything in one shot
RUN mkdir -p $RAILS_ROOT/tmp/pids

# Set our working directory inside the image
WORKDIR $RAILS_ROOT

# Use the Gemfiles as Docker cache markers. Always bundle before copying app src.
# (the src likely changed and we don't want to invalidate Docker's cache too early)
# http://ilikestuffblog.com/2014/01/06/how-to-skip-bundle-install-when-deploying-a-rails-app-to-docker/
COPY Gemfile Gemfile

COPY Gemfile.lock Gemfile.lock

# Prevent bundler warnings; ensure that the bundler version executed is >= that which created Gemfile.lock
RUN gem install bundler

# Finish establishing our Ruby enviornment
RUN bundle install

# Copy the Rails application into place
COPY . .

# Define the script we want run once the container boots
# Use the "exec" form of CMD so our script shuts down gracefully on SIGTERM (i.e. `docker stop`)
CMD [ "config/containers/app_cmd.sh" ]
