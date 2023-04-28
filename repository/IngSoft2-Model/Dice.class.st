Class {
	#name : #Dice,
	#superclass : #Object,
	#instVars : [
		'faces'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #public }
Dice >> defineFaces: aNumberOfFaces [
    faces := aNumberOfFaces.
]

{ #category : #accessing }
Dice >> faces [
^faces.
]

{ #category : #initialize }
Dice >> initialize [ 
faces:=0.
]

{ #category : #public }
Dice >> roll [
	^ (1 to: faces) atRandom.

]
