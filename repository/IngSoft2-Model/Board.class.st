Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'size'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
Board >> size [ 
^size.
]

{ #category : #accessing }
Board >> size: aSize [ 
	size:= aSize
]
