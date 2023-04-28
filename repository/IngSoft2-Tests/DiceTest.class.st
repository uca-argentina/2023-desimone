Class {
	#name : #DiceTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
DiceTest >> testFacesIs2WhenDefineFacesIs2 [
| dice |
dice:= Dice new.
dice defineFaces: 2.
self assert: dice faces equals: 2.
]

{ #category : #tests }
DiceTest >> testFacesIsZeroOnInitialize [
| dice |
dice:= Dice new.
self assert: dice faces equals: 0.
]

{ #category : #tests }
DiceTest >> testRollIsBetween1andFaces [
| aDice  roll|
aDice:= Dice new.
aDice defineFaces: 3.
roll:= aDice roll.
self assert: (roll >=1).
self assert: (roll<=aDice faces).
]
