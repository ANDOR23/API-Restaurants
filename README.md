# README

THIS IS A REST API THAT PROVIDES USEFUL INFORMATION ABOUT RESTAURANTS TO USERS. 
INFORMATION LIKE: 
    * NAME, SITE, RATING, LOCATION, ETC.
ALSO THE USER IS ABLE TO KNOW, GIVEN COORDINATES(LATITUDE, LONGITUDE) AND A RADIUS, TO KNOW HOW MANY RESTAURANTS THERE INSIDE OF THE RADIUS.


* THIS API WAS DEVELPED WITH RUBY 3.1.2 AND RAILS 7.0.4.1
  THIS HAS SOME DEPENDENCIES:
    * PostGIS with activerecord-postgis-adapter gen

* THE PROJECT DATABASE WAS POSTGRESQL

IF YOU WANT TO PLAY WITH THIS REST API, COPY THE LINK OF THE DEPLOYED APP.

THE ENDPOINTS TO USE IT CORRECTLY ARE:

    *GET /restaurants => return all the restaurants saved.
    *GET /restaurants/:id => return one restaurant found by its id.
    *POST /restaurants => creates a new restaurant.
    *PATCH /restaurants/:id => updates one or more resources of the object.
    *DELETE /restaurants/:id => deletes the restaurant found by its id.
    *GET /restaurants/stadistics => giving the following params "?latitude=x&longitude=y&radius=z". Return a json like this:
        {
            count: Count of restaurants that fall inside the circle with center [x,y] and radius z,
            avg: Average rating of restaurant inside the circle,
            std: Standard deviation of rating of restaurants inside the circle
        }
