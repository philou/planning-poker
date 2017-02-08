# Planning-Poker

![CI Build Status Badge](https://api.travis-ci.org/philou/planning-poker.svg?branch=master)

An app to do enable agile teams to do planning poker estimations remotely

I host an instance on Digital Ocean : http://philous-planning-poker.bourgau.net/

## How to hack it

This project uses docker, docker-compose. All you need to do is to install these 2 :

* https://docs.docker.com/engine/installation/
* https://docs.docker.com/compose/install/

First, clone the repo :
```
git clone https://github.com/philou/planning-poker.git
```

Run it locally
```
cd planning-poker
docker-compose build
docker-compose run app bundle exec rake db:create
docker-compose run app bundle exec rake db:migrate
docker-compose up
```

Check that it's running at http://0.0.0.0:80
