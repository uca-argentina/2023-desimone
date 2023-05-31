Class {
	#name : #DieTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
DieTest >> test001ADieIsCreatedWith5FacesThenICheckThatTheNumberOfFacesIsCorrect [

| aDie |

aDie := Die of: 5.

self assert: aDie faces equals: 5.
]

{ #category : #tests }
DieTest >> test002ADieOf2FacesCantBeCreatedThenErrorSignalRaises [

	| aDie |
	[aDie := Die of: -2.]
	on: Error 
	do: [:error|	self assert: error messageText equals:  'a die cannot have less than 3 faces'  ]


]

{ #category : #tests }
DieTest >> test003ADieOf3FacesCanBeCreatedThenICheckThatFacesAre3 [

	| aDie |
	aDie := Die of: 3.
	self assert: aDie faces equals:3.


]

{ #category : #tests }
DieTest >> test004DeterministicDieCanRollAndThenICheckThatResultsAreCorrect [

	| aDie |
	aDie := DeterministicDie of: 3.
self assert:	aDie roll equals:1.


]

{ #category : #tests }
DieTest >> test005DeterministicDieCanRollAndThenICheckThatResultsAreCorrectAndCurrentValueReturnsToTheBeginningWhenTheValueStripIsFinished [

	| aDie |
	aDie := DeterministicDie of: 3.
	aDie roll.
	aDie roll.
	aDie roll.
self assert:	aDie roll equals:1.


]

{ #category : #tests }
DieTest >> test006ADieCanRollAndResultIsBetween1AndFaces [

	| aDie |
	aDie := Die of: 3.
	self assert: aDie roll > 0 & aDie roll < aDie faces.
]

{ #category : #tests }
DieTest >> test007DiceCanBeCreatedWithDifferentNumberOfFaces [

	| aDie1 aDie2|
	aDie1 := Die of: 3.
	aDie2 := Die of:7.
	self assert: aDie1 faces equals:3.
	self assert: aDie2 faces equals:7.
]
