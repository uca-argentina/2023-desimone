Class {
	#name : #GameTest,
	#superclass : #TestCase,
	#instVars : [
		'die'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #preconditions }
GameTest >> createGame: typeOfDie [

	| aSpaceship1 aSpaceship2 aDie1 aDie2 aBoard aGame aSpaceshipCollection aDiceCollection aSpaceship3|
	aSpaceship1 := Spaceship with: 'spaceship 1'.
	aSpaceship2 := Spaceship with: 'spaceship 2'.
	aSpaceship3 := Spaceship with: 'spaceship 3'.
	aSpaceshipCollection := OrderedCollection new.
	aSpaceshipCollection add: aSpaceship1.
	aSpaceshipCollection add: aSpaceship2.
	aSpaceshipCollection add: aSpaceship3.
	typeOfDie = 'normal' ifTrue: [ 
		aDie1 := Die of: 5.
		aDie2 := Die of: 6.
		aDiceCollection := OrderedCollection new.
		aDiceCollection add: aDie1.
		aDiceCollection add: aDie2 ].
	typeOfDie = 'deterministic' ifTrue: [ 
		aDie1 := DeterministicDie  with: #(1 2 3).
		aDie2 := DeterministicDie  with: #(4 5 6).
		aDiceCollection := OrderedCollection new.
		aDiceCollection add: aDie1.
		aDiceCollection add: aDie2 ].

	aBoard := Board of: 26.

	aGame := Game
		         with: aSpaceshipCollection
		         and: aBoard
		         and: aDiceCollection.
	^ aGame
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

	aGame := self createGame: 'normal'.

	self assert: aGame dice size equals: 2.
]

{ #category : #tests }
GameTest >> test006AGameCanBeCreatedWithSpaceshipsAndDiceThenICheckNameOfSpaceshipsAreCorrect [

	|aGame foundSpaceship1 foundSpaceship2|
	
	aGame := self createGame: 'normal'.

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
	aGame := self createGame:'normal'.

	foundDie1 := aGame dice detect: [ :aDie | aDie faces = 5 ].
	foundDie2 := aGame dice detect: [ :aDie | aDie faces = 6 ].
	self assert: foundDie1 faces equals: 5.
	self assert: foundDie2 faces equals: 6.
]

{ #category : #tests }
GameTest >> test008ASpaceshipThrowsTheDiceThenMovesTo5 [

	|aGame aSpaceship1|
	aGame := self createGame: 'deterministic'.
	aGame play: 'spaceship 1'.
	aSpaceship1 := aGame spaceships detect: [ :aSpaceship | aSpaceship name = 'spaceship 1' ].
	self assert: aSpaceship1 score equals: 5.
]

{ #category : #tests }
GameTest >> test009IncorrectSpaceshipTurnTriesToPlayThenItIsNotAllowed [

	| aGame |
	aGame := self createGame: 'normal'.

	self
		should: [ aGame play: 'spaceship 2'. ]
		raise: Error
		withExceptionDo: [ :error | 
			self
				assert: error messageText
				equals: 'its not this player turn' ]
]

{ #category : #tests }
GameTest >> test010ASpaceshipPlayThenTurnIsUpdated [

	| aGame |
	aGame := self createGame: 'normal'.

	aGame play: 'spaceship 1'.
	self assert: aGame turn equals: 2.
]

{ #category : #tests }
GameTest >> test011AFullRoundIsPlayedThenTurnIsAgain1 [

	| aGame |
	aGame := self createGame: 'normal'.

	aGame play: 'spaceship 1'.
	aGame play: 'spaceship 2'.
	aGame play: 'spaceship 3'.
	self assert: aGame turn equals: 1.
]

{ #category : #tests }
GameTest >> test012AFullRoundIsPlayedThenScoreIsUpdated [

	| aGame aSpaceship1 aSpaceship2 aSpaceship3|
	aGame := self createGame: 'deterministic'.

	aGame play: 'spaceship 1'.
	aGame play: 'spaceship 2'.
	aGame play: 'spaceship 3'.
	aSpaceship1 := aGame spaceships detect: [ :aSpaceship | aSpaceship name = 'spaceship 1' ].
	aSpaceship2 := aGame spaceships detect: [ :aSpaceship | aSpaceship name = 'spaceship 2' ].
	aSpaceship3 := aGame spaceships detect: [ :aSpaceship | aSpaceship name = 'spaceship 3' ].
	self assert: aSpaceship1 score equals:5.
	self assert: aSpaceship2 score equals:7.
	self assert: aSpaceship3 score equals:9.
]

{ #category : #tests }
GameTest >> test013AFullRoundIsPlayedThenANewRoundCanBePlayed [
	| aGame aSpaceship1 aSpaceship2 aSpaceship3|
	aGame := self createGame: 'deterministic'.

	aGame play: 'spaceship 1'.
	aGame play: 'spaceship 2'.
	aGame play: 'spaceship 3'.
	aGame play: 'spaceship 1'.
	aGame play: 'spaceship 2'.
	aGame play: 'spaceship 3'.
	aSpaceship1 := aGame spaceships detect: [ :aSpaceship | aSpaceship name = 'spaceship 1' ].
	aSpaceship2 := aGame spaceships detect: [ :aSpaceship | aSpaceship name = 'spaceship 2' ].
	aSpaceship3 := aGame spaceships detect: [ :aSpaceship | aSpaceship name = 'spaceship 3' ].
	self assert: aSpaceship1 score equals:10.
	self assert: aSpaceship2 score equals:14.
	self assert: aSpaceship3 score equals:18.
]

{ #category : #tests }
GameTest >> test014AIncorrectSpaceshipTurnTriesToPlayOnANewRoundThenItIsNotAllowed [
	| aGame |
	aGame := self createGame: 'deterministic'.

	aGame play: 'spaceship 1'.
	aGame play: 'spaceship 2'.
	aGame play: 'spaceship 3'.
	aGame play: 'spaceship 1'.
	aGame play: 'spaceship 2'.
	self
		should: [ aGame play: 'spaceship 2'. ]
		raise: Error
		withExceptionDo: [ :error | 
			self
				assert: error messageText
				equals: 'its not this player turn' ]
]

{ #category : #tests }
GameTest >> test015ASpaceshipScoreReachesTheMaximumThenSpaceshipWinsTheGame [
	| aGame |
	aGame := self createGame: 'deterministic'.

	aGame play: 'spaceship 1'.
	aGame play: 'spaceship 2'.
	aGame play: 'spaceship 3'.
	aGame play: 'spaceship 1'.
	aGame play: 'spaceship 2'.
	aGame play: 'spaceship 3'.
	aGame play: 'spaceship 1'.
	aGame play: 'spaceship 2'.
	aGame play: 'spaceship 3'.
	self assert: aGame winner equals: 'spaceship 3'.
	self assert: aGame gameStatus equals: 'finished'.
]

{ #category : #tests }
GameTest >> test016ASpaceshipTriesToPlayWhenAGameIsFinishedThenItIsNotAllowed [
	| aGame |
	aGame := self createGame: 'deterministic'.

	aGame play: 'spaceship 1'.
	aGame play: 'spaceship 2'.
	aGame play: 'spaceship 3'.
	aGame play: 'spaceship 1'.
	aGame play: 'spaceship 2'.
	aGame play: 'spaceship 3'.
	aGame play: 'spaceship 1'.
	aGame play: 'spaceship 2'.
	aGame play: 'spaceship 3'.
	self
		should: [ aGame play: 'spaceship 1'. ]
		raise: Error
		withExceptionDo: [ :error | 
			self
				assert: error messageText
				equals: 'The game is over' ].
]

{ #category : #tests }
GameTest >> test017WhenshowPositionThenTheGameCanShowThePositionOfTheSpaceship [
	| aGame |
	aGame := self createGame: 'deterministic'.

	aGame play: 'spaceship 1'.
	aGame play: 'spaceship 2'.
	aGame play: 'spaceship 3'.
	aGame play: 'spaceship 1'.
	aGame play: 'spaceship 2'.
	aGame play: 'spaceship 3'.
	aGame play: 'spaceship 1'.
	aGame play: 'spaceship 2'.
	aGame play: 'spaceship 3'.
	self assert: (aGame showPosition: 'spaceship 1') equals: 15.
]

{ #category : #tests }
GameTest >> test018WhenshowPositionOfTheSpaceshipThatWinsThenTheGameCanShowThePositionOfTheSpaceshipCorrectly [
	| aGame |
	aGame := self createGame: 'deterministic'.

	aGame play: 'spaceship 1'.
	aGame play: 'spaceship 2'.
	aGame play: 'spaceship 3'.
	aGame play: 'spaceship 1'.
	aGame play: 'spaceship 2'.
	aGame play: 'spaceship 3'.
	aGame play: 'spaceship 1'.
	aGame play: 'spaceship 2'.
	aGame play: 'spaceship 3'.
	self assert: (aGame showPosition: 'spaceship 3') equals: 26.
]
