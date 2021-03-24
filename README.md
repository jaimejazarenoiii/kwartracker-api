# Kwartracker API

## Table of Contents
* [General Info](#general-info)
* [Technologies](#technologies)
* [Setup](#setup)
* [Tips](#tips)
* [References](#references)

## General info
A Dockerize Rails API app for the mobile app Kwartracker. This is using GraphQL instead of the traditional REST API.

## Technologies
Project is created with:
* Ruby version: 2.7.2
* Rails version: 6.1.3
* Docker
* GraphQL
* Postgres
* Devise
* Redis
* Sidekiq
* JWT
* Interactors
* RSpec

## Setup
* Create dotenv:
```
$ vim .env 
```
* Write the proper env variables then save:
```
:wq // save and quit command for vim
```
* build and run docker:
```
$ docker-compose up --build
```
* Open a new tab for the terminal
* List the containers and get the id for the Postgres container(because we cant see the list of the containers if it's not running):
```
$ docker container ls
```
* Get the id and enter the psql cli:
```
$ docker exec -it $postgres_container_id bash
$ psql -U postgres
$ CREATE USER $user_name WITH PASSWORD '$password';
$ ALTER USER $user_name WITH SUPERUSER;
$ \q // exit psql cli
$ exit // exit postgres bash cli
```
* Setup Rails db:
```
$ docker-compose run web rails db:setup db:migrate
```

* Terminate the app from the first tab of terminal where the rails dockerize app is running
* Rerun it again using:
```
$ docker-compose up --build
```
## Tips

* Installing ruby version 2.7.2:
  - Use [rbenv](https://github.com/rbenv/rbenv)
* Install docker desktop or cli (up to you)
  - [Docker Desktop for
      Mac](https://hub.docker.com/editions/community/docker-ce-desktop-mac/)
* Practice VIM in cli:
```
$ vimtutor
```
## References
* [Pull request template](https://gist.github.com/jaimejazarenoiii/63364c6e6201b39b8d2c3a98d7028930)
