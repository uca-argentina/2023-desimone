Class {
	#name : #SpaceShip,
	#superclass : #Object,
	#instVars : [
		'score',
		'name',
		'win'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #initialize }
SpaceShip >> initialize [ 
score:=0.
]

{ #category : #accessing }
SpaceShip >> name [
^name.
]

{ #category : #public }
SpaceShip >> name: aName [
name:=aName.
]

{ #category : #accessing }
SpaceShip >> score [
^score.
]

{ #category : #public }
SpaceShip >> throwDices: aGame board: aBoard [
	| sum |
	sum:= aGame rollDicesAndSum.
	score:= score + sum.
	Transcript show: score; cr.	
	win:= aGame checkIfWon: score board:aBoard.
	Transcript show: win; cr.
]

{ #category : #accessing }
SpaceShip >> win [
^win.
]
