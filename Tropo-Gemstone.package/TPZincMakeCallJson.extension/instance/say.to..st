*tropo-gemstone
say: aString to: aPhoneNumber
	| x y json |
	self startNewSession
		ifTrue: [ 
			x := Dictionary new.
			y := Dictionary new.
			y
				at: 'message'
				put:
					((TPMessage new)
						to: aPhoneNumber;
						channel: 'VOICE';
						say: (TPSay new value: aString)).
			x at: 'tropo' put: y.
			json := x asJson.
			 TPVoiceService queueOutgoingCall: (ZnStringEntity text: json) ]