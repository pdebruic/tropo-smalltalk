as yet unclassified
sendSms: aString to: aPhoneNumber usingToken: aToken
	^ HTTPSocket httpGetDocument: self class tropoUrl args: (self smsArgsWith: aString to: aPhoneNumber using: aToken)