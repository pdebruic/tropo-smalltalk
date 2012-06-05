*tropo-gemstone
stopDefault
	ZnServer stopDefault.
	self httpService stop.
	self httpService: nil.