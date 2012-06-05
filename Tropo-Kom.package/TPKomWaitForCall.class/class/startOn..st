as yet unclassified
startOn: aPort
|ma authDb |
self stopOn: aPort.

"authDb := KomAuthDb new.
authDb addUser:'admin' withPassword:'seaside'."
ma :=ModuleAssembly core.
"ma authenticate: authDb realm:'sms'."
ma trackSessions .
ma sessionTimeout: 20.
ma addPlug:[:request| self handleRequest: request].
self httpService: (HttpService startOn: aPort named:'TPWaitForCall').
self httpService plug: ma rootModule.
self httpService setVerboseMode. 