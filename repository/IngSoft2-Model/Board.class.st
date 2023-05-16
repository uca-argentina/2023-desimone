Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'size'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #public }
Board >> size [ 
^size.
]

{ #category : #public }
Board >> size: aSize [ 
	size:= aSize
]
