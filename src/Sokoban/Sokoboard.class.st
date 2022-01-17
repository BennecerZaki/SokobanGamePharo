"
SokoBoard is a concrete class which represent the sokoban game board and supports moving player in the board, no collision with walls, can stands in shelf

Internal Representation and Key Implementation Points.

    Instance Variables
	playerEntity:		<Object>
	rows:		<Object>


    Implementation Points
"
Class {
	#name : #Sokoboard,
	#superclass : #Object,
	#instVars : [
		'rows',
		'playerEntity'
	],
	#classVars : [
		'board'
	],
	#category : #Sokoban
}

{ #category : #api }
Sokoboard class >> createLevel: aLevel [

	| count newRows instance |
	instance := self new.
	count := 0.
	newRows := OrderedCollection new.
	(aLevel findTokens: Character cr) do: [ :line | 
		line isNotEmpty ifTrue: [ 
			newRows add:
				(SokoRow rowFromString: line forId: (count := count + 1)) ] ].
	instance rows: newRows.
	self findPlayer: instance.
	^ instance
]

{ #category : #api }
Sokoboard class >> findPlayer: instance [

	instance rows do: [ :row | 
		row elements do: [ :position | 
			position entity isNotNil & (position entity class = SokoPlayer) 
				ifTrue: [ instance playerEntity: position entity ] ] ].
	^ instance playerEntity
]

{ #category : #'class initialization' }
Sokoboard class >> level1 [

	^ self createLevel: '
  #####
###   #
#.o x #
### x.#
#.##x #
# # . ##
#x *xx.#
#   .  #
########'
]

{ #category : #'accessing - structure variables' }
Sokoboard >> d [

	| newx newy |
	newx := self playerEntity position x + 1 .
	newy := self playerEntity position y. 
	(self playerCanMoveNewX:newx newY:newy) ifTrue:[ self movePlayerX: newx Y:newy].

]

{ #category : #'accessing - structure variables' }
Sokoboard >> display [

	Transcript clear.
	rows do: [ :row | Transcript show: row toString; cr.  ]
]

{ #category : #'accessing - structure variables' }
Sokoboard >> entityAtX: x andY:y [

	(x <= rows size) ifTrue: [ 
		(y <= ((rows at: x) elements size)) ifTrue: [^(rows at: x) elements at: y]].
	^nil
	
]

{ #category : #'accessing - structure variables' }
Sokoboard >> l [ 

	| newx newy |
	newx := self playerEntity position x .
	newy := self playerEntity position y - 1. 
	(self playerCanMoveNewX:newx newY:newy) ifTrue:[ self movePlayerX: newx Y:newy]
]

{ #category : #'accessing - structure variables' }
Sokoboard >> move: aDirection [

	aDirection = 'l' ifTrue: [ self l ].
	aDirection = 'r' ifTrue: [ self r ].
	aDirection = 'u' ifTrue: [ self u ].
	aDirection = 'd' ifTrue: [ self d ].
	self display
]

{ #category : #'accessing - structure variables' }
Sokoboard >> movePlayerX: newX Y: newY [

	| src dest |
	(self playerCanMoveNewX: newX newY: newY) ifFalse: [ ^ self ].
	src := self playerEntity position. 
	dest := self entityAtX: newX andY: newY.
	dest entity: (self playerEntity) .
	src entity: nil. 
	^src
]

{ #category : #'accessing - structure variables' }
Sokoboard >> playerCanMoveNewX: x newY: y [

	^ (self entityAtX: x andY:y) canMove
]

{ #category : #accessing }
Sokoboard >> playerEntity [

	^ playerEntity
]

{ #category : #accessing }
Sokoboard >> playerEntity: anObject [

	playerEntity := anObject
]

{ #category : #'accessing - structure variables' }
Sokoboard >> put: entity atX: x andY: y [
	| temp | 
	
	entity x: x; y: y.	
	temp := (rows at: x) elements at: y. 
	(rows at: x) elements at: y put: entity.
	^temp
]

{ #category : #'accessing - structure variables' }
Sokoboard >> r [

	| newx newy |
	newx := self playerEntity position x  .
	newy := self playerEntity position y +1. 
	(self playerCanMoveNewX:newx newY:newy) ifTrue:[ self movePlayerX: newx Y:newy].

]

{ #category : #accessing }
Sokoboard >> rows [

	^ rows
]

{ #category : #accessing }
Sokoboard >> rows: anObject [

	rows := anObject
]

{ #category : #'accessing - structure variables' }
Sokoboard >> u [

	| newx newy |
	newx := self playerEntity position x - 1 .
	newy := self playerEntity position y. 
	(self playerCanMoveNewX:newx newY:newy) ifTrue:[ self movePlayerX: newx Y:newy].

]
