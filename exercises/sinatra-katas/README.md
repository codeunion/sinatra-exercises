### Welcome to Sinatra Server Side Katas.

You can run this application from your application's root directory (rember to run ```bundle install```)

```bash
rerun -x rackup
```

View the application in browser ```http://locahost:9292/```.


In this series of exercises, you will be challenged to connect some serverside application code.

The goal is for you to be able to

- Familiarize yourself with the contents and the roll of the ```params``` hash.
- Create new database records.
- Query for a record based on dynamically sourced input data.
- Delete database records.  
- Set instance variables that can then be accessed by view templates.
- Control the routing 'flow' of an application using ```if else end```.


This series of exercises will prepare your future self for the topics of HTTP actions, client side html and how to trigger GET/POST/PUT/DELETE from the client.

Useful resources

- www.sinatrarb.com/documentation.html
- http://datamapper.org/docs/

## Technical ideas you will need to understand to complete these katas.

## ```params```

You will frequently here developers, and code, make reference to the params hash.  The params hash is a hash that gets passed from the client to the server.  It enables the server to obtain and manipulate client inputed data.  Whenever an http action gets triggered, the server has access to the params hash.  The contents of the params hash will vary depending on how the browser triggered the http action.

Consider the below screen shot.  When the `Create Tweet` button gets clicked, the http action ```POST /tweets``` gets triggered on the server.

![http://cl.ly/image/1j0q4003363F/Image%202014-07-01%20at%2011.45.26%20AM.png](http://cl.ly/image/1j0q4003363F/Image%202014-07-01%20at%2011.45.26%20AM.png)

Given the below server-side code

```ruby
post("/tweets") do
  p params
end
```

Notice the output of the ```p params``` statement below.  The params hash is similar to a Hash and can be used to grab useful data.

![http://cl.ly/image/1X1u2K310L40/Image%202014-07-01%20at%2011.44.43%20AM.png](http://cl.ly/image/1X1u2K310L40/Image%202014-07-01%20at%2011.44.43%20AM.png)

```params[:id]``` or ```params[:tweet]```  are useful for getting access to other importantd data.

## CREATE database records.

For the purposes of this topic, assume that the connection to the db and the setup of the db models is already done.  We want to look at how to create new database records.  

Create a 'shell' Tweet object and send it to the browser.

```ruby
get("/tweets/new") do
  @tweet = Tweet.new # @tweet becomes the shell Tweet object to be populated with data in the browser
  erb :new # renders views/new.erb
end
```

Assume the http action ```POST /tweets``` gets triggered and the params hash looks like the below.

```ruby
{"tweet" => {"status" => "I'm at dolores getting sun #dolo", "user" => "jcdavison"}}
```

DataMapper allows us to take the contents of the params hash and write certain details into our Tweet database record.


```ruby
post("/tweets") do
  # Tweet.create() is a datamapper class method
  # which will be defined on any class that has "include DataMapper::Resource"
  @tweet = Tweet.create(params[:tweet]) 
  if @tweet.saved? # conditional logic that controls the flow of the program.
    redirect("/")
  else
    erb :new
  end
end
```
### http://datamapper.org/docs/create_and_destroy.html


## READ database records

Once you have data that you want to retrieve in the params hash...

```ruby
# Individual record retrieval
@tweet = Tweet.get(params[:id])
```

```ruby
# A collection of records
@tweets = Tweet.all
```

## UPDATE database records

The client server process is similiar to the above CREATE pattern.  First, you need to trigger a get request that populates the browser wiht a requested Tweet record.  Then, after the user has edited the data in the client, the form submits http action ``` PUT /tweets/:id ``` to the server.  Once you are on the server...

```ruby
@tweet.update(params[:tweet])
```

## DESTROY database records.

We need a way to dynamically provide the server with a record id, which has already been handled in this case.

```ruby
@tweet = Tweet.get(params[:id])
```


## ```if else end``` control flow

Consider that you are on the server, based on multiple conditions you want to send a user to different places.

```ruby
post("/tweet") do
  if true
    redirect "/"
  else
    redirect "/somewhere_else"
  end
end
```

## Obtaining dynamic information from serverside routes.

```ruby
put("/tweets/:id") do
  # :id allows for different data to be accesible on the server
  # put /tweets/1
  # put /tweets/2
  # put /tweets/3
  # to all be accessible by this route
  # params[:id] would show the value of the /1, /2, /3
end
```
