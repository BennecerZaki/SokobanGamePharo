Class {
	#name : #Sokoboard,
	#superclass : #Object,
	#instVars : [
		'level'
	],
	#category : #Sokoban
}

{ #category : #'class initialization' }
Sokoboard class >> level1 [

	^ self new level:
'   #####
###   #
#.ox  #
### x.#
#.##x #
# # . ##
#x *xx.#
#   .  #
########'	
]

{ #category : #api }
Sokoboard >> display [

	Transcript clear; show: level.
]

{ #category : #actions }
Sokoboard >> level [
	^ level
]

{ #category : #setter }
Sokoboard >> level: aString [ 
	level := aString
]
