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

	^ '#######
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
Sokoboard >> width [
	^ width
]

{ #category : #accessing }
Sokoboard >> width: anInteger [ 
	width := anInteger
]
