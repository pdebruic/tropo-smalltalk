baselines
baseline100: spec
	<version: '1.0-baseline'>
	spec
		for: #common
		do: [ 
			spec blessing: #baseline.
			spec repository: 'http://www.squeaksource.com/Tropo'.
			spec
				project: 'ZincHTTPComponents'
					with: [ 
							spec
								className: 'ConfigurationOfZincHTTPComponents';
								repository: 'http://www.squeaksource.com/ZincHTTPComponents' ];
				yourself.
			spec package: 'Tropo' ].
	spec
		for: #pharo
		do: [ 
			spec
				project: 'KomHttpServer'
				with: [ 
					spec
						className: 'ConfigurationOfKomHttpServer';
						repository: 'http://www.squeaksource.com/KomHttpServer' ].
			spec
				package: 'JSON' with: [ spec repository: 'http://www.squeaksource.com/JSON' ];
				package: 'Tropo' with: [ spec requires: #('JSON' 'ZincHTTPComponents') ];
				package: 'Tropo-Kom' with: [ spec requires: #('KomHttpServer' 'Tropo') ].
			spec
				group: 'default' with: #('Core');
				group: 'Core' with: #('Tropo');
				group: 'Kom' with: #('Tropo-Kom') ].
	spec
		for: #gemstone
		do: [ 
			spec
				project: 'Seaside30'
				with: [ 
					spec
						className: 'ConfigurationOfSeaside30';
						repository: 'http://www.squeaksource.com/Seaside30' ];
				 project: 'XMLSupport'
					with: [ 
							spec
								className: 'ConfigurationOfXMLSupport';
								repository: 'http://www.squeaksource.com/XMLSupport' ].
			spec
				package: 'Tropo' with: [ spec requires: #('ZincHTTPComponents' 'Seaside30' 'XMLSupport') ];
				package: 'Tropo-Gemstone' with: [ spec requires: #('Tropo') ].
			spec
				group: 'default' with: #('Core');
				group: 'Core' with: #('Tropo-Gemstone') ]