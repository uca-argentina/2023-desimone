Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'size'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #initialization }
Board >> initialize [ 
size:= 0.
]

{ #category : #initialization }
Board >> size [
^size.
]

{ #category : #initialization }
Board >> size: aSize [
size:= aSize.
]
