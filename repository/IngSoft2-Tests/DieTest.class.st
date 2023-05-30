Class {
	#name : #DieTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
DieTest >> testDieIsCreated [

| aDie |
aDie := Die createDieOf: 5.
self assert: (aDie isKindOf: Die)
]

{ #category : #tests }
DieTest >> testDieIsCreatedWith6Faces [

| aDie |
aDie := Die createDieOf: 6.
self assert: aDie faces equals: 6.
]

{ #category : #tests }
DieTest >> testExceptionWhenNumberOfFacesIsNegative [

| aDie |
[aDie := Die createDieOf: -5.]
on: Error 
do: [ :error | self assert:   error messageText equals: 'Number of faces cant be negative']
]

{ #category : #tests }
DieTest >> testRollIs6WhenFaces6 [

| aDie roll | 

aDie := DeterministicDie new.

roll:= aDie roll.

self assert: roll equals: aDie faces.
]

{ #category : #tests }
DieTest >> testRollIsBetween1andFaces [

	| aDie aRoll|
	aDie := Die createDieOf: 6.
	aRoll := aDie roll.
	self assert: (aRoll  >=1).
	self assert: (aRoll<=aDie faces).
	
]
