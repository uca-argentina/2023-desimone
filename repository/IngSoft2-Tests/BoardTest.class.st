Class {
	#name : #BoardTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
BoardTest >> testSizeIs2WhenSizeIs2 [
| aBoard |
aBoard:= Board new.
aBoard size: 2.
self assert: aBoard size equals: 2.	
]

{ #category : #tests }
BoardTest >> testSizeIsZeroOnInitialize [
| aBoard |
aBoard:= Board new.
self assert: aBoard size equals: 0.
]
