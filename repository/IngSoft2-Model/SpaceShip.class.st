Class {
	#name : #Spaceship,
	#superclass : #Object,
	#instVars : [
		'score',
		'number',
		'winner'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #public }
Spaceship >> number [
^number.
]

{ #category : #public }
Spaceship >> number: aNumber [ 
	number:= aNumber.
]

{ #category : #public }
Spaceship >> score [ 
^score.
]

{ #category : #public }
Spaceship >> score: aScore [ 
	score := aScore.
]

{ #category : #public }
Spaceship >> winner [
^winner.
]

{ #category : #public }
Spaceship >> winner: isWinner [
winner := isWinner.
]
