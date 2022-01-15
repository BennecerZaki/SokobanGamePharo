Class {
	#name : #Shelf,
	#superclass : #Entity,
	#category : #Sokoban
}

{ #category : #'as yet unclassified' }
Shelf class >> idChar [
	^ $.
]

{ #category : #'as yet unclassified' }
Shelf >> characterFromEntity [
	^ 'o'
]
