Class {
	#name : #EntityTest,
	#superclass : #TestCase,
	#instVars : [
		'coorX',
		'coorY'
	],
	#category : #Sokoban
}

{ #category : #accessing }
EntityTest class >> testingStartingWithFiveTwo [

	| c |
	c := Entity initializeWithX: 5 andY: 2.
	self assert: c coorX equals: 5.
	self assert: c coorY equals: 2.
]

{ #category : #tests }
EntityTest >> testCoorXIsSetAndRead [

	| x |

	x := Entity new.
	x coorX: 10.
	self assert: x coorX equals: 10 
]
