Locations REST API
========

RESTful API Code Challenge

Compatibility
-------------

* Ruby 2.4.3

* PostgreSQL 10.1

Setup
------------

After forked and cloned the repository, run bundle:
  bundle install

Create Database and tables:
  rails db:setup db:migrate

Run task to import places from CSV file
  rails import:places

Run task to call ActiveJob that update places latidude and longitude
  rails import:coordinates

Start the Rails application
  rails s

Examples:
------------

  GET http://localhost:3000/places?page=:page
  GET http://localhost:3000/places/:id
  PUT http://localhost:3000/places/:id
  POST http://localhost:3000/places/:id
  DELETE http://localhost:3000/places/:id
