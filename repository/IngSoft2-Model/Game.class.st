Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'spaceships',
		'board',
		'dice'
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

{ #category : #accessing }
Game >> dice [
	^ dice
]

{ #category : #initialize }
Game >> initializeWith: aSpaceship and: aBoard and: aDie [
	spaceships := aSpaceship.
	board := aBoard.
	dice :=aDie.
]

{ #category : #action }
Game >> play: aSpaceshipName [ 
	|aPlayingSpaceship|
	
aPlayingSpaceship  := spaceships detect: [ :aSpaceship | 
		                  aSpaceship name = aSpaceshipName ].

aPlayingSpaceship throwDice: dice.
]

{ #category : #accessing }
Game >> spaceships [
	^ spaceships
]
