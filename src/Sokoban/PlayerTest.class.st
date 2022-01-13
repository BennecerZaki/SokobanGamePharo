Class {
	#name : #PlayerTest,
	#superclass : #TestCase,
	#instVars : [
		'coorX',
		'coorY'
	],
	#category : #Sokoban
}

{ #category : #tests }
PlayerTest >> testPlayerMoveDown [

	| p |
	
	p := Player initializeWithX: 2 andY: 5.
	p moveDown; moveDown.
	self assert: p coorX equals: 2.
	self assert: p coorY equals: 3.
]

{ #category : #tests }
PlayerTest >> testPlayerMoveLeft [

	| p |
	
	p := Player initializeWithX: 2 andY: 5.
	p moveLeft; moveLeft.
	self assert: p coorX equals: 0.
	self assert: p coorY equals: 5.
]

{ #category : #tests }
PlayerTest >> testPlayerMoveRight [

	| p |
	
	p := Player initializeWithX: 2 andY: 5.
	p moveRight; moveRight.
	self assert: p coorX equals: 4.
	self assert: p coorY equals: 5.
]

{ #category : #tests }
PlayerTest >> testPlayerMoveUp [

	| p |
	
	p := Player initializeWithX: 2 andY: 5.
	p moveUp; moveUp.
	self assert: p coorX equals: 2.
	self assert: p coorY equals: 7.
]
