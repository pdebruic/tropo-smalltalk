accessing
outgoingMessageForId: anId
	^OutgoingMessageQueue findFirst:[:each | each key = anId ] 