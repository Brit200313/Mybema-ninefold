Mybema
======

Mybema is an open source community platform. It allows users to participate in discussions and lets you create knowledgebase articles for your community.

Installation
============

This is my installation of Mybema on [Ninefold](http://ninefold.com/).

Local deployment
----------------

    git clone git@github.com:mybema/mybema.git

Then install the dependencies:

    bundle install

Install Postgres if you haven't already

    brew install postgresql

Install Redis if you haven't already

    brew install redis

Install Elasticsearch if you haven't already

    brew install elasticsearch

Create a database configuration file:

    cp config/database.example.yml config/database.yml

Create your database and run the migrations and the seeds:

    rake db:create db:migrate db:seed

Create a secrets configuration file:

    touch config/secrets.yml

Create a secret token using `rake secret` and add it into the file. You will also need to add your S3 credentials if you plan on using S3 for asset storage:

    development:
      secret_key_base: YOUR_SECRET_TOKEN
      amazon_bucket: YOUR_BUCKET_NAME
      amazon_access_key_id: ACCESS_KEY_ID
      amazon_secret_access_key: ACCESS_KEY

    test:
      secret_key_base: YOUR_SECRET_TOKEN

    production:
      secret_key_base: YOUR_SECRET_TOKEN
      amazon_bucket: YOUR_BUCKET_NAME
      amazon_access_key_id: ACCESS_KEY_ID
      amazon_secret_access_key: ACCESS_KEY

From here you should be good to start up the server:

    bundle exec rails s

Ninefold deployment
-------------------
TBD

Running the tests
=================
You'll need to fire up elasticsearch as well as a redis server before running the test suite. Once they are up, simply run:

    rake test

Contributing
============
Contributions are welcome. Please add unit tests as well as feature tests with your changes and squash your commits before submitting pull requests. Bugs should be reported via the issue tracker.

License
=======
An appropriate license for this project is coming soon.
