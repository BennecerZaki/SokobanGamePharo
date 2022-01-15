"
Player Class.
"
Class {
	#name : #Player,
	#superclass : #Entity,
	#category : #Sokoban
}

{ #category : #'as yet unclassified' }
Player class >> idChar [
	^ $o
]

{ #category : #operations }
Player >> characterFromEntity [
	^ 'o'
]

{ #category : #operations }
Player >> moveX: aCoorX Y: aCoorY [ 

	coorX := coorX + aCoorX.
	coorY := coorY + aCoorY
]
