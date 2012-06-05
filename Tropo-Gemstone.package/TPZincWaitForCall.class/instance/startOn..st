*tropo-gemstone
startOn: aPort



self server: (ZnServer startOn: aPort).
self server delegate: self.
self server start.
	[true] whileTrue: [ (Delay forSeconds: 10) wait ].
