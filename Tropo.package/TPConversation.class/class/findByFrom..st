as yet unclassified
findByFrom: aFromNumber
|tmp|
	^ self instances detect: [ :each | each from = aFromNumber  ] ifNone: [ tmp:=self new from: aFromNumber.
																	self instances add: tmp. ]