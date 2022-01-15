"
Box Class.
"
Class {
	#name : #Box,
	#superclass : #Entity,
	#category : #Sokoban
}

{ #category : #'as yet unclassified' }
Box class >> idChar [
	^ $x
]

{ #category : #operations }
Box >> characterFromEntity [
	^ 'x'
]

{ #category : #operations }
Box >> moveX: aCoorX Y: aCoorY [ 

	coorX := coorX + aCoorX.
	coorY := coorY + aCoorY
]
