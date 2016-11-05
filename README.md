# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

## Installation:

* clone this repository
* go into the project directory
* ruby version 2.3.1 (suggest to use rvm or rbenv)
* rails 5.0.0.1

[Rails instalation on Ubuntu]( http://blog.wilgosz.pl/posts/ruby-on-rails/ruby-on-rails-instalacja-ubuntu-12-04 )

###Install dependencies

    rvm use 2.3.2@pkp --create
    gem install rails
    bundle install

###Create database

    rake db:create
    rake db:schema:load
    rake db:seed #to load sample data


##Launching the app

    rails s

###Rails console

    rails c

##Testing

We use RSpec for tests. To run tests:

    spring rspec
    #or
    rake docs:generate


##Catching emails

    gem install mailcatcher
    mailcatcher
    Go to http://localhost:1080/
    Send mail through smtp://localhost:1025

##Deployment

We deploy application on heroku.

