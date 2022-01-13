"
Box Class.
"
Class {
	#name : #Box,
	#superclass : #Entity,
	#category : #Sokoban
}

{ #category : #action }
Box >> moveX: aCoorX Y: aCoorY [ 
	
	coorX := coorX + aCoorX.
	coorY := coorY + aCoorY
	
]
