"
Box Class.
"
Class {
	#name : #SokoBox,
	#superclass : #SokoEntity,
	#category : #Sokoban
}

{ #category : #identity }
SokoBox class >> idChar [
	^ $x
]

{ #category : #operations }
SokoBox >> characterFromEntity [
	^ 'x'
]

{ #category : #operations }
SokoBox >> moveX: aCoorX Y: aCoorY [ 

	coorX := coorX + aCoorX.
	coorY := coorY + aCoorY
]
