Class {
	#name : #Die,
	#superclass : #Object,
	#instVars : [
		'faces'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
Die >> faces [
	^ faces
]

{ #category : #accessing }
Die >> faces: aFaceNumber [
faces := aFaceNumber.
]

{ #category : #public }
Die >> roll [
	^faces atRandom.
]
