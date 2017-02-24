# Planning-Poker

![CI Build Status Badge](https://api.travis-ci.org/philou/planning-poker.svg?branch=master)
[![Code Climate](https://codeclimate.com/github/philou/planning-poker/badges/gpa.svg)](https://codeclimate.com/github/philou/planning-poker)
[![Test Coverage](https://codeclimate.com/github/philou/planning-poker/badges/coverage.svg)](https://codeclimate.com/github/philou/planning-poker/coverage)
[![Issue Count](https://codeclimate.com/github/philou/planning-poker/badges/issue_count.svg)](https://codeclimate.com/github/philou/planning-poker)

An app to do enable agile teams to do planning poker estimations remotely

An instance is continuously deployed to heroku : https://philous-planning-poker.herokuapp.com/

## How to hack it

#### Sources

First, clone the repo :
```
git clone https://github.com/philou/planning-poker.git
cd planning-poker
```

#### Dependencies

They are managed with bundler. Just run the following :
```
bundle install
```
bundle might complain that some dependencies are missing on your OS, in this case follow its advices and install them.

#### Database

There is a docker compose configuration to start services dependencies. You can either use docker, or start the db yourself. Here is the docker way.

You'll need to have docker and docker compose installed :

* https://docs.docker.com/engine/installation/
* https://docs.docker.com/compose/install/

Then, run the following to create the database :

```
docker-compose up
bundle exec rake db:create
bundle exec rake db:migrate
```

#### Local run

The db should be started from previous step. Start the rails server the typical way

```
bundle exec bin/rails server
```

Check that it's running at http://localhost:3000
