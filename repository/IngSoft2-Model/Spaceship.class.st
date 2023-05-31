Class {
	#name : #Spaceship,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Spaceship class >> with: aName [ 
	^(self new) initializeWith: aName.
]

{ #category : #initialize }
Spaceship >> initializeWith: aName [
    name := aName.
]

{ #category : #accessing }
Spaceship >> name [
	^ name
]
