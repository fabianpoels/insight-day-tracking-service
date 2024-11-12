# README

## Ruby and Rails

Make sure you have the correct Ruby and Rails versions:

ruby-3.3.5
rails 7.2.1

## Postgres and Redis

The application requires a connection to both a Postgres and Redis database. The Postgres connection can be configured in the next step.

## Env

Copy the example `.env.example` to `.env` and update the required values

## Running the application

Install the required gems

```
bundle install
```

Create and migrate the database

```
bin/rails db:create
bin/rails db:migrate
```

The application uses [Foreman](https://github.com/ddollar/foreman) to run both the main server and the sidekiq queue.
Install the gem:

```
gem install foreman
```

Then start the server:
```
foreman start
```

## Redirect

The param `url` has to be specified to trigger the redirect, eg:
```
localhost:3000?url=additive.eu
```

## Dashboard

The dashboard can be visited at `localhost:3000/dashboard`