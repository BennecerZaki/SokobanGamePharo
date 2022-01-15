Class {
	#name : #Sokoboard,
	#superclass : #Object,
	#instVars : [
		'level',
		'width',
		'height',
		'walls',
		'player',
		'isCompleted',
		'boxes',
		'shelfs',
		'board'
	],
	#category : #Sokoban
}

{ #category : #'class initialization' }
Sokoboard class >> level1 [

	^ self new boardFromLevel: '#######
#     #
#  o  #
#     #
#######'
]

{ #category : #accessing }
Sokoboard >> board [
	^ board
]

{ #category : #'as yet unclassified' }
Sokoboard >> boardFromLevel: aLevel [

	| rowId |
	
	rowId := 0.
	board := (aLevel findTokens: (Character cr)) collect: [ :item |
		rowId := rowId + 1.
		Row fromString: item andIndex: rowId 
	]
]

{ #category : #api }
Sokoboard >> display [

	| theDisplay |
	Transcript clear.
	theDisplay := self board do: [ :item | 
		Row rowToString: item. Transcript cr
	]
]

{ #category : #accessing }
Sokoboard >> height [
	^ height
]

{ #category : #accessing }
Sokoboard >> height: anInteger [ 
	height := anInteger
]

{ #category : #accessing }
Sokoboard >> isCompleted [
	^ isCompleted
]

{ #category : #accessing }
Sokoboard >> isCompleted: aBoolean [ 
	isCompleted := aBoolean
]

{ #category : #actions }
Sokoboard >> isCompletedMethod [

	|  nbOfBags finishedBags box shelf|
	
	nbOfBags := boxes size.
	finishedBags := 0.

	1 to: nbOfBags do: [ :i | 
		box := boxes at: i.
		1 to: nbOfBags do: [ :j |
			shelf := shelfs at: j.
			(((box coorX) == (shelf coorX)) & ((box coorY) == (shelf coorY))) ifTrue: [ finishedBags := 			finishedBags + 1 ] value.
		]
	].

	(finishedBags == nbOfBags) ifTrue: [ self isCompleted: true ]
]

{ #category : #actions }
Sokoboard >> level [
	^ level
]

{ #category : #setter }
Sokoboard >> level: aString [ 
	level := aString
]

{ #category : #accessing }
Sokoboard >> player [
	| result |
	
	board do: [ :row |
		row do: [ :item | 
			((item class) == Player) ifTrue: [ result := item ]
		].
	].
	^ result
]

{ #category : #accessing }
Sokoboard >> playerMoveX: aCoorX andY: aCoorY [
	
	| indexI indexJ playerTmp |
	indexI := 1.
	indexJ := 1.
	playerTmp := self player.
	board do: [ :row |
		row do: [ :item | 
			((item class) == Player) ifTrue: [ 
				row at: indexJ put: (Space initializeWithX: playerTmp coorX andY: playerTmp coorY). 
			].
			(indexI == (playerTmp coorY + aCoorY )) & (indexJ == (playerTmp coorX + aCoorX )) ifTrue: [ 
				row at: indexJ put: playerTmp. 
			].
			indexJ := indexJ + 1
		].
		indexJ := 1.
		indexI := indexI + 1
	].
	self player moveX: aCoorX  Y: aCoorY
	

]

{ #category : #accessing }
Sokoboard >> width [
	^ width
]

{ #category : #accessing }
Sokoboard >> width: anInteger [ 
	width := anInteger
]
