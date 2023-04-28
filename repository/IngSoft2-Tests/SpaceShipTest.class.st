Class {
	#name : #SpaceShipTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
SpaceShipTest >> testNameIsNombreWhenAttNameIsNombre [
| aSpaceShip |
aSpaceShip := SpaceShip new.
aSpaceShip name: 'nombre'.
]

{ #category : #tests }
SpaceShipTest >> testScoreIsRisingWhenThrowDices [

| aSpaceShip aBoard aGame score1 score2|
aGame:= Game new.
aSpaceShip:= aGame createSpaceShip: 'nombre'.
aBoard:= aGame createBoard: 10.
aGame createDices: #(6 6 6).
score1:= aSpaceShip score.
aSpaceShip throwDices: aGame board: aBoard.
score2:= aSpaceShip score.
self assert: (score2 > score1).




]

{ #category : #tests }
SpaceShipTest >> testScoreIsZeroOnInitialize [
| aSpaceShip |
aSpaceShip := SpaceShip new.
self assert: aSpaceShip score equals: 0.
]
