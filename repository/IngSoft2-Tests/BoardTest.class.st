Class {
	#name : #BoardTest,
	#superclass : #TestCase,
	#instVars : [
		'squares'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
BoardTest >> testBoardHasSquares [
| game |
game := Game createGameWithBoardandSpaceshipsAndDice: 'name' and: 4 and: 5 and: #(6 6 3) and:5.
self assert: game board squares size equals:4.
]

{ #category : #tests }
BoardTest >> testWeightedEffects [
| aList effect|
aList := OrderedCollection new.
effect := #('no effect' 'WormHole' 'Speedup' 'Moonwalk' 'HyperJump' 'AtomicBomb').

1 to: 50 do: [:index |
	|randomIndex|
	randomIndex :=(100 atRandom ).
	randomIndex <40
		ifTrue:[1].
	randomIndex >40
	ifTrue:[randomIndex <60 ifTrue:[2]].
	randomIndex >60
	ifTrue:[randomIndex <80 ifTrue:[3]].
	randomIndex >80
	ifTrue:[randomIndex <90 ifTrue:[4]].
	randomIndex >90
	ifTrue: [randomIndex <98 ifTrue:[5]
		ifFalse:[6]].
	
	
	
			
		aList add: (effect at: randomIndex ).
	].

aList.
]
