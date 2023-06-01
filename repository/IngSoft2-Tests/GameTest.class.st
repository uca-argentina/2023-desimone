Class {
	#name : #GameTest,
	#superclass : #TestCase,
	#instVars : [
		'die'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #preconditions }
GameTest >> createGame [

| aSpaceship1 aSpaceship2 aDie1 aDie2 aBoard aGame aSpaceshipCollection aDiceCollection|
	aSpaceship1 := Spaceship with: 'spaceship 1'.
	aSpaceship2 := Spaceship with: 'spaceship 2'.
	aSpaceshipCollection := OrderedCollection new.
	aSpaceshipCollection add: aSpaceship1.
	aSpaceshipCollection add: aSpaceship2.

	aDie1 := Die of: 5.
	aDie2 := Die of: 6.
	aDiceCollection := OrderedCollection new.
	aDiceCollection add: aDie1.
	aDiceCollection add: aDie2.

	aBoard := Board of: 50.

	aGame := Game
		         with: aSpaceshipCollection
		         and: aBoard
		         and: aDiceCollection.
	^aGame.
]

{ #category : #tests }
GameTest >> test001AGameCanBeCreatedWithASpaceshipABoardAndADieThenICheckSpaceshipIsCorrect [

	| aSpaceship aDie aBoard aGame|
	aSpaceship := Spaceship with: 'spaceship 1'.

	aDie := Die of: 6.

	aBoard := Board of: 50.
	
	aGame := Game with: aSpaceship and: aBoard and: aDie.
	
	self assert: aGame spaceships name equals: 'spaceship 1'.

]

{ #category : #tests }
GameTest >> test002AGameCanBeCreatedWithASpaceshipABoardAndADieThenICheckDieIsCorrect [

	| aSpaceship aDie aBoard aGame |
	aSpaceship := Spaceship with: 'spaceship 1'.

	aDie := Die of: 6.

	aBoard := Board of: 50.

	aGame := Game with: aSpaceship and: aBoard and: aDie.

	self assert: aGame dice faces equals: 6.
]

{ #category : #tests }
GameTest >> test003AGameCanBeCreatedWithASpaceshipABoardAndADieThenICheckBoardIsCorrect [

	| aSpaceship aDie aBoard aGame |
	aSpaceship := Spaceship with: 'spaceship 1'.

	aDie := Die of: 6.

	aBoard := Board of: 50.

	aGame := Game with: aSpaceship and: aBoard and: aDie.

	self assert: aGame board size equals: 50.
]

{ #category : #tests }
GameTest >> test004AGameCanBeCreatedWithSpaceshipsThenICheckSizeOfSpaceshipsEqualsToCollectionSize [

	| aSpaceship1 aSpaceship2 aDie aBoard aGame aSpaceshipCollection|
	aSpaceship1 := Spaceship with: 'spaceship 1'.
	aSpaceship2 := Spaceship with: 'spaceship 2'.
	aSpaceshipCollection := OrderedCollection new.
	aSpaceshipCollection add: aSpaceship1.
	aSpaceshipCollection add: aSpaceship2.

	aDie := Die of: 6.

	aBoard := Board of: 50.

	aGame := Game with: aSpaceshipCollection and: aBoard and: aDie.

	self assert: aGame spaceships size equals: 2.
]

{ #category : #tests }
GameTest >> test005AGameCanBeCreatedWithSpaceshipsAndDiceThenICheckSizeOfDiceEqualsToCollectionSize [

	| aGame|

	aGame := self createGame.

	self assert: aGame dice size equals: 2.
]

{ #category : #tests }
GameTest >> test006AGameCanBeCreatedWithSpaceshipsAndDiceThenICheckNameOfSpaceshipsAreCorrect [

	|aGame foundSpaceship1 foundSpaceship2|
	
	aGame := self createGame.

	foundSpaceship1 := aGame spaceships detect: [ :aSpaceship | 
		                  aSpaceship name = 'spaceship 1' ].
	foundSpaceship2 := aGame spaceships detect: [ :aSpaceship | 
		                  aSpaceship name = 'spaceship 2' ].
	self assert: foundSpaceship1 name equals: 'spaceship 1'.
	self assert: foundSpaceship2 name equals: 'spaceship 2'.
]

{ #category : #tests }
GameTest >> test007AGameCanBeCreatedWithSpaceshipsAndDiceThenICheckFacesOfDiceAreCorrect [

	|aGame foundDie1 foundDie2|
	aGame := self createGame.

	foundDie1 := aGame dice detect: [ :aDie | aDie faces = 5 ].
	foundDie2 := aGame dice detect: [ :aDie | aDie faces = 6 ].
	self assert: foundDie1 faces equals: 5.
	self assert: foundDie2 faces equals: 6.
]
