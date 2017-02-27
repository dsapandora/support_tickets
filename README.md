# README
![System Diagram](https://github.com/dsapandora/support_tickets/blob/master/support_ticket.png?raw=true)

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

API_TEST: http://globalsupport.herokuapp.com/

POST TICKETS
parameters: 
user_id
question


POST RESPONSE
Parameters:
user_id
ticket_id


POST LOGIN
parameters:
email
password
----
access-token
client

DELETE LOGOUT
parameters:
uid
access-token
client

POST CREATE USER
parameters:
name
nickname
email
password
password-confirmation


GET SEND PDF REPORT

The access-token can be sended in the hearder or inside the json request. 


