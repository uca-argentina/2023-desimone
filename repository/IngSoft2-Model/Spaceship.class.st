Class {
	#name : #Spaceship,
	#superclass : #Object,
	#instVars : [
		'name'
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
]

{ #category : #initialize }
Spaceship >> name [
^name.
]
