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
Spaceship class >> with: aName [ 
	aName isEmpty ifTrue:[Error signal: 'Name cant be empty'].
	^(self new) initializeWith: aName.
]

{ #category : #initialize }
Spaceship >> initializeWith: aName [

	name := aName.
	score := 0
]

{ #category : #accessing }
Spaceship >> name [
	^ name
]

{ #category : #accessing }
Spaceship >> score [
^score
]

{ #category : #action }
Spaceship >> throwDice: aDiceCollection [
	score:= score + (aDiceCollection collect: [ :die | die roll ]) sum.	
]
