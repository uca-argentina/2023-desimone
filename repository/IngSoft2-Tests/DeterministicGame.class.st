Class {
	#name : #DeterministicGame,
	#superclass : #Object,
	#instVars : [
		'die',
		'spaceships'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #accessing }
DeterministicGame >> createSpaceships: aNumberOfSpaceships [
spaceships:= Array new: aNumberOfSpaceships.
		1 to: aNumberOfSpaceships  do: [ :newSpaceship | |aSpaceship| 
		aSpaceship:= Spaceship createSpaceshipWithName: newSpaceship.
		spaceships at: newSpaceship put: aSpaceship ].
]

{ #category : #accessing }
DeterministicGame >> deterministicPlayWithASpaceship: aSpaceshipNumber [

|aSpaceship throw|
	
aSpaceship := spaceships at: aSpaceshipNumber.

throw := die roll.


aSpaceship moveForward: throw.



]

{ #category : #accessing }
DeterministicGame >> die: aDie [

die := aDie.
]

{ #category : #accessing }
DeterministicGame >> spaceships [ 
^spaceships.
]
