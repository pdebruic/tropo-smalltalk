as yet unclassified
findById: aSessionId
|tmp|
	^ self instances detect: [ :each | each id = aSessionId ] ifNone: [tmp:=self new id: aSessionId.
																	self instances add: tmp. ]