Class {
	#name : #DeterministicDie,
	#superclass : #Object,
	#instVars : [
		'faces'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #private }
DeterministicDie >> faces [
	^ faces
]

{ #category : #private }
DeterministicDie >> initialize [ 
	faces := 6.
]

{ #category : #private }
DeterministicDie >> roll [
	^faces.
]
