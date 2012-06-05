as yet unclassified
handleRequestJson: aRequest
	| jsonData userType from conversation stream sessionId response |
	"should only be a POST from tropo"
	
	aRequest method == #POST
		ifTrue: [ 
			stream := aRequest entity readStream.	"self halt."
			jsonData := Json readFrom: stream.
		"	self halt."
			(jsonData at: 'session') notNil
				ifTrue: [ 
					from := (jsonData at: 'session') at: 'from'.
					sessionId := (jsonData at: 'session') at: 'id'.
					userType := (jsonData at: 'session') at: 'userType' ]
				ifFalse: [ sessionId := (jsonData at: 'result') at: 'sessionId' ].
			"	self halt."
			conversation := from isNil
				ifTrue: [ TPSmsConversation findById: sessionId ]
				ifFalse: [ (TPSmsConversation findByFrom: from) id: sessionId ].
			conversation requests add: jsonData.
			response := userType = 'NONE'
				ifTrue: [ TPSmsService oldestOutgoingMessage ]
				ifFalse: [ TPSmsService findNextResponseFor: conversation. ].
			conversation responses add: response.
		"	self halt."
			conversation from isNil
				ifFalse: [conversation printLastMessageToTranscipt].
			conversation inspect ].
	"	self halt."
	^ ZnResponse ok: response