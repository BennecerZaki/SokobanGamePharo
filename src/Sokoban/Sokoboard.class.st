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
		'shelfs'
	],
	#category : #Sokoban
}

{ #category : #'class initialization' }
Sokoboard class >> level1 [

	^ self new level:'#######
#     #
#  o  #
#     #
#######'; isCompleted: false; width: 0; height: 0
]

{ #category : #api }
Sokoboard >> display [

	Transcript clear; show: level.
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
