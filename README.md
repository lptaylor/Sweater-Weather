# Range Society
A Turing School API project created with Rails.

[SweaterWeather](https://enigmatic-everglades-87289.herokuapp.com/)

Contributors:
* Lance Taylor

# About SweaterWeather

Sweater Weather five day solo project at Turing School of Software and Design to consume multiple external APIs and create a backend for a future front end project. There are eight endpoints for this API currently that offer various functionality as detailed below.

## Learning Goals

* Consuming various APIs
* Making an API
* Learning to design in a purely backend setting
* Developer empathy for anyone who would need to use this to design a front end from it

## Getting Started && Prerequisites

### APIs Required Within
* Google Geolocation Service
* Dark Sky Weather API
* GIPHY API
* FLICKR API

###### API Keys Required:

* Google Geolocation defined within as `ENV['GOOGLE_API_KEY']`
* Dark Sky Weather defined within as `ENV['DARK_SKY_API_KEY']`
* Giphy defined within as `ENV['GIPHY_API_KEY']`
* Flickr defined within as `ENV['FLICKR_API_KEY']`

You will need Rails v 5.2.2.
```
gem install rails -v 5.2.2
```
Clone down this repo!

```
git clone https://github.com/lptaylor/Sweater-Weather
```

### Installing

From your terminal, navigate into the Sweater-Weather directory:

```
cd Sweater-Weather
```

Make sure your gemfile is up to date:

```
bundle
bundle update
```
Establish a database:

```
rake db:{drop,create,migrate}
```
Start your server:

```
rails s
```

Open your browser (best functionality in Chrome).

`localhost:3000`

## Testing

Your location should be the root directory of the project (`Sweater-Weather`).

From the command line run `rspec`
(This can take a moment)

`Green` is passing.
`Red` is failing.

Tech used was `rspec`, `vcr`, `shoulda-matchers`, and `simplecov` for testing.

## Endpoints

### For all POST and DELETE you must use an app such as POSTMAN!

#### Forecast for a location

https://enigmatic-everglades-87289.herokuapp.com/api/v1/forecast?location=YOUR_LOCATION
Returns a response containing the current weather, an hourly forecast for 8 hours and a 5 day forecast

#### Background image for a location

https://enigmatic-everglades-87289.herokuapp.com/api/v1/backgrounds?location=YOUR_LOCATION
Returns a URL for an image based on the location from the Flikr API

#### Gif for the daily forecast

https://enigmatic-everglades-87289.herokuapp.com/api/v1/gifs?location=YOUR_LOCATION
Returns a collection of gifs based on the summary of a 5 day forecast for a location

#### User creation

POST to https://enigmatic-everglades-87289.herokuapp.com/api/v1/users?email=youremail&password=password&password_confirmaion=password
This will return an api key for the new user

#### User login

POST to https://enigmatic-everglades-87289.herokuapp.com/api/v1/users?email=youremail&password=password
This will return an api key for the user if they exist

#### Favorite location creation

POST to
https://enigmatic-everglades-87289.herokuapp.com/api/v1/users?/api/v1/favorites?location=YOUR_NEW_FAVORITE&api_key=YOUR_API_KEY
This will associate a location with your user account

#### List all favorite locations for a user

https://enigmatic-everglades-87289.herokuapp.com/api/v1/users?/api/v1/favorites?api_key=YOUR_API_KEY
This lists all your favorite locations with their current weather

#### Delete a favorite location

DELETE to
https://enigmatic-everglades-87289.herokuapp.com/api/v1/users?/api/v1/favorites?location=YOUR_NEW_FAVORITE&api_key=YOUR_API_KEY
This will return the location that was deleted as a response if it existed


## Deployment

Our app is deployed on heroku at: [SweaterWeather](https://enigmatic-everglades-87289.herokuapp.com/)

## Created with

* `Rails`
* `Ruby`

### Gems:
* `faraday`
* `figaro`
* `awesome_print`
* `fast_jsonapi`
* `bcrypt`
