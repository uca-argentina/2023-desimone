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

{ #category : #accessing }
Spaceship >> number [
^number.
]

{ #category : #accessing }
Spaceship >> number: aNumber [ 
	number:= aNumber.
]

{ #category : #accessing }
Spaceship >> score [ 
^score.
]

{ #category : #accessing }
Spaceship >> score: aScore [ 
	score := aScore.
]

{ #category : #accessing }
Spaceship >> winner [
^winner.
]

{ #category : #accessing }
Spaceship >> winner: isWinner [
winner := isWinner.
]
