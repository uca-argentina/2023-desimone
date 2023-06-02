Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'spaceships',
		'board',
		'dice',
		'turn'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Game class >> with: aSpaceship and: aBoard and: aDie [
 ^(self new ) initializeWith:aSpaceship and: aBoard and: aDie.
]

{ #category : #accessing }
Game >> board [
	^ board
]

{ #category : #action }
Game >> checkTurn: aSpaceshipTurn [

turn ~= aSpaceshipTurn ifTrue: [Error signal: 'its not this player turn' ].
	
]

{ #category : #accessing }
Game >> dice [
	^ dice
]

{ #category : #initialize }
Game >> initializeWith: aSpaceship and: aBoard and: aDie [
	spaceships := aSpaceship.
	board := aBoard.
	dice :=aDie.
	turn := 1.
]

{ #category : #action }
Game >> play: aSpaceshipName [ 
	|aPlayingSpaceship playerTurn|
	
aPlayingSpaceship  := spaceships detect: [ :aSpaceship | 
		                  aSpaceship name = aSpaceshipName ].
	
playerTurn := spaceships indexOf: aPlayingSpaceship.
self checkTurn: playerTurn.
aPlayingSpaceship throwDice: dice.
self updateTurn.

]

{ #category : #accessing }
Game >> spaceships [
	^ spaceships
]

{ #category : #accessing }
Game >> turn [
^turn.
]

{ #category : #action }
Game >> updateTurn [

	turn < spaceships size ifTrue: [ turn := turn+1 ]
	ifFalse:[turn := 1].
]
