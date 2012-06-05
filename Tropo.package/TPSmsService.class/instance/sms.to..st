as yet unclassified
sms: aMessage to: aPhoneNumber
|x y|
x:=Dictionary new.
y:=Dictionary new.
y at:'message' put:(TPMessage new network: 'SMS';
				to: aPhoneNumber;
				channel:'TEXT';
				say: (TPSay new value: aMessage )).
x at: 'tropo' put: y.
^x asJson