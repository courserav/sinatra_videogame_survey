Videogame Survey Sinatra App

## Overview
This application provides a Sinatra app demonstrating CRUD and RESTful route principles. 
Users will be able to create an account, sign in, and then begin taking videogame surveys to get suggestions on the next game they should try. 
The survey is in the form of radio buttons that the user will fill in and then submit. Once a survey is submitted you will see it in your user profile page. 
Users cannot interact with the app's main features until logged in. 
Users can view anybody else's content, but only edit their own. Attempts at editing or deleting other surveys will redirect the user to the previous view page. 

The application pages itself are managed via MVC. The application is built on Sinatra and we use ActiveRecord to incorporate a database with tables.
The database stores survey content and user account information. Authentication is run through the controllers to make sure that users have valid user names, and that 
only certain editing privilleges are given when viewing their own content. 

To run the application locally please download the repo, open the project folder, and then run a shotgun command to get the server started. 
You will be able to see the product on your own web browser.

### Gemfile and environment.rb
This project is supported by Bundler and includes a `Gemfile`.

Run bundle install before getting started on the project.

An `environment.rb` is included that loads all the code in your project along with Bundler. You will not need to ever edit this file. 
When you see require_relative `../config/environment`, that is how your environment and code are loaded.

### CRUD
Create - Managed by the routes in my controllers, users can create surveys and users. 
Read - Read is managed by 'show' and 'index' erb files. Controllers manage the routing and the views are what allows the user to interact with the content. 
Update - Users can update their records as displayed in the edit.erb. Surveys_controller has a route to the edit page where we send a PATCH request. PATCH allows us to partially update the resource. 
Delete - Delete is also managed by the surveys_controller and shown through 'show.erb'. 