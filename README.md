# Hoot

This was a 5 day project, in which we were asked to create a replica of Yelp.co.uk using Ruby on Rails. It was the first time the four of us had used Rails, so much of the time was spent learning 'the rails way'. We prioritised keeping the routes of the app RESTful, and try and keep Rails conventions the best we could.

## Getting started
* You will require bundler, find installation details [here](http://bundler.io/) if you don't already have it.
* Download this repo.
```
git clone https://github.com/tallpress/Yelp-Challenge
```
* Run bundle install.
```
bundle install
```
* Run rails server to start the server.
```
rails server
```
* Migrate the databases in order to be able to use the app.
```
rails db:migrate
```
* Navigate your browser to [http://localhost:3000](http://localhost:3000) to view the app.

## Testing
To run the tests, considering the app has already been set up using the getting started guide, simply change into the repo on your terminal and run rspec. (i.e. assuming  you have ran bundle)
```
rspec
```
We used rspec and capybara with selenium webdriver to run the tests so that we could mimmic a user of the app.
Tests cover most functionality, such as creating an account, adding a restaurant, leaving a review. Edge cases are also covered, such as not being able to comment on your own restaurant etc.

## Contributors
[Tom Allpress](https://github.com/tallpress), [Charles Emery](https://github.com/charlesemery15), [Valentina Romeo](https://github.com/Ciancion),
[Lars Findlay](https://github.com/LarsFin)
