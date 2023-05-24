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
