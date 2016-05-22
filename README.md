# rdcontacts

# to use locally

- rails version: 4.2.3
- ruby version: 2.0.0
- postgress

- git pull
- bundle install
- change db credentials (pg) -> config/database.yml
- rake db:create
- rake db:migrate
- rake db:seed
- rake test - run all tests
- rails server - to start the app (or another one that you use)


After a db seed you can use the super user to create new clients for the application.

- super user email:  admin@rdcontacts.com
- super user password: 12345678

You can change these credentials at file db/seeds.rb. All new clients will have the new password: 12345678
