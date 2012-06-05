as yet unclassified
handleRequest: aRequest
	| jsonData userType from conversation stream sessionId response |
	"should only be a POST from tropo"
	
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
			
			conversation := from isNil
				ifTrue: [ TPSmsConversation findById: sessionId ]
				ifFalse: [ (TPSmsConversation findByFrom: from) id: sessionId ].
			conversation requests add: jsonData.
		
			response := userType = 'NONE'
				ifTrue: [ TPSmsService outgoingMessageForId: conversation id ]
				ifFalse: [ TPSmsService findNextResponseFor: conversation. ].
				response ifNotNil:[response:=response value].
			conversation responses add: response.

			conversation from isNil
				ifFalse: [conversation printLastMessageToTranscipt].
			conversation inspect ].
	
	^ ZnResponse ok: response