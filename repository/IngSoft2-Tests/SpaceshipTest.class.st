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
SpaceshipTest >> test004ASpaceshipIsBeingCreatedWithoutNameThenErrorSignal [

| aSpaceship |

[aSpaceship := Spaceship with: '']
on: Error 
do: [ :error | self assert: error messageText equals: 'Name cant be empty' ].


]
