Class {
	#name : #SpaceshipTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
SpaceshipTest >> testSpaceshipIsCreated [

	| aSpaceship |
	aSpaceship := Spaceship createSpaceshipWithName: 'name'.
	self assert: aSpaceship notNil.
	self assert: aSpaceship name equals: 'name'.
	
]
