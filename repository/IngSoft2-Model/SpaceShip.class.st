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

{ #category : #initialization }
SpaceShip >> initialize [ 
score:=0.
]

{ #category : #initialization }
SpaceShip >> name [
^name.
]

{ #category : #initialization }
SpaceShip >> name: aName [
name:=aName.
]

{ #category : #initialization }
SpaceShip >> score [
^score
]

{ #category : #initialization }
SpaceShip >> throwDices: aGame [
	| sum |
	sum:= aGame rollDicesAndSum.
	score:= score + sum.
	Transcript show: score; cr.
]

{ #category : #initialization }
SpaceShip >> throwDices: aGame board: aBoard [
	| sum |
	sum:= aGame rollDicesAndSum.
	score:= score + sum.
	Transcript show: score; cr.	
	win:= aGame checkIfWon: score board:aBoard.
	Transcript show: win; cr.
]

{ #category : #initialization }
SpaceShip >> win [
^win.
]
