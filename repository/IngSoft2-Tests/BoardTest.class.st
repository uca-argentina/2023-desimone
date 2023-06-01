Class {
	#name : #BoardTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
BoardTest >> test001ABoardCanBeCreatedThenICheckThatSizeIsCorrect [
| aBoard |

aBoard := Board of: 50.

self assert: aBoard size equals: 50.
]

{ #category : #tests }
BoardTest >> test002TryingToCreateABoardWithNegativeSizeThenItIsNotAllowed [
| aBoard |

[aBoard := Board of: -50.]
on: Error 
	do: [:error|	self assert: error messageText equals:  'Size of the board cant be < 1'  ]
]
