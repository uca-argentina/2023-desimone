Class {
	#name : #Spaceship,
	#superclass : #Object,
	#instVars : [
		'name',
		'score'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Spaceship class >> createSpaceshipWithName: aName [ 
	^(self new) initializeWithName: aName.
]

{ #category : #initialize }
Spaceship >> initializeWithName: aName [ 
	name := aName.
	score := 0.
]

{ #category : #initialize }
Spaceship >> moveForward: aThrowResult [

score := score + aThrowResult.
]

{ #category : #initialize }
Spaceship >> name [
^name.
]

{ #category : #initialize }
Spaceship >> score [
	^score
]
