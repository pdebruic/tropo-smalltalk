*tropo-gemstone
stopOn: aPortNumber
System abortTransaction.
ZnServer defaultServerClass allInstances do: [:eachService | eachService port = aPortNumber ifTrue:[eachService stop]].