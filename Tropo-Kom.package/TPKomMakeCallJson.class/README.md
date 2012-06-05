You can make telephone calls to numbers in the USA. 


This allows you to make telephone calls without using a hosted script which allows you to develop the back end of your application in smalltalk and just send tropo TropoML JSON objects.  


It also illustrates how to create and send TropoML JSON objects.  

How to set it up:


- Make an account on Tropo.  Add an application, set the URL to point to your server.  

-  Choose a port to listen on and either proxy the URL to that port, or just run it on port 80

- In TPVoiceService enter your Voice service token from tropo in the tropoToken method.

-  In a workspace run TPKomWaitForCall startOn: yourChosenPortNumber
	That starts an instance of Komanche listening on the port you choose and running TPKomWaitForCall class>>handleRequest: 
	when a request comes in.  


-  In a workspace do
		TPKomMakeCallJson  to: yourPhoneNumber withMessage: 'I sent a SMS message from smalltalk.'
		
		yourPhoneNumber must be in the usa, have the area code, and start with +1
		tropo will split the message into 160 character chunks at the nearest workd break if you're sending a long message.
		
	There are many more options you can set and you can script a conversation.  The docs on Tropo.com are good and the skeletons for the JSON objects are set up in this package.