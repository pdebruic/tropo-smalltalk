as yet unclassified
startOn: aPort log: aBoolean

self startOn: aPort.
aBoolean ifTrue:[self httpService logToTranscript.]