# README

This README would normally document whatever steps are necessary to get the
application up and running.

### Requirements:

* Ruby 2.6.6 / check `.ruby-version`
* SQLite3
* Node.js
* Yarn

### Application Setup:

* `bundle installl`
* `bin/rails db:create db:migrate db:seed`
* `bin/rails db:migrate db:seed RAILS_ENV=test`
* `bin/rails s`
* navigate to `localhost:3000` in your browser

>[!NOTE]
>
> Application data is being populated by running the seeds, where an REST API client is being used for connecting to an external API.
> Therefore it is important to run the seeds beforehand.
