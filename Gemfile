# Ruby version, repeated in Dockerfile
ruby '2.3.3'

source 'https://rubygems.org'
source 'https://rails-assets.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '>= 5.0.0.rc1'
# Use postgres as the database for Active Record
gem 'pg'
# Use Puma as the app server. We want to avoid 3.7.0 because it has a serious bug that breaks cucumber
gem 'puma', '!= 3.7.0'
# Bootstrap for style
gem 'bootstrap-sass'
# Use SCSS for stylesheets
gem 'sass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
# TODO use rails-assets.org instead of jquery-rails to get jquery
gem 'jquery-rails'
# Use javascript countdown
source 'https://rails-assets.org' do
  gem 'rails-assets-jquery.countdown'
  gem 'rails-assets-moment'
  gem 'rails-assets-moment-timezone'
end

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :production do
  # Use Redis adapter to run Action Cable in production
  gem 'redis', '~> 3.0'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen'

  gem 'guard'
  gem 'guard-cucumber'
  gem 'guard-rspec', require: false
  gem 'guard-teaspoon'
  gem 'guard-rubocop'
  gem 'guard-coffeelint'

  gem 'rails_real_favicon'

  gem 'ruby-debug-ide'
  gem 'debase'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri

  gem 'rspec-rails'
  gem 'capybara'
  gem 'poltergeist'
  gem 'teaspoon-jasmine'

  gem 'sqlite3'

  gem 'httpclient'
end

group :test do
  gem 'cucumber-rails', :require => false
  # database_cleaner is not required, but highly recommended
  gem 'database_cleaner'

  # Code climate test coverage
  gem 'simplecov'
  gem 'codeclimate-test-reporter'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
