as yet unclassified
stopOn: aPortNumber
ZnServer defaultServerClass allInstances do: [:eachService | eachService port = aPortNumber ifTrue:[eachService stop]].