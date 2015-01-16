# Handling POST Requests with Sinatra

`POST` is the second most frequently used [HTTP
Verb](http://glossary.codeunion.io/http-methods/).
We use `POST` to make
[requests](http://glossary.codeunion.io/http-request/)
which change
[data](http://glossary.codeunion.io/data/) on the
[server](http://glossary.codeunion.io/server/).

`POST` requests are triggered by submitting a form. The data in the form is
sent to the application server, which modifies it's data according to the
request, and builds a response. Most browsers only support sending `POST` and
`GET` requests without JavaScript; so `PUT` and `DELETE` requests often
"piggyback" on a `POST` request.

## Using POST and Sinatra

On each POST request,
[Sinatra](http://glossary.codeunion.io/sinatra/)
populates the [`params`
hash](http://glossary.codeunion.io/params-sinatra/)
from the following data:

1. The [form
   data](http://glossary.codeunion.io/form-data/)
2. The URL path's [named
   parameters](http://glossary.codeunion.io/named-parameters-sinatra/)
3. The URLs [query
   variables](http://glossary.codeunion.io/query-variables/)
   (These are rarely used in POST requests)


`POST` requests are most frequently used to:

1. Change data for an existing
   [resource](http://glossary.codeunion.io/resource-web/)
2. Add a new resource to a collection

## Your Mission

Build a series of
[routes](http://glossary.codeunion.io/route-sinatra/)
and
[views](http://glossary.codeunion.io/view-sinatra/)
That use `POST` to modify a database on a server.

1. Clone this repo
1. `cd` into this directory
1. `bundle install`
1. `ruby populate_starting_recipes.rb`
1. `rerun -c rackup`


#### Adding a Resource to a Collection with POST
If we keep in mind the web is a bunch of documents tied together with links;
the notion of "collections" becomes somewhat easier to grasp.

Consider the following path of a url: `/articles/how-awesome-is-programming`.
The resource `how-awesome-is-programming` is within the resource `articles`. In
this case `articles` is a collection resource. It contains many articles.

A pretty common operation on a collection is to add stuff to it, so a
convention for `POST` requests to ` /articles` to create a new article with the
data contained in the form body.

Phew. All that to say, we've got this awesome recipes webapp that needs a way
to add recipes to the collection!

1. Create a route in `app.rb` that handles `POST` requests to `/recipes` and
   creates a new `Recipe` in the database.
1. Create a form in `views/recipes.erb` that `POSTs` to  `/recipes`

#### Modifying Data of a Resource
Again, the web is a collection of resources. If we wanted to update
`/articles/how-awesome-is-programming` we would need a form. The form itself
likely won't be part of the `/articles/how-awesome-is-programming` resource;
instead it would likely be a sub-resource
`/articles/how-awesome-is-programming/edit`

This `/articles/how-awesome-is-programming/edit` sub-resource would contain a
form that would `POST` to `/articles/how-awesome-is-programming`; which the
server will use to update the data it uses when responding to `GET` requests to
`/articles/how-awesome-is-programming`

So, let's make our recipes editable!

1. Create a `GET` route in `app.rb` that handles requests to
   `/recipes/:recipe_id/edit`, retrieves the specified `Recipe` from the
   database, and assigns it to `@recipe`.
2. Create a `views/edit_recipe.erb` file that has a form which `POSTs` to
   `/recipes/<%=@recipe.id%>` that a user  may fill with recipe data. Pre-fill
   the form fields with the data stored in `@recipe`!
3. Create a `POST` route in `app.rb` that handles requests to
   `/recipes/:recipe_id` and updates the `Recipe` with the passed in
   `recipe_id` from the database.

WOOO! We are POSTmasters!
