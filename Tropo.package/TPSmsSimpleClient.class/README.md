You can send sms to numbers in the USA .  

See here: http://blog.tropo.com/2010/11/19/simple-post-and-get-interface-to-tropo-sms/

After registering at tropo.com create a new Tropo Scripting application that uses the simpleMessage.php script found on their github.


Then you can use TPSendSms class>>to:withMessage: to send an SMS.  You need to set a voice/sms number on tropo and also change the token on the class side of TPSendSms. 

Uses HTTPSocket.  


If you're going to use this you can also use TPKomWaitForSms class >> handleRequestSimpleMessage:  to receive SMS messages from tropo.  The drawback vs using the TPSendJsonSms  is that you can only send and receive SMS messages, but not use any of their other features that you can add by sending tropo TropoML JSON objects.  