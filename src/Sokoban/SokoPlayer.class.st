"
Player Class.
"
Class {
	#name : #SokoPlayer,
	#superclass : #SokoEntity,
	#category : #Sokoban
}

{ #category : #identity }
SokoPlayer class >> idChar [
	^ $o
]

{ #category : #operations }
SokoPlayer >> characterFromEntity [
	^ 'o'
]

{ #category : #testing }
SokoPlayer >> isPlayer [
	^ true
]

{ #category : #operations }
SokoPlayer >> moveX: aCoorX Y: aCoorY [ 

	coorX := coorX + aCoorX.
	coorY := coorY + aCoorY
]
