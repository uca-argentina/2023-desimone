Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'name',
		'board',
		'spaceships',
		'dice',
		'turn',
		'finish',
		'status'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Game class >> createGameWithBoardandSpaceshipsAndDice: aName and: aSize and: aNumberOfSpaceships and: aDieSize [
	 ^(self new) initializeCreateGameWithSpaceships: aName and: aSize and: aNumberOfSpaceships and: aDieSize.
]

{ #category : #public }
Game >> ThrowDice [
	| sum |
	sum := dice sum: [ :aDie | aDie roll ].
	^sum.
	
]

{ #category : #public }
Game >> dice [
^dice
]

{ #category : #initialize }
Game >> initializeCreateGameWithSpaceships: aName and: aSize and: aNumberOfSpaceships and: aDiceSize [ 
	aSize > 0 ifTrue: [| aBoard| 
	aBoard := Board new.
	board := aBoard.
	board size: aSize.  ]
	ifFalse: [ Error signal: 'Error. Negative size. ' ].
	
	self name: aName.
	aNumberOfSpaceships > 0 ifTrue: [ 	spaceships := Array new: aNumberOfSpaceships.
	1 to: aNumberOfSpaceships  do: [ :index | |aSpaceship| 
		aSpaceship:= Spaceship new.
		aSpaceship number: index.
		aSpaceship score: 0.
		aSpaceship winner: 0.
		spaceships at: index put: aSpaceship ]. ]
	ifFalse: [ Error signal: 'Error. The number of Spaceships cannot be negative or zero. '  ].

	dice := OrderedCollection new.
	aDiceSize do: [ :aDiceFaces| aDiceFaces > 0 ifTrue: [ | aDie |
		aDie := Die new.
		aDie faces: aDiceFaces.
		dice add: aDie ]
	ifFalse: [ Error signal: 'Error. The number of Faces cannot be negative or zero. ' ]
		 ].
	
turn := 1.
status:= 0.
]

{ #category : #public }
Game >> name [
^name.
]

{ #category : #public }
Game >> name: aName [ 
	name:= aName
]

{ #category : #public }
Game >> play: aSpaceshipNumber [
	| aSpaceship|
aSpaceship := spaceships at: aSpaceshipNumber.
		status = 0
		ifTrue: [ aSpaceship number = turn
		ifTrue: [  aSpaceship score: aSpaceship score + self ThrowDice.
			turn < spaceships size
			ifTrue: [ turn := turn +1. ]
			ifFalse: [ turn := 1. ]
			 ]
		ifFalse: [ Error signal: 'Error. its not the spaceships turn' ]. ]
		ifFalse: [ Error signal: 'Error. Game finished' ].
	aSpaceship score > board size
	ifTrue: [ status := 1.
		aSpaceship winner: 1. ].
]

{ #category : #public }
Game >> showPosition: aSpaceshipNumber [
	| aSpaceship |
	aSpaceship:= spaceships detect: [:spaceship | spaceship number = aSpaceshipNumber ].
	^aSpaceship score.
]

{ #category : #public }
Game >> showWinner [ 
	^spaceships detect: [ :aSpaceship | aSpaceship winner = 1] 
]

{ #category : #public }
Game >> spaceships [
	^ spaceships
]
