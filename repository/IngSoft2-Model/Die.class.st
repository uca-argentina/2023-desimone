Class {
	#name : #Die,
	#superclass : #Object,
	#instVars : [
		'faces'
	],
	#classInstVars : [
		'faces'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Die class >> of: aNumberOfFaces [ 
	aNumberOfFaces > 2 ifTrue:[^(self new) initializeWith: aNumberOfFaces.]
	ifFalse: [ Error signal: 'a die cannot have less than 3 faces' ].
]

{ #category : #initialization }
Die >> faces [

	^ faces
]

{ #category : #initialization }
Die >> initializeWith: aNumberOfFaces [. 

faces := aNumberOfFaces.
]

{ #category : #action }
Die >> roll [
	^faces atRandom.
]
