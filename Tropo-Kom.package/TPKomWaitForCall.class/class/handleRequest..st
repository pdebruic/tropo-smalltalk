as yet unclassified
handleRequest: aRequest
	| jsonData userType from conversation stream sessionId response |
	"should only be a POST from tropo"
"	self halt."
	aRequest isPostRequest
		ifTrue: [ 
			stream := aRequest stream.	
			jsonData := Json readFrom: stream.
	
			(jsonData at: 'session') notNil
				ifTrue: [ 
					from := (jsonData at: 'session') at: 'from'.
					sessionId := (jsonData at: 'session') at: 'id'.
					userType := (jsonData at: 'session') at: 'userType' ]
				ifFalse: [ sessionId := (jsonData at: 'result') at: 'sessionId' ].
			"	self halt."
			conversation := from isNil
				ifTrue: [ TPVoiceConversation findById: sessionId ]
				ifFalse: [ (TPVoiceConversation findByFrom: from) id: sessionId ].
			conversation requests add: jsonData.
			response := userType = 'NONE'
				ifTrue: [ TPVoiceService oldestOutgoingCall ]
				ifFalse: [ TPVoiceService findNextResponseFor: conversation. ].
			conversation responses add: response.
			"conversation printLastMessageToTranscipt."
			conversation inspect ].
		"self halt."
	^ HttpResponse fromString: response