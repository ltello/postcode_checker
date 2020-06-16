# POSTCODE CHECKER

This Rails application checks if a postcode is servable out of a set of whitelisted postcodes and areas (lsoas).

The user will be presented with a form to type a postcode value and trigger the check, getting a positive message back
if the postcode is one of the whitelisted ones or it is included in a whitelisted area.

The system accepts properly formated postcodes (SE1 7QD) as well as non-normalised ones (sd17qd, sd1 7QD, ...)

## Installation

### Clone the repository

```shell
git clone git@github.com:ltello/postcode_checker.git
cd postcode_checker
```

### Install Ruby version 2.6.5

Install the right ruby version using [rbenv](https://github.com/rbenv/rbenv), [rvm](https://rvm.io/) or your method of choice:

```shell
rbenv install 2.5.1
```

You will also need PostgreSQL installed on your machine.

### Install application dependencies

Using [Bundler](https://github.com/bundler/bundler) and [Yarn](https://github.com/yarnpkg/yarn):

```shell
bundle && yarn
```

### Initialize the database

```shell
rails db:create db:migrate db:seed
```
This will seed the database to whitelist some postcodes:

```shell
W0 3HN
W1 3HN
W2 3HN
W3 3HN
```

and all the areas with lsoa starting:

```shell
Lambeth
Southwark
```


## Run the application

```shell
rails s
```

To access the application in your browser, as usual open it at:
```shell
localhost:3000
```


## Run the test suite

In the root folder where you cloned the application, type: 
```shell
rspec
```
