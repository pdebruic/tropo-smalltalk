as yet unclassified
startNewSession
	| dict response json |
	dict := GRSmallDictionary new.
	dict at: 'token' put: self class tropoToken.
	response := ZnEasy post: self class tropoRestUrl data: (ZnEntity text: dict asJson).
	json := Json readFrom: response entity string readStream.
	^ json at: 'id' ifAbsent: [ nil ]