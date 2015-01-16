# Handling GET Requests with Sinatra


`GET` is the most frequently used [HTTP
Verb](http://glossary.codeunion.io/http-methods/).
We use `GET` to [request](http://glossary.codeunion.io/request/)
[resources](http://glossary.codeunion.io/resource-web/)
from a
[server](http://glossary.codeunion.io/server/).


`GET` requests are not supposed to modify
[data](http://glossary.codeunion.io/data/) on the
server in any meaningful way, and are mostly triggered by clicking a link in
your browser. Forms *may* send GET requests, but even forms should not alter
data on the server. Instead, use forms with GET for "read-only" tasks, like
searching.

## Using GET and Sinatra

On each GET request,
[Sinatra](http://glossary.codeunion.io/sinatra/)
populates a hash called
[`params`](http://glossary.codeunion.io/params-sinatra/)
with per-request data. With `GET`
[routes](http://glossary.codeunion.io/route-sinatra/),
This data comes from two sources:

1. The [URLs](http://glossary.codeunion.io/url-uniform-resource-locator/)
   [query
   variables](http://glossary.codeunion.io/query-variables/).
1. The URLs path via [named
   parameters](http://glossary.codeunion.io/named-parameters-sinatra/)


## Your Mission

Build a series of
[routes](http://glossary.codeunion.io/route-sinatra/)
and modify the `home.erb`
[view](http://glossary.codeunion.io/view-sinatra/)
to leverage named parameters and query variables.

1. Clone the repo
2. cd into this directory
3. `bundle install`
4. `rerun -c rackup`


#### Query Variables

1. Build a form that sends `GET` requests to the `/search` path with a textbox
   named `terms`.
1. Create a route that responds to `GET` requests at the `/search` path. Have
   it respond with only the quotes that contain the word(s) specified in `params["terms"]`.
1. Create a list of "cool searches" that consist of links to `/search?terms=<term>`

#### Named Parameters

1. Create a route that responds to `GET` requests at `/authors/<author name>`
   and returns all the quotes for that author.
1. Create links to each authors page on the home view.

Look at us, GETting things done!
