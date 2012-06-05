as yet unclassified
handleRequestSimpleMessage: aRequest
	| to from msg fields conversation stream |
	"should only be a POST from tropo"


	aRequest isPostRequest
		ifTrue: [ 
			fields:=aRequest fields.
		msg:=TPMessage new.
		msg from: (fields at: 'from');
			to: (fields at: 'to');
			say: (fields at: 'msg').
		"	self halt."
			conversation := TPSmsConversation findByFrom: msg from.
			conversation messages add: msg.	
		"	self halt."
			conversation printLastMessageToTranscipt.
			conversation inspect.].
 ^HttpResponse fromString: '' 