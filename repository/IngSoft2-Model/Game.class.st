Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'spaceships',
		'board',
		'dice',
		'turn',
		'gameStatus',
		'winner'
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
Game >> checkGameStatus [

 gameStatus = 'finished' ifTrue:[Error signal: 'The game is over'].
]

{ #category : #action }
Game >> checkIfTheSpaceshipWin: aSpaceship [ 
	aSpaceship score > board size ifTrue:[winner := aSpaceship name.
		 gameStatus := 'finished'.
		aSpaceship updateScore: (board size)].
]

{ #category : #action }
Game >> checkTurn: aSpaceshipTurn [
turn ~= aSpaceshipTurn ifTrue: [Error signal: 'its not this player turn' ].
	
]

{ #category : #accessing }
Game >> dice [
	^ dice
]

{ #category : #action }
Game >> gameStatus [

^gameStatus.
]

{ #category : #initialize }
Game >> initializeWith: aSpaceship and: aBoard and: aDie [
	spaceships := aSpaceship.
	board := aBoard.
	dice :=aDie.
	turn := 1.
	gameStatus := 'Playing'.
]

{ #category : #action }
Game >> play: aSpaceshipName [ 
	|aPlayingSpaceship playerTurn|
self checkGameStatus.	
aPlayingSpaceship  := spaceships detect: [ :aSpaceship | 
		                  aSpaceship name = aSpaceshipName ].
playerTurn := spaceships indexOf: aPlayingSpaceship.
self checkTurn: playerTurn.
aPlayingSpaceship throwDice: dice.
self updateTurn.
self checkIfTheSpaceshipWin: aPlayingSpaceship.


]

{ #category : #action }
Game >> showPosition: aSpaceshipName [

	| aSpaceship1 |
	aSpaceship1 := self spaceships detect: [ :aSpaceship | 
		              aSpaceship name = aSpaceshipName ].
	
^aSpaceship1 score.
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

{ #category : #accessing }
Game >> winner [
^winner
]
