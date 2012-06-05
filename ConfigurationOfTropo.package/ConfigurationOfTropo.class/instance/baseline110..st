baselines
baseline110: spec
	<version: '1.1-baseline'>
	spec
		for: #common
		do: [ 
			spec blessing: #baseline.
			spec repository: 'http://www.squeaksource.com/Tropo' ].
	spec
		for: #pharo
		do: [ 
			
			spec
				package: 'JSON' with: [ spec repository: 'http://www.squeaksource.com/JSON' ];
				package: 'Tropo' with: [ spec requires: #('JSON') ].
			spec
				group: 'default' with: #('Core');
				group: 'Core' with: #('Tropo').
				 ].
	spec
		for: #gemstone
		do: [ 
			spec
				project: 'ZincHTTPComponents'
					with: [ 
							spec
								className: 'ConfigurationOfZincHTTPComponents';
								repository: 'http://www.squeaksource.com/ZincHTTPComponents' ].
			spec
				package: 'Tropo' with: [ spec requires: #('ZincHTTPComponents') ];
				package: 'Tropo-Gemstone' with: [ spec requires: #('Tropo') ].
			spec
				group: 'default' with: #('Core');
				group: 'Core' with: #('Tropo-Gemstone') ]