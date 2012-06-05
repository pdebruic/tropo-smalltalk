versions
version100: spec 
	<version: '1.0' imports: #('1.0-baseline') >
	
	spec for: #common do: [
		spec blessing: #release.
		spec
			project:'ZincHTTPComponents' with:'1.0'.
		spec 
			
			package: 'Tropo' with: 'Tropo-PaulDeBruicker.12'].
		
	spec for: #pharo do:[
		spec
			project: 'KomHttpServer' with: '1.0.8';
			package: 'JSON' with:'JSON-ul.35';
			package: 'Tropo-Kom' with: 'Tropo-Kom-PaulDeBruicker.1'
		].
	spec for: #gemstone do:[
		spec
			project:'Seaside30' with:'3.0.4';
			project:'XMLSupport' with:'1.2.0';
			package:'Tropo-Gemstone' with: 'Tropo-Gemstone-PaulDeBruicker.5'
		].