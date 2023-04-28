Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'dices',
		'players',
		'board'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #public }
Game >> checkIfWon: score board: aBoard [
| win |
win:= score > aBoard size.
Transcript show: win; cr.
^win.
]

{ #category : #public }
Game >> checkRanking [
	    players do: [:aPlayer |
        Transcript show: aPlayer name, ' - Score: ', aPlayer score asString; cr].
]

{ #category : #public }
Game >> createBoard: aSize [

| aBoard |
aBoard := Board  new.
aBoard size: aSize.
^aBoard.
]

{ #category : #public }
Game >> createDices: diceFaces [
    dices := OrderedCollection new.
    diceFaces do: [:aDiceFaces |
        | aDice |
        aDice := Dice new.
        aDice defineFaces: aDiceFaces.
        dices add: aDice].
]

{ #category : #public }
Game >> createSpaceShip: name [

| aSpaceShip |
aSpaceShip := SpaceShip new.
aSpaceShip name: name.
players add: aSpaceShip.
^aSpaceShip
]

{ #category : #accessing }
Game >> dices [
^dices.
]

{ #category : #'as yet unclassified' }
Game >> initialize [ 
dices:=0.
players:= OrderedCollection new.
]

{ #category : #'as yet unclassified' }
Game >> players [
^players.
]

{ #category : #public }
Game >> rollDicesAndSum [
    | sum |
    sum := 0.
    dices do: [:aDice |
        sum := sum + aDice roll].
    ^sum.
]
