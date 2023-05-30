Class {
	#name : #GameTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
GameTest >> testaGameIsCreatedWhenCreateGame [

	| aGame |
	aGame := Game createGame.
	self assert: aGame notNil.
]

{ #category : #tests }
GameTest >> testaGameIsCreatedWhenCreateGameOf [

	| aGame |
	aGame := Game createGameOf:50 and: 4 and: #(6 6 6).
	aGame.
	self assert: (aGame isKindOf: Game).
]
