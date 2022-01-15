Class {
	#name : #Space,
	#superclass : #Entity,
	#category : #Sokoban
}

{ #category : #'as yet unclassified' }
Space class >> idChar [
	^ $ .
]

{ #category : #'as yet unclassified' }
Space >> characterFromEntity [
	^ ' '
]
