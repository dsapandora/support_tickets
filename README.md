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
Request parameters:
```
 { 
  email: <user_email>
  password: <user_password>
 }
```
Response_parameter:
```{ 
access-token: <sytem_token>
 client: <json with the client info>
 }
```

DELETE LOGOUT
parameters:
```
{
uid: <user_id>
access-token: <token>
client: <client info>
}
```
POST CREATE USER
parameters:

name
nickname
email
password
password-confirmation


GET SEND_PDF_REPORT

The access-token can be sended in the hearder or inside the json request. 


