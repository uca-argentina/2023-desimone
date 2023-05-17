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
		'status',
		'rows'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Game class >> createGameWithBoardandSpaceshipsAndDice: aName and: aSize and: aNumberOfSpaceships and: aDieSize and: numberOfRows [
	 ^(self new) initializeCreateGameWithSpaceships: aName and: aSize and: aNumberOfSpaceships and: aDieSize and: numberOfRows.
]

{ #category : #public }
Game >> ThrowDice [
	| sum |
	sum := dice sum: [ :aDie | aDie roll ].
	^sum.
]

{ #category : #public }
Game >> board [ 
^board.
]

{ #category : #public }
Game >> dice [
^dice
]

{ #category : #public }
Game >> initializeCreateGameWithSpaceships: aName and: aSize and: aNumberOfSpaceships and: aDiceSize and: numberOfRows [ 
	aSize > 0 ifTrue: [| aBoard| 
	board := Board createBoardWithSizeAndSquares: aSize.  ]
	ifFalse: [ Error signal: 'Error. Negative size. ' ].
	rows := numberOfRows.
	
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

{ #category : #accessing }
Game >> name [
^name.
]

{ #category : #accessing }
Game >> name: aName [ 
	name:= aName
]

{ #category : #accessing }
Game >> play: aSpaceshipNumber [
	| aSpaceship|
aSpaceship := spaceships at: aSpaceshipNumber.
		status = 0
		ifTrue: [ aSpaceship number = turn
		ifTrue: [  aSpaceship score: aSpaceship score + self ThrowDice.
			(board squares at: (aSpaceship score)) = 'WormHole'
			ifTrue:[ aSpaceship score: aSpaceship score -4.].
			(board squares at: (aSpaceship score)) = 'Speedup'
			ifTrue:[ aSpaceship score: aSpaceship score +4.].
			(board squares at: (aSpaceship score)) = 'Moonwalk'
			ifTrue: [ aSpaceship score: aSpaceship score + board moonwalk ].
			turn < spaceships size
			ifTrue: [ turn := turn +1. ]
			ifFalse: [ turn := 1. ]
			 ]
		ifFalse: [ Error signal: 'Error. its not the spaceships turn' ]. ]
		ifFalse: [ Error signal: 'Error. Game finished' ].
	aSpaceship score > board size
	ifTrue: [ rows := rows+1.
		aSpaceship score: 0. ].
	aSpaceship rows >  rows
	ifTrue:[status:=1
		] 
]

{ #category : #accessing }
Game >> showPosition: aSpaceshipNumber [
	| aSpaceship |
	aSpaceship:= spaceships detect: [:spaceship | spaceship number = aSpaceshipNumber ].
	^aSpaceship score.
]

{ #category : #accessing }
Game >> showWinner [ 
	^spaceships detect: [ :aSpaceship | aSpaceship winner = 1]  
]

{ #category : #accessing }
Game >> spaceships [
	^ spaceships  
]
