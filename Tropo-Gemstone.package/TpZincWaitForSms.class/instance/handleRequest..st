*tropo-gemstone
handleRequest: aRequest
	| jsonData userType from conversation stream sessionId response |
	"should only be a POST from tropo"

	aRequest method == #POST
		ifTrue: [ 
			stream := aRequest entity readStream.	"self halt."
			jsonData := JSJsonParser parseStream: stream.
			"self halt."
			(jsonData at: 'session' ifAbsent:[nil]) notNil
				ifTrue: [ 
					from := (jsonData at: 'session') at: 'from' ifAbsent:[nil].
					sessionId := (jsonData at: 'session') at: 'id' ifAbsent:[nil].
					userType := (jsonData at: 'session') at: 'userType' ifAbsent:[nil]]
				ifFalse: [ sessionId := (jsonData at: 'result') at: 'sessionId'ifAbsent:[nil] ].
			"	self halt."
			conversation := from isNil
				ifTrue: [ TPSmsConversation findById: sessionId ]
				ifFalse: [ (TPSmsConversation findByFrom: from) id: sessionId ].
			conversation requests add: jsonData.
			
			System commitTransaction.
			response := userType = 'NONE'
				ifTrue: [ TPSmsService oldestOutgoingMessage ]
				ifFalse: [ TPSmsService findNextResponseFor: conversation. ].
			conversation responses add: response.
		"	self halt."
		"	conversation from isNil
				ifFalse: [conversation printLastMessageToTranscipt].
			conversation inspect" ].
		
	^ ZnResponse ok: response