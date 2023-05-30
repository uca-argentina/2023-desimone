Class {
	#name : #BoardTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
BoardTest >> testBoardIsCreated [

	| aBoard |
	
	aBoard := Board createBoardOf: 50.
	self assert: (aBoard isKindOf: Board).
]

{ #category : #tests }
BoardTest >> testBoardIsCreatedWithSize [

	| aBoard |
	
	aBoard := Board createBoardOf: 50.
	self assert: aBoard size equals: 50.
]

{ #category : #tests }
BoardTest >> testExceptionWhenBoardSizeIsNegative [

	| aBoard |
	[aBoard := Board createBoardOf: -50.]
	on: Error 
	do: [ :error | self assert: error messageText equals: ' Size cant be negative'].
]
