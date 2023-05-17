Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'size',
		'squares',
		'moonwalk'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Board class >> createBoardWithSizeAndSquares: aSize [ 
	^(self new) initializeCreateBoardWithSizeAndSquares: aSize.
]

{ #category : #initialization }
Board >> initializeCreateBoardWithSizeAndSquares: aSize [ 
	size := aSize.
	squares := Array new: aSize.
	moonwalk := 5.
]

{ #category : #initialization }
Board >> moonwalk [
^moonwalk.
]

{ #category : #initialization }
Board >> size [ 
^size.
]

{ #category : #initialization }
Board >> size: aSize [ 
	size:= aSize
]

{ #category : #initialization }
Board >> squares [
^squares. 
]
