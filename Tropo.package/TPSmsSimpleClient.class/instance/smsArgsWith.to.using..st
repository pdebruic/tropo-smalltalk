as yet unclassified
smsArgsWith: a160CharacterLongString to: aPhoneNumber using: aToken

	|x|
	x:=Dictionary new.
	x at: 'action' put: 'create'.
	x at: 'token' put: aToken.
	x at: 'to' put: aPhoneNumber.
	x at: 'msg' put: a160CharacterLongString.
	x at: 'network' put:'SMS'.
	^x
	