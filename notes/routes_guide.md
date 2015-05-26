#Rails Routing from the Outside In
This guide covers the user-facing features of Rails routing.

##1 The Purpose of the Rails Router
The Rails router recognizes URLs and dispatches them to a controller's action. It can also generate paths and URLs, avoiding the need to hardcode strings in your views.

###1.1 Connecting URLs to Code
When your Rails application receives an incoming requst for:

```
GET /patients/17
```
it asks the router to match it to a controller action. If the first matching route is:

```
get 'patients/:id', to 'patients#show'
```
the request is dispatched to the `patients` controller's `show` action with `{ id: '17` } in `params`.

###1.2 Generating Paths and URLs from Code
You can also generate paths and URLs. If the route above is modified to be:

```
get '/patients/:id', to: 'patients#show', as: 'patient'
```
and your application contains this code in the controller:

```
@patient = Patient.find(17)
```
and this in the corresponding view:

```
<%= link_to 'Patient Record', patient_path(@patient) %>
```
then the router will generate the path `/patients/17`. This reduces the brittlness of your view and makes your code easier to understand. Note that the `id` does not need to be specified in the route helper.

##2 Resource Routing: the Rails Default
Resource routing allows you to quickly declare all of the common routes for a given resourceful controller. Instead of declaring separate routes for your `index`, `show`, `new`, `edit`, `create`, `update`, and `destroy` actions, a resourceful route declares them in a single line of code.

###2.1 Resources on the Web
Browsers request pages from Rails by making a request for a URL using a specific HTTP method, such as `GET`, `POST`, `PATCH`, `PUT`, and `DELETE`. Each method is a request to perform an operation on the resource. A resource route maps a number of related requests to actions in a single controller.

When your Rails application receives an incoming request for:

```
DELETE /photos/17
```
it asks the router to map it to a controller action. If the first matching route is:

```
resources :photos
```
Rails would dispatch that request to the `destroy` method on the `photos` controller with `{ id: '17' }` in `params`.

###CRUD, Verbs, and Actions
In Rails a resourceful route provides a mapping between HTTP verbs and URLs to controller actions. By convention, each action also maps to particular CRUD operations in a database. A single entry in the routing file, such as:

```
resources: photos
```
creates seven different routes in your application, all mapping to the `Photos` controller:
