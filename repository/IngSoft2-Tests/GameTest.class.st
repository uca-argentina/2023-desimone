Class {
	#name : #GameTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
GameTest >> testCantPlayWhenASpaceshipTurnsOtherThanGameTurn [
| aGame |
[aGame:= Game createGameWithBoardandSpaceshipsAndDice: 'name' and: 4 and: 5 and: #(1 1 1).
aGame play: 1.
aGame play:2.
aGame play:4.]
on: Error
do: [ :error | self assert: error messageText equals: 'Error. its not the spaceships turn' ]
]

{ #category : #tests }
GameTest >> testCantPlayWhenASpaceshipWinTheGame [
| aGame |
[aGame:= Game createGameWithBoardandSpaceshipsAndDice: 'name' and: 4 and: 5 and: #(1 1 1).
aGame play: 1.
aGame play:2.
aGame play:3.
aGame play:4.
aGame play:5.
aGame play:1.
aGame play:2.]
on: Error
do: [ :error | self assert: error messageText equals: 'Error. Game finished' ]
]

{ #category : #tests }
GameTest >> testExcepctionIsThrownWhenBoardSizeIsNegative [
| game |
[game := Game createGameWithBoardandSpaceshipsAndDice: 'name' and: -4 and: 5 and: #(6 6 3).]
on: Error
do: [ :error | self assert: error messageText equals: 'Error. Negative size. ' ]
]

{ #category : #tests }
GameTest >> testExcepctionIsThrownWhenDieSizeIsNegative [
| game |
[game := Game createGameWithBoardandSpaceshipsAndDice: 'name' and: 5 and: 3 and: #(-1 6 3).]
on: Error
do: [ :error | self assert: error messageText equals: 'Error. The number of Faces cannot be negative or zero. ' ]
]

{ #category : #tests }
GameTest >> testExcepctionIsThrownWhenNumberOfSpaceshipsIsNegative [
| game |
[game := Game createGameWithBoardandSpaceshipsAndDice: 'name' and: 5 and: -1 and: #(6 6 3).]
on: Error
do: [ :error | self assert: error messageText equals: 'Error. The number of Spaceships cannot be negative or zero. ' ]

]

{ #category : #tests }
GameTest >> testGameIsCreatedWithABoardAndSpaceshipsAndDiceWithMoreThanOneSpaceshipWhenCreateWithBoardAndSpaceship [
| game |
game := Game createGameWithBoardandSpaceshipsAndDice: 'name' and: 4 and: 5 and: #(6 6 3).

]

{ #category : #tests }
GameTest >> testPlayWithNumberOfSpaceship [
| aGame aSpaceship|
aGame:= Game createGameWithBoardandSpaceshipsAndDice: 'name' and: 4 and: 5 and: #(1 1 1).
aGame play:1.
aGame play:2.
aGame play:3.
aGame play:4.
aGame play:5.
aGame play:1.
	aSpaceship:= aGame spaceships detect: [:spaceship | spaceship number = 3 ].
	self assert: aSpaceship score equals: 3.

]

{ #category : #tests }
GameTest >> testShowPosition [
| aGame aSpaceship|
aGame:= Game createGameWithBoardandSpaceshipsAndDice: 'name' and: 4 and: 5 and: #(1 1 1).
aGame play: 1.
aGame play:2.
aGame play:3.
aGame play:4.
aGame play:5.
aGame play:1.
aSpaceship := aGame showPosition: 2.
aSpaceship.
self assert: aSpaceship equals: 3.

]

{ #category : #tests }
GameTest >> testShowWinner [
| aGame aSpaceship|
aGame:= Game createGameWithBoardandSpaceshipsAndDice: 'name' and: 4 and: 5 and: #(1 1 1).
aGame play: 1.
aGame play:2.
aGame play:3.
aGame play:4.
aGame play:5.
aGame play:1.
aSpaceship := aGame showWinner.
aSpaceship.
self assert: aSpaceship winner equals: 1.

]
