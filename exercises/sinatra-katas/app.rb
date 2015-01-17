require 'sinatra'
require 'data_mapper'

DataMapper.setup(:default, "sqlite:tweets.db")

class Tweet
  include DataMapper::Resource
  property :id, Serial
  property :status, String
  property :user, String
end

DataMapper.finalize
DataMapper.auto_upgrade!

# http://rubydoc.info/gems/sinatra#Routes


# CRUD Verb | HTTP Method
# ----------+------------
# Create    | POST
# Read      | GET
# Update    | PUT
# Destroy   | DELETE

#CREATE 

# This will render an empty form so the user can enter
# the information to create a new tweet
get("/tweets/new") do
  # build a 'shell' Tweet object that can be sent to the browser
  # render the :new template
end

# CRUD Verb: Create
# HTTP Method: POST
 
# This is the endpoint our "create form" submits to using
# the HTTP POST method.
post("/tweets") do
  # create a new tweet object and populate it with data from params hash
  # redirect the user to "/" or render :new if the record didn't save
end

# READ

get("/") do
  # query the db for all tweets
  # render the index template
end

get("/tweets/:id") do
  # query the db for the id of the requested tweet
  # render the relevant template
end

# UPDATE 

# This renders the form used to edit a specific tweet
get("/tweets/:id/edit") do
  # query the db for the requested tweet
  # render the edit template
end

# This is the endpoint our "edit form" submits to using
# the HTTP PUT method.
put("/tweets/:id") do
  # query the db for the requested tweet
  # update the tweet's attributes in the db
  # redirect the user to "/" or render edit if the record didn't save
end

# DESTROY

delete("/tweets/:id") do
  # query the db for the rquested tweet
  # destroy the tweet
  # redirect the user back to the root, "/"
end
