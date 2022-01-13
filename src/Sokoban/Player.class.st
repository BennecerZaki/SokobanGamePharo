"
Player Class.
"
Class {
	#name : #Player,
	#superclass : #Entity,
	#category : #Sokoban
}

{ #category : #actions }
Player >> moveX: anInteger Y: anInteger2 [ 
	
	coorX := coorX + anInteger.
	coorY := coorY + anInteger2 
]
