# Tutorial

## 1) all our web pages are in the views directory.

Whenever we create a page, we gotta add an entry in routes.rb or it won't be accessible.

Every pages needs a controller
## 2) to create a new page:
> rails generate controller home index

we just created home/index page.
this means we now have a:
- home_controller.rb
- app/views/home/index.html.erb
- app/assets/stylesheets/home.scss

go to: http://127.0.0.1:3000/home/index    to see it

here: - app/views/home/index.html.erb  


## 3)	if we wanna see all the routes we can type:
> rails routes

## 4) in home_controller.rb
we will find in index function


## 5) in app/views/layouts/application.html.erb
we will find some html and a yield tag
this page is the layout page. and rails will just bring other pages through that yield page
so we can have the same header and same footer for all pages


## 6)to create a page manually without rails generator, we'll need 3 things:
a controller, an html and a route
ex: about us page
first, we create about.html.erb in home folder in views
then we create the controller. we add a "about" method in home controller
and finaly, we add a get 'home/about' in rootes.rb


## 7) adding the bootstrap gem:
+ add gem "bootsrap-sass", "3.4.1"
> bundle install 
+ create file "custom.scss" in the folder "app/asset/stylesheets"
+ add lines bellow in "custom.scss"

		 @import "bootstrap-sprockets";
    
		 @import "bootstrap";
    
+ rename "app/asset/stylesheets/application.css" to "app/asset/stylesheets/application.scss"

## 8)now we add header and footer:
we create file:  '_navBar.html.erb' in "app/view/layouts".

these types of files are called "partial" cus it starts with _ .

we can use it in our pages by putting this <%= render 'layouts/navBar' %> in our html. 

the '=' means we wanna output stuff. if we wanna just write ruby code there, we don't type '=' .

## 9) now we start modifying our nav bar:
to change its content, we use this to replace all links:

        <%= link_to "Home", home_index_path, class:"navbar-brand" %>
    
link_to is the name of the link, then we specify the path, and then the class for styling and shit


## 10) we can now generate dynamic links to replace the static ones we've been using up to this point:

        get 'Home' => 'home#index'
        get 'About' => 'home#about'
        get 'Contact' => 'home#contact'
        get 'Aide' => 'home#aide'


once we add these in routes.rb		we'll see that about_path is available to us as links in the nav bar html file. we change them there. and now we see that the links look much nicer at the top.


## 11) now we just added a jumbotron to home

        <div class="jumbotron" >
          <h1>Welcome to the site  </h1>
          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce egestas quis velit nec semper. Proin et velit nec sapien facilisis varius sit amet nec neque. Phasellus ornare, odio eu suscipit hendrerit, orci tortor dapibus neque, at sollicitudin tortor sapien vitae ipsum. Nulla placerat aliquam felis, vel ultricies mauris tincidunt id. Nam dapibus turpis arcu, vel bibendum mauris commodo in.</p>
          <p>
            <%= link_to "Sign up", signup_path, class:"btn btn-primary btn-lg" %>
          </p>
        </div>

## 12) now we can add models or scaffolds
experiment a little bit with these:

> rails generate Scaffold Foo name:string description:string

> rails destroy scaffold Foo

```
note
Generating a scaffold includes generating a model but also generates:
-RESTful routes
-a controller with all actions for RESTful handling of the model
-views needed by the controller
-tests stubs
Scaffolding is a good start for new Rails users.
```


## 13) adding Utilisateur model:
> rails generate model Utilisateur nom:string email:string

> rails db:migrate
now we gotta add controller to control this bad boy:

> rails generate controller Utilisateurs new

- you'll see that   get 'utilisateurs/new' route has been added automatically
- let's add a nice looking dynamic link to this


## 14) now we visit "utilisateur_test.rb" and start making some tests:
we add this here:

    def setup
       @utilisateur = Utilisateur.new(nom: "prenom1 Nom1",
                                     email: "prenom1@example.com")
    end

  	test"nom doit etre present" do
   	 @utilisateur.nom = ""
   	 assert_not @utilisateur.valid?
  	end
now to migrate the test:
> rails db:migrate RAILS_ENV=test
now to run the test:
> rails test:models
this is the result:
	Failure:
	UtilisateurTest#test_nom_doit_etre_present 	[C:/Users/imani/IdeaProjects/rubyTP/test/models/utilisateur_test.rb:15]:
	Expected true to be nil or false

- to avoid the failure, we must add a validation rule on the utilisateur model ("model/utilisateur.rb")
	by adding the line : validates :nom, presence: true

> rails test:models		# 0 failures


- same thing for testing email :
	test"email doit etre present" do
   	 @utilisateur.email = ""
    	 assert_not @utilisateur.valid?
  	end
	#length validation
	test"email ne doit pas etre trop long" do
   	 @utilisateur.email = "a" * 244 + "@exemple.com"
    	 assert_not @utilisateur.valid?
  	end
> rails test:models		->	Failure:UtilisateurTest#test_nom_ne_doit_pas_etre_trop_long
- to avoid the failures :
	add in the model the line : validates :email, presence: true, length: { maximum: 255 }
> rails test:models		# 0 failures

some more modifications to utilisateur_test.rb and utilisateur.rb but now we got 0 failures once again

## 15) if we want full CRUD functionalities, we use this:

>rails generate scaffold friend f_name:string l_name:string email:string

>rails db:migrate

this will create a shit tonne of files. delete scaffolds.scss so it doesn't mess with our css.
now we can see what we have through friends/new

