Class {
	#name : #SpaceshipTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
SpaceshipTest >> testSpaceshipIsCreated [

	| aSpaceship |
	aSpaceship := Spaceship createSpaceshipWithName: 'name'.
	self assert: (aSpaceship isKindOf: Spaceship).
	self assert: aSpaceship name equals: 'name'.
	
]

{ #category : #tests }
SpaceshipTest >> testSpaceshipThrowDieAndScoreIsUpdated [

| aSpaceship aDie|

aSpaceship := Spaceship createSpaceshipWithName: 'name'.
aDie := DeterministicDie new.

	
]
