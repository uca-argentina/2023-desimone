Class {
	#name : #GameTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
GameTest >> testBoardIsCreatedWhenCreateBoard [
| aGame aBoard |
aGame:= Game new.
aBoard:= aGame createBoard: 10.
self assert: aBoard notNil.

]

{ #category : #tests }
GameTest >> testDicesAreCreatedWhenCreateDices [
| aGame aDice |
aGame:= Game new.
aDice:= aGame createDices: #(6).
self assert: aDice notNil.

]

{ #category : #tests }
GameTest >> testDicesIsZeroOnInitialize [
| aGame |
aGame:= Game new.
self assert: aGame dices equals: 0.
]

{ #category : #tests }
GameTest >> testPlayersCollectionIsEmptyOnInitialize [

| aGame |
aGame:= Game new.
self assert: aGame players isEmpty.
]

{ #category : #tests }
GameTest >> testSpaceShipsAreCreatedWhenCreateSpaceShip [
| aGame aSpaceShip |
aGame:= Game new.
aSpaceShip:= aGame createSpaceShip: 'nombre'.
self assert: aSpaceShip notNil.
]
