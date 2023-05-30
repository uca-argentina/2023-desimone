Class {
	#name : #Die,
	#superclass : #Object,
	#instVars : [
		'faces'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Die class >> createDieOf: numberOfFaces [
	numberOfFaces > 0 ifTrue: [ ^(self new) initializeDieOf: numberOfFaces. ]
	ifFalse: [ Error signal: 'Number of faces cant be negative' ]

]

{ #category : #private }
Die >> faces [
	^ faces
]

{ #category : #initialize }
Die >> initializeDieOf: numberOfFaces [ 
	faces := numberOfFaces.
]

{ #category : #private }
Die >> roll [
	^faces atRandom.
	
]
