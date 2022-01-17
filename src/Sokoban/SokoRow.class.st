"
This class is a representation of a line in the board through the SokoSpace parts.

Internal Representation and Key Implementation Points.

Instance Variables
elements:  <Object>

Implementation Points
"
Class {
	#name : #SokoRow,
	#superclass : #Object,
	#instVars : [
		'elements'
	],
	#category : #Sokoban
}

{ #category : #'as yet unclassified' }
SokoRow class >> rowFromString: aString forId: anIndex [

	| instance count |
	count := 0.
	instance := self new.
	instance elements: (aString asOrderedCollection collect: [ :aChar | 
			 SokoSpace
				 initializeWithId: aChar
				 atX: anIndex  
				 andY: (count := count + 1) ]).
	^ instance
]

{ #category : #printing }
SokoRow >> elements [ 
	^ elements
]

{ #category : #printing }
SokoRow >> elements: aCollection [
	elements := aCollection
]

{ #category : #printing }
SokoRow >> toString [

	^String newFrom: (self elements collect: [ :item | item id ])
]
