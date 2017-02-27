# README
![System Diagram](https://github.com/dsapandora/support_tickets/blob/master/support_ticket.png?raw=true)


API_TEST: http://globalsupport.herokuapp.com/

POST TICKETS
parameters: 
```
{ 
  user_id: <user_id>,
  question: <string with the question>
}
```

POST RESPONSE
Parameters:
```
{ 
  user_id: <user_id>,
  ticket_id: <string with the question>,
  response: <string with response>
}
```


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


