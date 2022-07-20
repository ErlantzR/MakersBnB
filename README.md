# MakersBnB

## Instructions for using the app

- Start by cloning this repo
- Run bundler to install dependencies. Follow the instructions to install any that are missing and not automatically installed. 
- set up your tables as follows:
- enter <code># psql postgresql<code> in the terminal:
- once in postgresql, enter the info found in db/migrations/01_create_databases.sql (as individual entries). This will create the databases
- then navigate to each database with <code># \c makersbnb<code> and <code># \c makersbnb_test<code>, and once inside each one, enter all the info found in db/migrations/02_create_tables.sql (as individual entries). This will create the tables for the user experience and for testing. The information should be the same in both databases.  
- start up the server with <code>$ rackup config.ru<code> or <code>$ rackup -p 3000<code>
- navigate to the relevant localhost address, either localhost:9292 or localhost:3000, depending on the above choice
- to enter information, follow the instructions on the page
- to view the info in the databases, navigate to the you wish to view database, then enter <code># \dt<code> to view all tables.
- to view a specific table, e.g. spaces, enter SELECT * FROM spaces
- to run tests, run rspec

## Specification

### Headline specifications

- Any signed-up user can list a new space.
- Users can list multiple spaces.
- Users should be able to name their space, provide a short description of the space, and a price per night.
- Users should be able to offer a range of dates where their space is available.
- Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.
- Nights for which a space has already been booked should not be available for users to book that space.
- Until a user has confirmed a booking request, that space can still be booked for that night.

### Nice-to-haves

- Users should receive an email whenever one of the following happens:
 - They sign up
 - They create a space
 - They update a space
 - A user requests to book their space
 - They confirm a request
 - They request to book a space
 - Their request to book a space is confirmed
 - Their request to book a space is denied
- Users should receive a text message to a provided number whenever one of the following happens:
 - A user requests to book their space
 - Their request to book a space is confirmed
 - Their request to book a space is denied
- A ‘chat’ functionality once a space has been booked, allowing users whose space-booking request has been confirmed to chat with the user that owns that space
- Basic payment implementation though Stripe.

## Minimum Viable Product

The items below were agreed to be the minimum viable product by the team:
```
So that
I can use MakersBnB
I want to be able to sign_up with a username

As a host
So that I can list a space
I want to be able to add a new space

As a host
So that I can list multiple spaces
I want to be able to add another space

As a guest
So that I can see plan my holiday
I want to see a list of properties available

As a guest
So that I can book a night at a space
I want to be able to make a booking request to the host

As a host
So that I can manage booking requests
I want to be able to see my booking requests

As a host
So that I can confirm a booking
I want to be able to approve or reject booking requests

As a host
So I know which spaces I have added
I want to see a list of the spaces I've added

As a user
So that I can see information specific to me,
I want to be able to login
```
-----

=======

***MVP***


![image_title](/images/domain_modelling.png)
