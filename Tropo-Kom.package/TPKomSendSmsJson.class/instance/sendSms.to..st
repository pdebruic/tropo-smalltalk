as yet unclassified
sendSms: aString to: aPhoneNumber
	| x y json |
	self startNewSession
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
			 TPSmsService queueOutgoingMessage: json ]