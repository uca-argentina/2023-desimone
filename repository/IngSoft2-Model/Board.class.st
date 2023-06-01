Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'size'
	],
	#classInstVars : [
		'size'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Board class >> of: aSize [
	aSize > 0 ifTrue: [ ^(self new) initilizeWith: aSize. ]
	ifFalse: [ Error signal: 'Size of the board cant be < 1' ].
	
]

{ #category : #initialize }
Board >> initilizeWith: aSize [ 
	size := aSize.
]

{ #category : #initialize }
Board >> size [ 

^size
]
