Class {
	#name : #DeterministicDie,
	#superclass : #Object,
	#instVars : [
		'faces',
		'possibleValues',
		'index'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #'instance creation' }
DeterministicDie class >> with: aArrayOfPossibleValues [ 
	^(self new) initializeWith: aArrayOfPossibleValues.
]

{ #category : #initialize }
DeterministicDie >> initializeWith: aArrayOfPossibleValues [ 
	faces := 3.
	possibleValues := aArrayOfPossibleValues.
	index :=1.
]

{ #category : #action }
DeterministicDie >> roll [
	| aRoll|
	aRoll := possibleValues at: index.
	index := (index \\ possibleValues size)+1.
	^aRoll.
]
