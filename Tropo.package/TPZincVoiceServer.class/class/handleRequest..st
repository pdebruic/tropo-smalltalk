as yet unclassified
handleRequest: aRequest
	| jsonData userType from conversation stream sessionId response |
	"should only be a POST from tropo"
"	self halt."
	aRequest method == #POST
		ifTrue: [ 
			stream := aRequest entity readStream.	
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
	^ ZnResponse ok: response