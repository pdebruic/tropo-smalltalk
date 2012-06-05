as yet unclassified
sendSms: aString to: aPhoneNumber
	| x y json id |
id:=self startNewSession.
	id notNil
		ifTrue: [ 
			x := Dictionary new.
			y := Dictionary new.
			y
				at: 'message'
				put:
					((TPMessage new)
						network: 'SMS';
						to: aPhoneNumber;
						channel: 'TEXT';
						say: (TPSay new value: aString)).
			x at: 'tropo' put: y.
			json := x asJsonString.
		
			 TPSmsService queueOutgoingMessage: id withBlanksTrimmed -> (ZnStringEntity text: json) ]