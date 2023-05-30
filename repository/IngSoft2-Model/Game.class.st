Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'board',
		'spaceships',
		'dice'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Game class >> createGame [
	^(self new) 
]

{ #category : #'instance creation' }
Game class >> createGameOf: aBoardSize and: aNumberOfSpaceships and: DiceFaces [
	aBoardSize > 1 & aNumberOfSpaceships > 0 & DiceFaces notNil ifTrue: [ ^(self new) intializeGameWith: aBoardSize and: aNumberOfSpaceships and: DiceFaces ]  
	ifFalse: [ Error signal: 'Conditions not met' ].
	 
]

{ #category : #initialize }
Game >> intializeGameWith: aBoardSize and: aNumberOfSpaceships and: aDieFaces [ 
	board := Board createBoardOf: aBoardSize.
	spaceships:= Array new: aNumberOfSpaceships.
		1 to: aNumberOfSpaceships  do: [ :newSpaceship | |aSpaceship| 
		aSpaceship:= Spaceship createSpaceshipWithName: newSpaceship.
		spaceships at: newSpaceship put: aSpaceship ].
		dice := OrderedCollection new.
	aDieFaces do: [ : newDieWithFaces | | aDie |
		aDie := Die createDieOf: newDieWithFaces.
		dice add: aDie].
]
