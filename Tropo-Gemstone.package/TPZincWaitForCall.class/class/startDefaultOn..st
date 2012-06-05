*tropo-gemstone
startDefaultOn: aPort

self stopDefault.

self httpService: (ZnServer defaultOn: aPort).
self httpService delegate: self.
self httpService start.
