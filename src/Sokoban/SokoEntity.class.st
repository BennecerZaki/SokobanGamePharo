"
I am an abstract class representing movable pieces of the sokoban game.
"
Class {
	#name : #SokoEntity,
	#superclass : #Object,
	#instVars : [
		'position',
		'target'
	],
	#category : #Sokoban
}

{ #category : #operations }
SokoEntity class >> entityForId: aChar [

	self subclassesDo: [ :subclass | aChar = subclass idChar ifTrue: [ ^subclass new] ].
	^nil
]

{ #category : #operations }
SokoEntity class >> entityForId: aChar atX: xpos andY: ypos [
	
	| instance | 
	self subclassesDo: [ :subclass | aChar = subclass idChar ifTrue: [ instance := subclass new.
			instance coorX: xpos; coorY: ypos] ].
	^instance
]

{ #category : #identity }
SokoEntity class >> idCharacter [

	^ self subclassResponsibility 
	
]

{ #category : #testing }
SokoEntity >> canMove [ 
	^false.
]

{ #category : #accessing }
SokoEntity >> id [

	^self class idCharacter.
]

{ #category : #initialization }
SokoEntity >> initialize [ 
	target := false. 
]

{ #category : #testing }
SokoEntity >> instanceId [

	^ self class idChar
]

{ #category : #accessing }
SokoEntity >> position [

	^ position
]

{ #category : #accessing }
SokoEntity >> position: anObject [

	position := anObject
]

{ #category : #accessing }
SokoEntity >> target [

	^ target
]

{ #category : #accessing }
SokoEntity >> target: anObject [

	target := anObject
]
