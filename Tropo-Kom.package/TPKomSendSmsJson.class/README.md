You can send sms messages to numbers in the USA. 


This allows you to send SMS messages without using a hosted script which allows you to develop the back end of your application in smalltalk and just send tropo TropoML JSON objects.  


It also illustrates how to create and send TropoML JSON objects.  

How to set it up:


- Make an account on Tropo.  Add an application, set the URL to point to your server.  

-  Choose a port to listen on and either proxy the URL to that port, or just run it on port 80

- In TPSmsService enter your Sms service token from tropo in the tropoToken method.

-  In a workspace run TPKomWaitForSms startOn: yourChosenPortNumber
	That starts an instance of Komanche listening on the port you choose and running TPKomWaitForSms class>>handleRequest: 
	when a request comes in.  


-  In a workspace do
		TPKomSendSmsJson  to: yourPhoneNumber withMessage: 'I sent a SMS message from smalltalk.'
		
		yourPhoneNumber must be in the usa, have the area code, and start with +1
		tropo will split the message into 160 character chunks at the nearest workd break if you're sending a long message.