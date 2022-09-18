# README

##### Prerequisites

The setups steps expect following tools installed on the system.

- GitHub
- Ruby [3.0.0p0] 
- Rails [7.0.3] or [>= 7.0.3.1]

The main gems used must be in your Gemfile, these are:

- devise (4.8.1)
- jwt (2.5.0)
- bcrypt (~> 3.0)

##### 1. Check out the repository

git clone 

##### 2. Create database.yml file

Copy the sample database.yml file and edit the database configuration as required.

cp config/database.yml.sample config/database.yml

##### 3. Create and setup the database

Run the following commands to create and setup the database.

bundle exec rake db:create
bundle exec rake db:setup

##### 4. Start the Rails server

You can start the rails server using the command given below.

bundle exec rails s

And now you can visit the site with the URL http://localhost:3000