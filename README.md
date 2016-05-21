# rdcontacts

# to use locally

- rails version: 4.2.3
- ruby version: 2.0.0
- install postgrees

- git pull
- bundle install
- change db credentials (pg) -> config/database.yml
- rake db:create
- rake db:migrate
- rake db:seed
- rails server - to start the app (or another one that you use)

After a db seed you can use the super user to create new clients for the application. Only a client can sing-in and add users to his contact list.

- super user email:  admin@rdcontacts.com
- super user password: 12345678

You can change these credentials at file db/seeds.rb. This first release does not allow an user to change their password or recovery it.
