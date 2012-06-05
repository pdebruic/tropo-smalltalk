as yet unclassified
jsonWriteOn: aStream
	| x y vars |
	vars := self class allInstVarNames.
	x := Dictionary new.
	y := Dictionary new.
	vars
		do: [ :each | 
			(self perform: each asSymbol) isNil
				ifFalse: [ x at: each put: (self perform: each asSymbol) ] ].
	"y at: self tropoMethod put: x."
	x jsonOn: aStream