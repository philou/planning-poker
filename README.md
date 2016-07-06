# Planning-Poker

An app to do enable agile teams to do planning poker estimations remotely

I host an instance on Heroku : https://philous-planning-poker.herokuapp.com/

## How to deploy your own in 5 minutes

This project uses docker, docker-compose and is Heroku ready. All you need to do is to install these 3 :

* https://docs.docker.com/engine/installation/
* https://docs.docker.com/compose/install/
* https://toolbelt.heroku.com/

You'll also need to add the container plugin to Heroku, in order to deploy docker images :
```
heroku plugins:install heroku-container-tools
```

First, clone the repo :
```
git clone https://github.com/philou/planning-poker.git
```

Run it locally
```
cd planning-poker
docker-compose build
docker-compose up web
```
Check that it's running at http://0.0.0.0:8080

Create an heroku app
```
heroku apps:create
```

Deploy to heroku
```
heroku container:release
```

Verify that your instance is up at https://your-app.herokuapp.com

## TODO
> This README would normally document whatever steps are necessary to get the
> application up and running.
>
> Things you may want to cover:
>
> * Ruby version
> * System dependencies
> * Configuration
> * Database creation
> * Database initialization
> * How to run the test suite
> * Services (job queues, cache servers, search engines, etc.)
> * ...
