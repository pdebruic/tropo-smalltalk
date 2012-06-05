versions
version110: spec
	<version: '1.1' imports: #('1.1-baseline')>
	spec
		for: #common
		do: [ 
			spec blessing: #release.
			spec package: 'Tropo' with: 'Tropo-PaulDeBruicker.17' ].
	spec for: #pharo do: [ spec package: 'JSON' with: 'JSON-ul.35' ].
	spec
		for: #gemstone
		do: [ 
			spec
				project: 'ZincHTTPComponents' with: '1.1';
				package: 'Tropo-Gemstone' with: 'Tropo-Gemstone-PaulDeBruicker.5' ]