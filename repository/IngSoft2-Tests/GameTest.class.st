Class {
	#name : #GameTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
GameTest >> testASpaceshipCanPlayWhenCorrectTurn [

| aGame aSpaceship|

aGame := Game createGameOf: 50 and:3  and:#(6 6 6).

aGame playWithSpaceship: 1.

aSpaceship  := aGame spaceships at:1.  


self assert: aSpaceship score > 0.

]

{ #category : #tests }
GameTest >> testCheckTurnIsFalseWhenIncorrectSpaceship [
| aGame canPlayOnIncorrectTurn|

aGame := Game createGameOf: 50 and:3  and:#(6 6 6).

canPlayOnIncorrectTurn := aGame checkturn: 2.

self assert:canPlayOnIncorrectTurn equals:false.
]

{ #category : #tests }
GameTest >> testCheckTurnIsTrueWhenCorrectSpaceship [
| aGame canPlayOnCorrectTurn|

aGame := Game createGameOf: 50 and:3  and:#(6 6 6).

canPlayOnCorrectTurn := aGame checkturn: 1.

self assert: canPlayOnCorrectTurn equals:true.
]

{ #category : #tests }
GameTest >> testaGameIsCreatedWhenCreateGameOf [

	| aGame |
	aGame := Game createGameOf:50 and: 4 and: #(6 6 6).
	self assert: (aGame isKindOf: Game).
]
