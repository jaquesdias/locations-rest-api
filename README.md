Locations REST API
========

RESTful API Code Challenge

Compatibility
-------------

* Ruby 2.4.3

* PostgreSQL 10.1

* Rails 5.1.4

Setup
------------

After forked and cloned the repository, run bundle:

`bundle install`

Create Database and tables:

`rails db:setup db:migrate`

Run task to import places from CSV file:

`rails import:places`

Run task to call ActiveJob that update places latitude and longitude:

`rails import:coordinates`

Run task to create Authenticated user:

`rails auth:create_user`

Start the Rails application

`rails s`

Authentication
------------
To get a token from your API:

`POST http://localhost:3000/user_token` with body `{ "auth": { "email": "mark@i-pol.com", "password": "123456" } }`

Response from the API:

```
{
    "jwt": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1MTc1MTc5MDQsInN1YiI6Mn0.xeZ1Ie8R7hbo2lAosjqwpCdouDH0sL7EvpcxiqRXXnM"
}
```

To make an authenticated request to the API, pass the token via the request header:

`Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1MTc1MTc5MDQsInN1YiI6Mn0.xeZ1Ie8R7hbo2lAosjqwpCdouDH0sL7EvpcxiqRXXnM`

Examples:
------------
  ```
  GET http://localhost:3000/places?page=:page
  GET http://localhost:3000/places/:id
  PUT http://localhost:3000/places/:id
  POST http://localhost:3000/places/:id
  DELETE http://localhost:3000/places/:id
  ```
