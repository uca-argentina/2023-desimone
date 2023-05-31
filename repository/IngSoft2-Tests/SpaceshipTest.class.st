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
