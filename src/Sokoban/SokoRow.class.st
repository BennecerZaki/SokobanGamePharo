Class {
	#name : #SokoRow,
	#superclass : #Object,
	#instVars : [
		'elements'
	],
	#category : #Sokoban
}

{ #category : #'as yet unclassified' }
SokoRow class >> fromString: aString [
	
	| aList |
	aList := OrderedCollection new.
	aString do: [ :i | 		
		aList add: (
			SokoEntity entityFromCharacter: i
		)
	].

	^ aList
]

{ #category : #'as yet unclassified' }
SokoRow class >> fromString: aString andIndex: anIndex [
	
	| aList aCount |
	aCount := 0.
	aList := OrderedCollection new.
	aString do: [ :i | 
		aCount := aCount + 1.		
		aList add: (
			SokoEntity entityFromCharacter: i andX: aCount andY: anIndex
		)
	].

	^ aList
]

{ #category : #'as yet unclassified' }
SokoRow class >> rowToString: aRow [
	
	String streamContents: [:s | 
		aRow do: [:each | 
			Transcript show: each characterFromEntity
		]
	]
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
    | list | 
    list := elements collect: [ :entity | entity idChar ].
    ^String newFrom:  list
]
