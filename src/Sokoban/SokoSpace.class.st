"
A concrete simple classe which represents every element in the board
"
Class {
	#name : #SokoSpace,
	#superclass : #Object,
	#instVars : [
		'id',
		'x',
		'y',
		'entity'
	],
	#category : #Sokoban
}

{ #category : #'as yet unclassified' }
SokoSpace class >> ids [

	^ Set newFrom: #($ $. $# $x)
]

{ #category : #'as yet unclassified' }
SokoSpace class >> initializeWithId: anId atX: xpos andY: ypos [
	| instance  |
	instance := self  new. 
	^ instance initializeWithId: anId andX: xpos  andY: ypos  
]

{ #category : #accessing }
SokoSpace >> acceptsEntity [

	^ (self isWall not) & (self entity isNil).
]

{ #category : #accessing }
SokoSpace >> canMove [ 
	^ (self isWall not) & (self entity isNil)
	
]

{ #category : #accessing }
SokoSpace >> entity [

	^ entity
]

{ #category : #accessing }
SokoSpace >> entity: anObject [

	entity := anObject.
	anObject ifNotNil: [anObject position: self].
	^self
]

{ #category : #accessing }
SokoSpace >> hasPlayer [

	^ (self entity isNotNil) & ( self entity class = SokoPlayer )
]

{ #category : #accessing }
SokoSpace >> id [

	entity ifNotNil: [ ^entity id].
	^id
]

{ #category : #accessing }
SokoSpace >> id: anObject [

	id := anObject
]

{ #category : #initialization }
SokoSpace >> initializeWithId: anId andX: xvalue andY: yvalue [

	self
		id: anId;
		x: xvalue;
		y: yvalue.
	SokoPlayer idCharacter = anId ifTrue: [ 
		self id: Character space.
		^ self
			  entity: SokoPlayer new;
			  yourself ].
	SokoBox idCharacter = anId ifFalse: [ ^ self ].
	self id: Character space.
	^ self
		  entity: SokoBox new;
		  yourself
]

{ #category : #initialization }
SokoSpace >> isSpace [ 
	
	^id = Character space. 
]

{ #category : #initialization }
SokoSpace >> isTarget [

	^id = $..
]

{ #category : #initialization }
SokoSpace >> isWall [

	^id = $#
]

{ #category : #initialization }
SokoSpace >> x [

	^ x
]

{ #category : #initialization }
SokoSpace >> x: anObject [

	x := anObject
]

{ #category : #initialization }
SokoSpace >> y [

	^ y
]

{ #category : #initialization }
SokoSpace >> y: anObject [

	y := anObject
]
