as yet unclassified
stopOn: aPortNumber
HttpService allInstances do: [:eachService | eachService portNumber = aPortNumber ifTrue:[eachService unregister]].