Class {
	#name : #DieTest,
	#superclass : #TestCase,
	#instVars : [
		'squares'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
DieTest >> testRollIsBetween1andFaces [ 
| die aRoll|
die := Die new.
die faces: 5.
aRoll:= die roll.
aRoll.
self assert: (aRoll  >=1).
self assert: (aRoll<=die faces).
]
