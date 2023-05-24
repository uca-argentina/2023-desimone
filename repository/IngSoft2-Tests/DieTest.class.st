Class {
	#name : #DieTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
DieTest >> testDieIsCreated [

| aDie |
aDie := Die createDieOf: 5.
self assert: aDie notNil.
]

{ #category : #tests }
DieTest >> testExceptionWhenNumberOfFacesIsNegative [

| aDie |
[aDie := Die createDieOf: -5.]
on: Error 
do: [ :error | self assert:   error messageText equals: 'Number of faces cant be negative']
]
