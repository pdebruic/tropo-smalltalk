as yet unclassified
startOn: aPort

self stopOn: aPort.


self httpService: (ZnServer startOn: aPort).
self httpService delegate: self.
