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
DeterministicDie class >> of: aNumberOfFaces [ 
	^(self new) initializeWith: aNumberOfFaces.
]

{ #category : #initialize }
DeterministicDie >> initializeWith: aNumberOfFaces [ 
	faces := aNumberOfFaces.
	possibleValues := #(1 2 3).
	index :=1.
]

{ #category : #action }
DeterministicDie >> roll [
	| aRoll|
	aRoll := possibleValues at: index.
	index := (index \\ possibleValues size)+1.
	^aRoll.
]
