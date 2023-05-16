Class {
	#name : #SpaceshipTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #test }
SpaceshipTest >> testNumber [
| aSpaceship num|
aSpaceship := Spaceship new.
aSpaceship number: 3.
num := aSpaceship number.
self assert: num equals: 3.


]

{ #category : #test }
SpaceshipTest >> testNumberIs3WhenNumber3 [
| aSpaceship |
aSpaceship := Spaceship new.
aSpaceship number: 3.
self assert: aSpaceship number equals:3.
]

{ #category : #test }
SpaceshipTest >> testScore [
| aSpaceship sc|
aSpaceship := Spaceship new.
aSpaceship score: 3.
sc  := aSpaceship score.
self assert: sc  equals: 3.


]

{ #category : #test }
SpaceshipTest >> testScoreIs3WhenScore3 [
| aSpaceship |
aSpaceship := Spaceship new.
aSpaceship score: 3.
self assert: aSpaceship score equals:3.
]

{ #category : #test }
SpaceshipTest >> testWinner [
| aSpaceship wn|
aSpaceship := Spaceship new.
aSpaceship winner: 1.
wn := aSpaceship winner.
self assert: wn equals: 1.


]

{ #category : #test }
SpaceshipTest >> testWinnerIs1WhenWinner1 [
| aSpaceship |
aSpaceship := Spaceship new.
aSpaceship winner:1.
self assert: aSpaceship winner equals:1.


]
