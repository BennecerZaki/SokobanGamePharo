Class {
	#name : #Row,
	#superclass : #Object,
	#instVars : [
		'elements'
	],
	#category : #Sokoban
}

{ #category : #'as yet unclassified' }
Row class >> fromString: aString [
	
	| aList |
	aList := OrderedCollection new.
	aString do: [ :i | 		
		aList add: (
			Entity entityFromCharacter: i
		)
	].

	^ aList
]

{ #category : #'as yet unclassified' }
Row class >> fromString: aString andIndex: anIndex [
	
	| aList aCount |
	aCount := 0.
	aList := OrderedCollection new.
	aString do: [ :i | 
		aCount := aCount + 1.		
		aList add: (
			Entity entityFromCharacter: i andX: aCount andY: anIndex
		)
	].

	^ aList
]

{ #category : #'as yet unclassified' }
Row class >> rowToString: aRow [
	
	String streamContents: [:s | 
		aRow do: [:each | 
			Transcript show: each characterFromEntity
		]
	]
]

{ #category : #printing }
Row >> elements [ 
	^ elements
]

{ #category : #printing }
Row >> elements: aCollection [
	elements := aCollection
]

{ #category : #printing }
Row >> toString [
    | list | 
    list := elements collect: [ :entity | entity idChar ].
    ^String newFrom:  list
]
