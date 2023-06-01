Class {
	#name : #SpaceshipTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
SpaceshipTest >> test001ASpaceshipIsCreatedThenICheckThatTheNameIsCorrect [

| aSpaceship |

aSpaceship := Spaceship with: 'Spaceship 1'.

self assert: aSpaceship name equals: 'Spaceship 1'.
]

{ #category : #tests }
SpaceshipTest >> test002ASpaceshipIsCreatedThenICheckThatTheScoreIsZero [

| aSpaceship |

aSpaceship := Spaceship with: 'Spaceship 1'.

self assert: aSpaceship score equals: 0.
]

{ #category : #tests }
SpaceshipTest >> test003ASpaceshipCanBeUsedInAGameAfterCreateGame [ 

| aSpaceship aGame aDie aBoard|

aSpaceship := Spaceship with: 'Spaceship 1'.
aBoard := Board of: 50.
aDie := Die of:6.
aGame := Game with: aSpaceship and: aBoard and: aDie.
self assert: aGame spaceships score equals: 0.
]

{ #category : #tests }
SpaceshipTest >> test004ASpaceshipIsCreatedWithoutNameThenErrorSignal [

| aSpaceship |

[aSpaceship := Spaceship with: '']
on: Error 
do: [ :error | self assert: error messageText equals: 'Name cant be empty' ].


]

{ #category : #tests }
SpaceshipTest >> test005ASpaceshipThrowsTheDiceThenMovesTo5 [

| aSpaceship aDiceCollection aDie1 aDie2|

aSpaceship := Spaceship with: 'spaceship 1'.

aDie1 := DeterministicDie with: #(1 2 3).
aDie2 := DeterministicDie with: #(4 5 6).

aDiceCollection := OrderedCollection new.
aDiceCollection add: aDie1.
aDiceCollection add: aDie2.

aSpaceship throwDice: aDiceCollection.

self assert: aSpaceship score equals: 5.




]
