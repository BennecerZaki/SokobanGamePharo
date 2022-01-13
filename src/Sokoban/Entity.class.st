"
I am an abstract class representing all the pieces of the sokoban game.
"
Class {
	#name : #Entity,
	#superclass : #Object,
	#instVars : [
		'coorX',
		'coorY'
	],
	#category : #Sokoban
}

{ #category : #initialization }
Entity class >> initializeWithX: aCoorX [
	
	^ self new coorX: aCoorX
]

{ #category : #initialization }
Entity class >> initializeWithX: aCoorX andY: aCoorY [
	
	^ self new coorX: aCoorX; coorY: aCoorY 
]

{ #category : #accessing }
Entity >> coorX [

	^ coorX 
]

{ #category : #accessing }
Entity >> coorX: aCoorX [

	coorX := aCoorX
]

{ #category : #accessing }
Entity >> coorY [

	^ coorY 
]

{ #category : #accessing }
Entity >> coorY: aCoorY [

	coorY := aCoorY
]
