as yet unclassified
to: aPhoneNumber withMessage: aString
	^self new sendSms: aString to: aPhoneNumber usingToken: self tropoToken 