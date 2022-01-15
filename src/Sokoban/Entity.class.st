"
I am an abstract class representing all the pieces of the sokoban game.
"
Class {
	#name : #Entity,
	#superclass : #Object,
	#instVars : [
		'coorX',
		'coorY'
	],
	#category : #Sokoban
}

{ #category : #'as yet unclassified' }
Entity class >> entityFromCharacter: aCharacter [

	self subclasses do: [ :item |
		(aCharacter = (item idChar)) ifTrue: [ 
			^ item new.	 
		]
	].

	^ nil
]

{ #category : #'as yet unclassified' }
Entity class >> entityFromCharacter: aCharacter andX: aCoorX andY: aCoorY [

	self subclasses do: [ :item |
		(aCharacter = (item idChar)) ifTrue: [ 
			^ item new coorX: aCoorX; coorY: aCoorY. 
		]
	].

	^ nil
]

{ #category : #'as yet unclassified' }
Entity class >> idChar [
	^ self subclassResponsibility 
]

{ #category : #initialization }
Entity class >> initializeWithX: aCoorX [
	
	^ self new coorX: aCoorX
]

{ #category : #initialization }
Entity class >> initializeWithX: aCoorX andY: aCoorY [
	
	^ self new coorX: aCoorX; coorY: aCoorY 
]

{ #category : #operations }
Entity >> characterFromEntity [
	^ self subclassResponsibility 
]

{ #category : #accessing }
Entity >> coorX [

	^ coorX 
]

{ #category : #accessing }
Entity >> coorX: aCoorX [

	coorX := aCoorX
]

{ #category : #accessing }
Entity >> coorY [

	^ coorY 
]

{ #category : #accessing }
Entity >> coorY: aCoorY [

	coorY := aCoorY
]

{ #category : #operations }
Entity >> isBottomCollision: anEntity [ 
	^ (((coorY + 1) == (anEntity coorY)) & (coorX == (anEntity coorX)))
]

{ #category : #operations }
Entity >> isLeftCollision: anEntity [ 
	^ (((coorX - 1) == (anEntity coorX)) & (coorY == (anEntity coorY)))
]

{ #category : #operations }
Entity >> isRightCollision: anEntity [ 
	^ (((coorX + 1) == (anEntity coorX)) & (coorY == (anEntity coorY)))
]

{ #category : #operations }
Entity >> isTopCollision: anEntity [ 
	^ (((coorY - 1) == (anEntity coorY)) & (coorX == (anEntity coorX)))
]
