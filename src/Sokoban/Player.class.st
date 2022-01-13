Class {
	#name : #Player,
	#superclass : #Entity,
	#category : #Sokoban
}

{ #category : #actions }
Player >> moveDown [

	coorY := coorY - 1
]

{ #category : #'as yet unclassified' }
Player >> moveLeft [

	coorX := coorX - 1
]

{ #category : #'as yet unclassified' }
Player >> moveRight [

	coorX := coorX + 1
]

{ #category : #actions }
Player >> moveUp [

	coorY := coorY + 1
]
