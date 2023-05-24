Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'size'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Board class >> createBoardOf: aSize [ 
	aSize > 0 ifTrue: [ 	^(self new) initializeBoardOf: aSize. ]
		ifFalse: [ Error signal: ' Size cant be negative' ].

]

{ #category : #initialize }
Board >> initializeBoardOf: aSize [ 
	size := aSize.
]

{ #category : #initialize }
Board >> size [ 
^size.
]
