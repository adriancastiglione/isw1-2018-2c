!classDefinition: #TerniLapilliTest category: #'Terni-Lapilli'!
TestCase subclass: #TerniLapilliTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Terni-Lapilli'!

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/8/2018 12:31:46'!
test01TableIsEmptyWhenCreated

	| tableTerniLapilli |
	
	tableTerniLapilli := TerniLapilli new.
	self assert: tableTerniLapilli xCount equals: 0.
	self assert: tableTerniLapilli oCount equals: 0.! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/8/2018 12:31:46'!
test02XIsAddedInCorrectPosition

	| tableTerniLapilli |
	
	tableTerniLapilli := TerniLapilli new.
	tableTerniLapilli addXAt: (1@1).
	self deny: (tableTerniLapilli hasXIn: (2@2)).
	self assert: (tableTerniLapilli hasXIn: (1@1)) ! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/8/2018 12:31:46'!
test03OIsAddedInCorrectPosition

	| tableTerniLapilli |
	
	tableTerniLapilli := TerniLapilli new.
	tableTerniLapilli addXAt: (2@2).
	tableTerniLapilli addOAt: (1@1).
	self assert: (tableTerniLapilli hasOIn: (1@1)).
	self deny: (tableTerniLapilli hasOIn: (2@2))! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/8/2018 12:31:46'!
test04OCantStartGame

	| tableTerniLapilli |
	
	tableTerniLapilli := TerniLapilli new.
	self should: [tableTerniLapilli addOAt: (1@1).]
	raise: Error - MessageNotUnderstood 
	withMessageText: TerniLapilli notOTurnErrorMessage! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/8/2018 12:31:46'!
test05XCantBeAddedTwoConsecutiveTimes

	| tableTerniLapilli |
	
	tableTerniLapilli := TerniLapilli new.
	tableTerniLapilli addXAt: (2@2).
	self should: [tableTerniLapilli addXAt: (1@1).]
	raise: Error - MessageNotUnderstood 
	withMessageText: TerniLapilli notXTurnErrorMessage! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/8/2018 12:31:46'!
test06OCantBeAddedTwoConsecutiveTimes

	| tableTerniLapilli |
	
	tableTerniLapilli := TerniLapilli new.
	tableTerniLapilli addXAt: (1@2).
	tableTerniLapilli addOAt: (2@2).
	self should: [tableTerniLapilli addOAt: (1@1).]
	raise: Error - MessageNotUnderstood 
	withMessageText: TerniLapilli notOTurnErrorMessage! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/8/2018 12:31:46'!
test07XCantBeAddedAtInvalidPosition

	| tableTerniLapilli |
	
	tableTerniLapilli := TerniLapilli new.
	
	self should: [tableTerniLapilli addXAt: (5@5).] raise: Error withMessageText: (TerniLapilli invalidPositionErrorMessage).

	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/8/2018 12:31:46'!
test08OCantBeAddedAtInvalidPosition

	| tableTerniLapilli |
	
	tableTerniLapilli := TerniLapilli new.
	tableTerniLapilli addXAt: (1@1).
	self should: [tableTerniLapilli addOAt: (5@5).] raise: Error withMessageText: (TerniLapilli invalidPositionErrorMessage).

	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/8/2018 12:31:46'!
test09XCantBeAddedInTakenPosition

	| tableTerniLapilli |
	
	tableTerniLapilli := TerniLapilli new.
	tableTerniLapilli addXAt: (1@1).	
	tableTerniLapilli addOAt: (2@2).
	
	self should: [tableTerniLapilli addXAt: (2@2).] raise: Error withMessageText: (TerniLapilli positionAlreadyTakenErrorMessage).
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/8/2018 12:31:46'!
test10OCantBeAddedInTakenPosition

	| tableTerniLapilli |
	
	tableTerniLapilli := TerniLapilli new.
	tableTerniLapilli addXAt: (1@1).
	

	self should: [tableTerniLapilli addOAt: (1@1).] raise: Error withMessageText: (TerniLapilli positionAlreadyTakenErrorMessage).

	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/8/2018 12:31:46'!
test11CantAddMoreThanThreeXTokens

	| tableTerniLapilli |
	
	tableTerniLapilli := TerniLapilli new.
	tableTerniLapilli addXAt: (1@1).
	tableTerniLapilli addOAt: (1@2).	
	
	tableTerniLapilli addXAt: (1@3).
	tableTerniLapilli addOAt: (2@1).
	
	tableTerniLapilli addXAt: (2@2).
	tableTerniLapilli addOAt: (2@3).
	
	
	self should: [tableTerniLapilli addXAt: (3@1).] raise: Error withMessageText: (TerniLapilli cantAddedWhenAllTokensArePositionedErrorMessage).
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/8/2018 12:31:46'!
test12XHasWonDiagonal

	| tableTerniLapilli |
	
	tableTerniLapilli := TerniLapilli new.
	tableTerniLapilli addXAt: (1@1).	
	tableTerniLapilli addOAt: (1@3).
	tableTerniLapilli addXAt: (2@2).
	tableTerniLapilli addOAt: (2@1).	
	tableTerniLapilli addXAt: (3@3).
	
	self assert: (tableTerniLapilli xHasWon).
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/8/2018 12:31:46'!
test13OHasWonDiagonal

	| tableTerniLapilli |
	
	tableTerniLapilli := TerniLapilli new.
	tableTerniLapilli addXAt: (1@2).	
	tableTerniLapilli addOAt: (1@1).
	tableTerniLapilli addXAt: (2@3).
	tableTerniLapilli addOAt: (2@2).	
	tableTerniLapilli addXAt: (3@2).
	tableTerniLapilli addOAt: (3@3).	

	
	self assert: (tableTerniLapilli oHasWon).
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/8/2018 12:31:46'!
test14XHasWonInvertedDiagonal

	| tableTerniLapilli |
	
	tableTerniLapilli := TerniLapilli new.
	tableTerniLapilli addXAt: (3@1).	
	tableTerniLapilli addOAt: (1@1).
	tableTerniLapilli addXAt: (2@2).
	tableTerniLapilli addOAt: (3@3).	
	tableTerniLapilli addXAt: (1@3).
	
	self assert: (tableTerniLapilli xHasWon).
	self deny: (tableTerniLapilli oHasWon).
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/8/2018 12:31:46'!
test15OHasWonInvertedDiagonal

	| tableTerniLapilli |
	
	tableTerniLapilli := TerniLapilli new.
	tableTerniLapilli addXAt: (2@1).	
	tableTerniLapilli addOAt: (3@1).
	tableTerniLapilli addXAt: (2@3).
	tableTerniLapilli addOAt: (2@2).	
	tableTerniLapilli addXAt: (1@1).
	tableTerniLapilli addOAt: (1@3).
	
	self assert: (tableTerniLapilli oHasWon).
	self deny: (tableTerniLapilli xHasWon).

	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/8/2018 12:31:46'!
test16XHasWonByRow

	| tableTerniLapilli |
	
	tableTerniLapilli := TerniLapilli new.
	tableTerniLapilli addXAt: (2@1).	
	tableTerniLapilli addOAt: (1@1).
	tableTerniLapilli addXAt: (2@2).
	tableTerniLapilli addOAt: (1@3).	
	tableTerniLapilli addXAt: (2@3).
	
	self assert: (tableTerniLapilli xHasWon).
	self deny: (tableTerniLapilli oHasWon).
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/8/2018 12:31:46'!
test17OHasWonByRow

	| tableTerniLapilli |
	
	tableTerniLapilli := TerniLapilli new.
	tableTerniLapilli addXAt: (2@1).	
	tableTerniLapilli addOAt: (1@1).
	tableTerniLapilli addXAt: (3@2).
	tableTerniLapilli addOAt: (1@2).	
	tableTerniLapilli addXAt: (2@3).
	tableTerniLapilli addOAt: (1@3).
	
	self assert: (tableTerniLapilli oHasWon).
	self deny: (tableTerniLapilli xHasWon).
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/8/2018 12:31:46'!
test18OHasWonByColumn

	| tableTerniLapilli |
	
	tableTerniLapilli := TerniLapilli new.
	tableTerniLapilli addXAt: (2@1).	
	tableTerniLapilli addOAt: (1@2).
	tableTerniLapilli addXAt: (1@3).
	tableTerniLapilli addOAt: (2@2).	
	tableTerniLapilli addXAt: (3@1).
	tableTerniLapilli addOAt: (3@2).
	
	self assert: (tableTerniLapilli oHasWon).
	self deny: (tableTerniLapilli xHasWon).
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/8/2018 12:31:46'!
test18XHasWonByColumn

	| tableTerniLapilli |
	
	tableTerniLapilli := TerniLapilli new.
	tableTerniLapilli addXAt: (1@1).	
	tableTerniLapilli addOAt: (3@2).
	tableTerniLapilli addXAt: (2@1).
	tableTerniLapilli addOAt: (1@3).	
	tableTerniLapilli addXAt: (3@1).
	
	self assert: (tableTerniLapilli xHasWon).
	self deny: (tableTerniLapilli oHasWon).
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/8/2018 12:31:46'!
test19OcantAddedWhenGameIsOver

	| tableTerniLapilli |
	
	tableTerniLapilli := TerniLapilli new.
	tableTerniLapilli addXAt: (1@1).	
	tableTerniLapilli addOAt: (1@3).
	tableTerniLapilli addXAt: (2@2).
	tableTerniLapilli addOAt: (2@1).	
	tableTerniLapilli addXAt: (3@3).
	
	self should: [tableTerniLapilli addOAt: (3@2).]
	raise: Error - MessageNotUnderstood 
	withMessageText: TerniLapilli gameIsOverErrorMessage
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/8/2018 12:31:46'!
test20XCanBeMoved

	| tableTerniLapilli |
	
	tableTerniLapilli := TerniLapilli new.
	tableTerniLapilli addXAt: (1@1).	
	tableTerniLapilli addOAt: (1@3).
	tableTerniLapilli addXAt: (2@1).
	tableTerniLapilli addOAt: (2@2).	
	tableTerniLapilli addXAt: (3@3).
	tableTerniLapilli addOAt: (3@2).
	
	tableTerniLapilli moveXFrom: (1@1) to: (1@2).

	self assert: (tableTerniLapilli hasXIn: (1@2)).
	self deny: (tableTerniLapilli 	hasXIn: (1@1)).
	self deny: (tableTerniLapilli hasOIn: (1@1)).
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/8/2018 12:31:46'!
test21OCanBeMoved

	| tableTerniLapilli |
	
	tableTerniLapilli := TerniLapilli new.
	tableTerniLapilli addXAt: (1@3).	
	tableTerniLapilli addOAt: (1@1).
	tableTerniLapilli addXAt: (2@1).
	tableTerniLapilli addOAt: (2@2).	
	tableTerniLapilli addXAt: (3@3).
	tableTerniLapilli addOAt: (3@2).
	tableTerniLapilli moveXFrom: (2@1) to: (3@1).
	
	tableTerniLapilli moveOFrom: (1@1) to: (1@2).

	self assert: (tableTerniLapilli hasOIn: (1@2)).
	self deny: (tableTerniLapilli 	hasXIn: (1@1)).
	self deny: (tableTerniLapilli hasOIn: (1@1)).
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/8/2018 12:31:46'!
test22cantMoveXMoreThanOneSegment

	| tableTerniLapilli |
	
	tableTerniLapilli := TerniLapilli new.
	tableTerniLapilli addXAt: (1@1).	
	tableTerniLapilli addOAt: (2@1).
	tableTerniLapilli addXAt: (1@2).
	tableTerniLapilli addOAt: (3@1).	
	tableTerniLapilli addXAt: (2@3).
	tableTerniLapilli addOAt: (3@2).
	
	self should: [tableTerniLapilli moveXFrom: (1@1) to: (3@3).] raise: Error - MessageNotUnderstood withMessageText: TerniLapilli cantMoveMoreThanOneSegmentsErrorMessage.
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/8/2018 12:31:46'!
test23cantMoveXMoreThanOneSegment

	| tableTerniLapilli |
	
	tableTerniLapilli := TerniLapilli new.
	tableTerniLapilli addXAt: (1@1).	
	tableTerniLapilli addOAt: (2@1).
	tableTerniLapilli addXAt: (1@2).
	tableTerniLapilli addOAt: (3@1).	
	tableTerniLapilli addXAt: (2@3).
	tableTerniLapilli addOAt: (3@2).
	
	tableTerniLapilli moveXFrom: (2@3) to: (3@3). 
	
	self should: [tableTerniLapilli moveOFrom: (3@1) to: (1@3).] raise: Error - MessageNotUnderstood withMessageText: TerniLapilli cantMoveMoreThanOneSegmentsErrorMessage.
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/8/2018 12:31:46'!
test24cantMoveXToTakenPosition

	| tableTerniLapilli |
	
	tableTerniLapilli := TerniLapilli new.
	tableTerniLapilli addXAt: (1@1).	
	tableTerniLapilli addOAt: (2@1).
	tableTerniLapilli addXAt: (1@2).
	tableTerniLapilli addOAt: (3@1).	
	tableTerniLapilli addXAt: (2@3).
	tableTerniLapilli addOAt: (3@2).
	
	self should: [tableTerniLapilli moveXFrom: (1@1) to: (1@2).] raise: Error - MessageNotUnderstood withMessageText: TerniLapilli positionAlreadyTakenErrorMessage.
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/8/2018 12:31:46'!
test25cantMoveOToTakenPosition

	| tableTerniLapilli |
	
	tableTerniLapilli := TerniLapilli new.
	tableTerniLapilli addXAt: (1@1).	
	tableTerniLapilli addOAt: (2@1).
	tableTerniLapilli addXAt: (1@2).
	tableTerniLapilli addOAt: (3@1).	
	tableTerniLapilli addXAt: (2@3).
	tableTerniLapilli addOAt: (3@2).
	
	tableTerniLapilli moveXFrom: (1@2) to: (2@2).
	
	self should: [tableTerniLapilli moveOFrom: (2@1) to: (1@1).] raise: Error - MessageNotUnderstood withMessageText: TerniLapilli positionAlreadyTakenErrorMessage.
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/8/2018 12:31:46'!
test26cantMoveXWithInvalidPosition

	| tableTerniLapilli |
	
	tableTerniLapilli := TerniLapilli new.
	tableTerniLapilli addXAt: (1@1).	
	tableTerniLapilli addOAt: (2@1).
	tableTerniLapilli addXAt: (1@2).
	tableTerniLapilli addOAt: (3@1).	
	tableTerniLapilli addXAt: (2@3).
	tableTerniLapilli addOAt: (3@2).
	
	self should: [tableTerniLapilli moveXFrom: (3@3) to: (2@2).] raise: Error - MessageNotUnderstood withMessageText: TerniLapilli noTokenToMoveErrorMessage.
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/8/2018 12:31:46'!
test27cantMoveOWithInvalidPosition

	| tableTerniLapilli |
	
	tableTerniLapilli := TerniLapilli new.
	tableTerniLapilli addXAt: (1@1).	
	tableTerniLapilli addOAt: (2@1).
	tableTerniLapilli addXAt: (1@2).
	tableTerniLapilli addOAt: (3@1).	
	tableTerniLapilli addXAt: (2@3).
	tableTerniLapilli addOAt: (3@2).
	
	tableTerniLapilli moveXFrom: (1@2) to: (1@3).
	
	self should: [tableTerniLapilli moveOFrom: (3@3) to: (2@2).] raise: Error - MessageNotUnderstood withMessageText: TerniLapilli noTokenToMoveErrorMessage.
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/8/2018 12:31:46'!
test28cantMoveXWithInexistantInitialPosition

	| tableTerniLapilli |
	
	tableTerniLapilli := TerniLapilli new.
	tableTerniLapilli addXAt: (1@1).	
	tableTerniLapilli addOAt: (2@1).
	tableTerniLapilli addXAt: (1@2).
	tableTerniLapilli addOAt: (3@1).	
	tableTerniLapilli addXAt: (2@3).
	tableTerniLapilli addOAt: (3@2).

	
	self should: [tableTerniLapilli moveXFrom: (5@5) to: (2@2).] raise: Error - MessageNotUnderstood withMessageText: TerniLapilli invalidPositionErrorMessage .
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/8/2018 12:31:47'!
test29cantMoveXWithInexistantEndPosition

	| tableTerniLapilli |
	
	tableTerniLapilli := TerniLapilli new.
	tableTerniLapilli addXAt: (1@1).	
	tableTerniLapilli addOAt: (2@1).
	tableTerniLapilli addXAt: (1@2).
	tableTerniLapilli addOAt: (3@1).	
	tableTerniLapilli addXAt: (2@3).
	tableTerniLapilli addOAt: (3@2).

	
	self should: [tableTerniLapilli moveXFrom: (1@1) to: (5@5).] raise: Error - MessageNotUnderstood withMessageText: TerniLapilli invalidPositionErrorMessage .
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/8/2018 12:31:47'!
test30cantMoveOWithInexistantInitialPosition

	| tableTerniLapilli |
	
	tableTerniLapilli := TerniLapilli new.
	tableTerniLapilli addXAt: (1@1).	
	tableTerniLapilli addOAt: (2@1).
	tableTerniLapilli addXAt: (1@2).
	tableTerniLapilli addOAt: (3@1).	
	tableTerniLapilli addXAt: (2@3).
	tableTerniLapilli addOAt: (3@2).

	tableTerniLapilli moveXFrom: (1@1) to: (2@2).
	
	self should: [tableTerniLapilli moveOFrom: (5@5) to: (3@3).] raise: Error - MessageNotUnderstood withMessageText: TerniLapilli invalidPositionErrorMessage .
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/8/2018 12:31:46'!
test31cantMoveOWithInexistantEndPosition

	| tableTerniLapilli |
	
	tableTerniLapilli := TerniLapilli new.
	tableTerniLapilli addXAt: (1@1).	
	tableTerniLapilli addOAt: (2@1).
	tableTerniLapilli addXAt: (1@2).
	tableTerniLapilli addOAt: (3@1).	
	tableTerniLapilli addXAt: (2@3).
	tableTerniLapilli addOAt: (3@2).

	tableTerniLapilli moveXFrom: (1@1) to: (2@2).
	
	self should: [tableTerniLapilli moveOFrom: (2@1) to: (5@5).] raise: Error - MessageNotUnderstood withMessageText: TerniLapilli invalidPositionErrorMessage .
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/8/2018 12:31:46'!
test33XhasWonWithAfterMove

	| tableTerniLapilli |
	
	tableTerniLapilli := TerniLapilli new.
	tableTerniLapilli addXAt: (1@1).	
	tableTerniLapilli addOAt: (2@1).
	tableTerniLapilli addXAt: (1@2).
	tableTerniLapilli addOAt: (3@1).	
	tableTerniLapilli addXAt: (2@3).
	tableTerniLapilli addOAt: (3@2).

	tableTerniLapilli moveXFrom: (2@3) to: (1@3).

	self assert: (tableTerniLapilli xHasWon).
	self deny: (tableTerniLapilli oHasWon).
	
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/8/2018 12:31:46'!
test34OhasWonWithAfterMove

	| tableTerniLapilli |
	
	tableTerniLapilli := TerniLapilli new.
	tableTerniLapilli addXAt: (1@1).	
	tableTerniLapilli addOAt: (2@2).
	tableTerniLapilli addXAt: (1@2).
	tableTerniLapilli addOAt: (3@1).	
	tableTerniLapilli addXAt: (3@3).
	tableTerniLapilli addOAt: (3@2).

	tableTerniLapilli moveXFrom: (3@3) to: (2@3).
	tableTerniLapilli moveOFrom: (2@2) to: (3@3).

	self assert: (tableTerniLapilli oHasWon).
	self deny: (tableTerniLapilli xHasWon).
	
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/8/2018 12:31:46'!
test35XCantMoveAfterGameIsOver

	| tableTerniLapilli |
	
	tableTerniLapilli := TerniLapilli new.
	tableTerniLapilli addXAt: (1@1).	
	tableTerniLapilli addOAt: (2@2).
	tableTerniLapilli addXAt: (1@2).
	tableTerniLapilli addOAt: (3@1).	
	tableTerniLapilli addXAt: (3@3).
	tableTerniLapilli addOAt: (3@2).

	tableTerniLapilli moveXFrom: (3@3) to: (2@3).
	tableTerniLapilli moveOFrom: (2@2) to: (3@3).

	self should: [tableTerniLapilli moveXFrom: (2@3) to: (1@3)] raise: Error - MessageNotUnderstood withMessageText: TerniLapilli gameIsOverErrorMessage .
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/8/2018 12:31:46'!
test36OCantMoveAfterGameIsOver

	| tableTerniLapilli |
	
	tableTerniLapilli := TerniLapilli new.
	tableTerniLapilli addXAt: (1@1).	
	tableTerniLapilli addOAt: (2@2).
	tableTerniLapilli addXAt: (1@2).
	tableTerniLapilli addOAt: (3@1).	
	tableTerniLapilli addXAt: (2@3).
	tableTerniLapilli addOAt: (3@2).

	tableTerniLapilli moveXFrom: (2@3) to: (1@3).
	

	self should: [tableTerniLapilli moveOFrom: (2@2) to: (3@3).] raise: Error - MessageNotUnderstood withMessageText: TerniLapilli gameIsOverErrorMessage .
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/8/2018 12:31:45'!
test37XCantMoveIfNotAllTokensWherePlayed

	| tableTerniLapilli |
	
	tableTerniLapilli := TerniLapilli new.
	tableTerniLapilli addXAt: (1@1).	
	tableTerniLapilli addOAt: (2@2).
	tableTerniLapilli addXAt: (1@3).
	tableTerniLapilli addOAt: (3@1).	
	

	self should: [tableTerniLapilli moveXFrom: (1@1) to: (1@2).] raise: Error - MessageNotUnderstood withMessageText: TerniLapilli cantMoveTillAllTokensArePositionedErrorMessage.
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/8/2018 12:31:46'!
test38OCantMoveIfNotAllTokensWherePlayed

	| tableTerniLapilli |
	
	tableTerniLapilli := TerniLapilli new.
	tableTerniLapilli addXAt: (1@1).	
	tableTerniLapilli addOAt: (2@2).
	tableTerniLapilli addXAt: (1@3).
	

	self should: [tableTerniLapilli moveXFrom: (2@2) to: (1@2).] raise: Error - MessageNotUnderstood withMessageText: TerniLapilli cantMoveTillAllTokensArePositionedErrorMessage.
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/8/2018 12:31:46'!
test39OCantAddedIfAllTokensWherePlayed

	| tableTerniLapilli |
	
	tableTerniLapilli := TerniLapilli new.
	tableTerniLapilli addXAt: (1@1).	
	tableTerniLapilli addOAt: (2@1).
	tableTerniLapilli addXAt: (1@2).
	tableTerniLapilli addOAt: (3@1).	
	tableTerniLapilli addXAt: (2@3).
	tableTerniLapilli addOAt: (3@2).

	tableTerniLapilli moveXFrom: (1@1) to: (2@2).
	
	self should: [tableTerniLapilli addOAt: (3@3).] raise: Error - MessageNotUnderstood withMessageText: TerniLapilli cantAddedWhenAllTokensArePositionedErrorMessage.
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/8/2018 12:31:47'!
test40XCantAddedIfAllTokensWherePlayed

	| tableTerniLapilli |
	
	tableTerniLapilli := TerniLapilli new.
	tableTerniLapilli addXAt: (1@1).	
	tableTerniLapilli addOAt: (2@1).
	tableTerniLapilli addXAt: (1@2).
	tableTerniLapilli addOAt: (3@1).	
	tableTerniLapilli addXAt: (2@3).
	tableTerniLapilli addOAt: (3@2).

	tableTerniLapilli moveXFrom: (2@3) to: (3@3).
	tableTerniLapilli moveOFrom: (2@1) to: (2@2).
	
	self should: [tableTerniLapilli addXAt: (2@3).] raise: Error - MessageNotUnderstood withMessageText: TerniLapilli cantAddedWhenAllTokensArePositionedErrorMessage.
	
	! !


!classDefinition: #TerniLapilli category: #'Terni-Lapilli'!
Object subclass: #TerniLapilli
	instanceVariableNames: 'state tokenPositionsForO tokenPositionsForX'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Terni-Lapilli'!

!TerniLapilli methodsFor: 'operations' stamp: 'AC 11/8/2018 12:16:14'!
addOAt: aPosition 

	state addOAt: aPosition.
	self transitionateTo: state transitionate.
! !

!TerniLapilli methodsFor: 'operations' stamp: 'AC 11/8/2018 12:19:00'!
addXAt: aPosition 
	
	state addXAt: aPosition.
	self transitionateTo: state transitionate.
	! !

!TerniLapilli methodsFor: 'operations' stamp: 'AC 11/8/2018 12:19:05'!
moveOFrom: fromPosition to: toPosition 
	
	state moveOFrom: fromPosition to: toPosition.
	self transitionateTo: state transitionate.! !

!TerniLapilli methodsFor: 'operations' stamp: 'AC 11/8/2018 12:19:11'!
moveXFrom: fromPosition to: toPosition 
	
	state moveXFrom: fromPosition to: toPosition.
	self transitionateTo: state transitionate.! !


!TerniLapilli methodsFor: 'testing' stamp: 'AC 11/8/2018 11:17:22'!
hasOIn: aPosition 
	
	^tokenPositionsForO includes: aPosition.! !

!TerniLapilli methodsFor: 'testing' stamp: 'AC 11/8/2018 11:17:30'!
hasXIn: aPosition 

	^tokenPositionsForX includes: aPosition.
	! !

!TerniLapilli methodsFor: 'testing' stamp: 'AC 11/8/2018 11:18:23'!
isInvalidPosition: aPosition

	| rowIsInvalid columnIsInvalid |
	
	rowIsInvalid := (aPosition x < 1) or: [aPosition x > 3].
	columnIsInvalid := (aPosition y < 1) or: [aPosition y > 3].
	^rowIsInvalid or:[columnIsInvalid].! !

!TerniLapilli methodsFor: 'testing' stamp: 'AC 11/8/2018 11:18:47'!
isValidMoveFrom: fromPosition to: toPosition 
	
	| center |
	center := (2@2).
	^(fromPosition = center) or:[ toPosition = center or: [ | rest |rest := ((fromPosition - toPosition) abs). (rest x + rest y) = 1]]! !

!TerniLapilli methodsFor: 'testing' stamp: 'Lucas 11/7/2018 00:11:54'!
oHasWon
	^state oHasWon! !

!TerniLapilli methodsFor: 'testing' stamp: 'Lucas 11/7/2018 00:12:06'!
xHasWon
	^state xHasWon! !


!TerniLapilli methodsFor: 'information' stamp: 'AC 11/8/2018 11:15:38'!
oCount

	^tokenPositionsForO size! !

!TerniLapilli methodsFor: 'information' stamp: 'AC 11/8/2018 11:15:54'!
xCount

	^tokenPositionsForX size! !


!TerniLapilli methodsFor: 'operations - private' stamp: 'AC 11/8/2018 10:24:31'!
add: aPosition in: aTokenPositionCollection
	
	(self isInvalidPosition: aPosition) ifTrue: [self error: self class invalidPositionErrorMessage].
	((self hasOIn: aPosition) or:[self hasXIn: aPosition]) ifTrue: [self error: self class positionAlreadyTakenErrorMessage ].
	
	aTokenPositionCollection add: aPosition.! !

!TerniLapilli methodsFor: 'operations - private' stamp: 'AC 11/8/2018 11:20:32'!
addO: aPosition 
	
	self add: aPosition in: tokenPositionsForO.

	! !

!TerniLapilli methodsFor: 'operations - private' stamp: 'AC 11/8/2018 11:20:40'!
addX: aPosition 
	
	self add: aPosition in: tokenPositionsForX.

	! !

!TerniLapilli methodsFor: 'operations - private' stamp: 'AC 11/8/2018 11:20:50'!
moveFrom: fromPosition to: toPosition using: aTokenPositionCollection
	
	((self isInvalidPosition: fromPosition) or: [self isInvalidPosition: toPosition]) ifTrue: [self error: self class invalidPositionErrorMessage ].
	((tokenPositionsForX includes: toPosition) or: [tokenPositionsForO includes: toPosition]) ifTrue: [self error: self class positionAlreadyTakenErrorMessage].
	((self isValidMoveFrom: fromPosition to: toPosition) not) ifTrue: [self error: self class cantMoveMoreThanOneSegmentsErrorMessage ].
	((aTokenPositionCollection includes: fromPosition) not) ifTrue: [self error: self class noTokenToMoveErrorMessage].
	
	aTokenPositionCollection remove: fromPosition.
	self add: toPosition in: aTokenPositionCollection .
! !

!TerniLapilli methodsFor: 'operations - private' stamp: 'AC 11/8/2018 11:21:05'!
slideOFrom: fromPosition to: toPosition
	
	self moveFrom: fromPosition to: toPosition using: tokenPositionsForO.! !

!TerniLapilli methodsFor: 'operations - private' stamp: 'AC 11/8/2018 11:21:18'!
slideXFrom: fromPosition to: toPosition
	
	self moveFrom: fromPosition to: toPosition using: tokenPositionsForX.! !

!TerniLapilli methodsFor: 'operations - private' stamp: 'AC 11/8/2018 11:13:02'!
transitionateTo: aTerniLapilliState

	state := aTerniLapilliState ! !

!TerniLapilli methodsFor: 'operations - private' stamp: 'AC 11/8/2018 10:55:28'!
verifyHasWonByColumnUsing: aTokenPositionCollection
	
	| column | 

	"Winning by completing a column"
	column := (aTokenPositionCollection at:1) y. 
	^aTokenPositionCollection allSatisfy: [:aPosition | aPosition y = column]! !

!TerniLapilli methodsFor: 'operations - private' stamp: 'AC 11/8/2018 10:52:41'!
verifyHasWonByDiagonalUsing: aTokenPositionCollection
	
	"Winning by completing a diagonal"
	^(aTokenPositionCollection allSatisfy: [:aPosition | (aPosition x = aPosition y)]) 
		or: [aTokenPositionCollection allSatisfy: [:aPosition | (aPosition = (2@2)) or: [aPosition = (1@3) or: [aPosition = (3@1)]] ]
			
			]! !

!TerniLapilli methodsFor: 'operations - private' stamp: 'AC 11/8/2018 10:54:33'!
verifyHasWonByRowUsing: aTokenPositionCollection
	
	| row | 
	
	row := (aTokenPositionCollection at:1) x. 
	^aTokenPositionCollection allSatisfy: [:aPosition| aPosition x = row]! !

!TerniLapilli methodsFor: 'operations - private' stamp: 'AC 11/8/2018 11:22:21'!
verifyHasWonUsing: aTokenPositionCollection

	((aTokenPositionCollection size = 3) not ) ifTrue: [^false]. "cant win if there are tokens to be placed. "
		
	^(self verifyHasWonByDiagonalUsing: aTokenPositionCollection) or:[(self verifyHasWonByRowUsing: aTokenPositionCollection) or: [self verifyHasWonByColumnUsing: aTokenPositionCollection ]]! !

!TerniLapilli methodsFor: 'operations - private' stamp: 'AC 11/8/2018 11:49:25'!
verifyOHasWon


	^self verifyHasWonUsing: tokenPositionsForO! !

!TerniLapilli methodsFor: 'operations - private' stamp: 'AC 11/8/2018 11:50:24'!
verifySomeoneHasWon


	^(self verifyXHasWon ) or:[self verifyOHasWon ].! !

!TerniLapilli methodsFor: 'operations - private' stamp: 'AC 11/8/2018 11:49:17'!
verifyXHasWon


	^self verifyHasWonUsing: tokenPositionsForX! !


!TerniLapilli methodsFor: 'initialization' stamp: 'AC 11/8/2018 11:15:54'!
initialize
	
	tokenPositionsForO := OrderedCollection new.
	tokenPositionsForX := OrderedCollection new.
	state := PlacingX with: self.! !


!TerniLapilli methodsFor: 'errors - private' stamp: 'AC 11/8/2018 09:41:10'!
cantAddedWhenAllTokensArePositionedError

		self error: self class cantAddedWhenAllTokensArePositionedErrorMessage! !

!TerniLapilli methodsFor: 'errors - private' stamp: 'AC 11/8/2018 09:35:55'!
cantMoveTillAllTokensArePositionedError

		self error: self class cantMoveTillAllTokensArePositionedErrorMessage.	! !

!TerniLapilli methodsFor: 'errors - private' stamp: 'AC 11/8/2018 09:49:20'!
gameIsOverError
	
	self error: self class gameIsOverErrorMessage! !

!TerniLapilli methodsFor: 'errors - private' stamp: 'AC 11/8/2018 09:31:55'!
notOTurnError

		self error: self class notOTurnErrorMessage.
	! !

!TerniLapilli methodsFor: 'errors - private' stamp: 'AC 11/8/2018 09:38:05'!
notXTurnError

		self error: self class notXTurnErrorMessage.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilli class' category: #'Terni-Lapilli'!
TerniLapilli class
	instanceVariableNames: ''!

!TerniLapilli class methodsFor: 'ErrorMessage' stamp: 'AC 11/5/2018 18:06:02'!
allTokensWhereAddedErrorMessage
	
	^'Cant add more than 3 tokens of same type'! !

!TerniLapilli class methodsFor: 'ErrorMessage' stamp: 'Lucas 11/6/2018 22:00:16'!
cantAddedWhenAllTokensArePositionedErrorMessage
	
	^'Cant add token when all tokens are positioned'! !

!TerniLapilli class methodsFor: 'ErrorMessage' stamp: 'AC 11/5/2018 19:09:48'!
cantMoveMoreThanOneSegmentsErrorMessage
	
	^'Cant move more than 1 segment'! !

!TerniLapilli class methodsFor: 'ErrorMessage' stamp: 'AC 11/5/2018 20:06:55'!
cantMoveTillAllTokensArePositionedErrorMessage

	^'Cant make a move if there are still tokens to be positioned'! !

!TerniLapilli class methodsFor: 'ErrorMessage' stamp: 'AC 11/5/2018 18:56:38'!
gameIsOverErrorMessage
	^'Game is over'! !

!TerniLapilli class methodsFor: 'ErrorMessage' stamp: 'AC 11/5/2018 17:56:59'!
invalidPositionErrorMessage
	^'Not a valid position'! !

!TerniLapilli class methodsFor: 'ErrorMessage' stamp: 'AC 11/5/2018 19:31:56'!
noTokenToMoveErrorMessage
	^'No token to move'! !

!TerniLapilli class methodsFor: 'ErrorMessage' stamp: 'AC 11/5/2018 17:41:31'!
notOTurnErrorMessage
	^'Its not O turn'! !

!TerniLapilli class methodsFor: 'ErrorMessage' stamp: 'AC 11/5/2018 17:41:59'!
notXTurnErrorMessage
	^'Its not X turn'! !

!TerniLapilli class methodsFor: 'ErrorMessage' stamp: 'AC 11/5/2018 18:02:49'!
positionAlreadyTakenErrorMessage
	
	^'Cant add token in cell that already has a token'! !


!classDefinition: #TerniLapilliState category: #'Terni-Lapilli'!
Object subclass: #TerniLapilliState
	instanceVariableNames: 'terniLapilli'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Terni-Lapilli'!

!TerniLapilliState methodsFor: 'initialization' stamp: 'AC 11/8/2018 11:15:04'!
inicializeWith: aTablero

	terniLapilli := aTablero.! !


!TerniLapilliState methodsFor: 'operations' stamp: 'AC 11/8/2018 11:29:20'!
addOAt: aPosition

	^self subclassResponsibility.! !

!TerniLapilliState methodsFor: 'operations' stamp: 'AC 11/8/2018 11:29:27'!
addXAt: aPosition

	^self subclassResponsibility.! !

!TerniLapilliState methodsFor: 'operations' stamp: 'AC 11/8/2018 11:30:27'!
moveOFrom: fromPosition to: toPosition 

	^self subclassResponsibility.! !

!TerniLapilliState methodsFor: 'operations' stamp: 'AC 11/8/2018 11:30:31'!
moveXFrom: fromPosition to: toPosition 

	^self subclassResponsibility.! !

!TerniLapilliState methodsFor: 'operations' stamp: 'AC 11/8/2018 11:13:34'!
transitionate

	^self subclassResponsibility.! !


!TerniLapilliState methodsFor: 'testing' stamp: 'AC 11/8/2018 11:30:52'!
oHasWon

	^self subclassResponsibility.! !

!TerniLapilliState methodsFor: 'testing' stamp: 'AC 11/8/2018 11:31:07'!
xHasWon

	^self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilliState class' category: #'Terni-Lapilli'!
TerniLapilliState class
	instanceVariableNames: ''!

!TerniLapilliState class methodsFor: 'creation' stamp: 'Lucas 11/6/2018 21:11:07'!
with: aTablero

	^self new inicializeWith: aTablero.! !


!TerniLapilliState class methodsFor: 'testing' stamp: 'AC 11/8/2018 12:25:46'!
isFor: aTablero

	"turns and winners will be handled implicity by state transitions, this method just checks if current state is posible from token counts"
	^self subclassResponsibility.! !


!classDefinition: #PlacingO category: #'Terni-Lapilli'!
TerniLapilliState subclass: #PlacingO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Terni-Lapilli'!

!PlacingO methodsFor: 'initialization' stamp: 'AC 11/8/2018 12:29:29'!
inicializeWith: aTerniLapilli

	terniLapilli := aTerniLapilli.! !


!PlacingO methodsFor: 'operations' stamp: 'AC 11/8/2018 11:29:03'!
addOAt: aPosition

	terniLapilli addO: aPosition.
	! !

!PlacingO methodsFor: 'operations' stamp: 'AC 11/8/2018 11:30:14'!
addXAt: aPosition

	terniLapilli notXTurnError! !

!PlacingO methodsFor: 'operations' stamp: 'AC 11/8/2018 11:29:46'!
moveOFrom: fromPosition to: toPosition 

	terniLapilli cantMoveTillAllTokensArePositionedError! !

!PlacingO methodsFor: 'operations' stamp: 'AC 11/8/2018 11:30:02'!
moveXFrom: fromPosition to: toPosition 

	terniLapilli cantMoveTillAllTokensArePositionedError! !

!PlacingO methodsFor: 'operations' stamp: 'AC 11/8/2018 12:23:27'!
transitionate

	| posibleNextStates nextState |
	
	terniLapilli verifyOHasWon ifTrue: [^WinnerO with: terniLapilli ].
	posibleNextStates := OrderedCollection  with: PlacingX with: SlidingX.
	
	nextState := posibleNextStates detect: [:aTerniLapilliState | aTerniLapilliState isFor: terniLapilli ].
	^nextState with: terniLapilli .! !


!PlacingO methodsFor: 'testing' stamp: 'Lucas 11/7/2018 00:14:17'!
oHasWon
	^false! !

!PlacingO methodsFor: 'testing' stamp: 'Lucas 11/7/2018 00:14:13'!
xHasWon
	^false! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PlacingO class' category: #'Terni-Lapilli'!
PlacingO class
	instanceVariableNames: ''!

!PlacingO class methodsFor: 'initialization' stamp: 'AC 11/8/2018 12:27:50'!
with: aTerniLapilli

	^self new inicializeWith: aTerniLapilli.! !


!PlacingO class methodsFor: 'testing' stamp: 'AC 11/8/2018 12:28:27'!
isFor: aTerniLapilli

	^aTerniLapilli oCount < 3! !


!classDefinition: #PlacingX category: #'Terni-Lapilli'!
TerniLapilliState subclass: #PlacingX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Terni-Lapilli'!

!PlacingX methodsFor: 'initialization' stamp: 'AC 11/8/2018 12:29:40'!
inicializeWith: aTerniLapilli

	terniLapilli := aTerniLapilli.! !


!PlacingX methodsFor: 'operations' stamp: 'AC 11/8/2018 12:29:47'!
addOAt: aPosition

	terniLapilli notOTurnError.! !

!PlacingX methodsFor: 'operations' stamp: 'AC 11/8/2018 11:15:05'!
addXAt: aPoint

	terniLapilli addX: aPoint.! !

!PlacingX methodsFor: 'operations' stamp: 'AC 11/8/2018 11:15:05'!
moveOFrom: aPoint to: aPoint2

	terniLapilli cantMoveTillAllTokensArePositionedError! !

!PlacingX methodsFor: 'operations' stamp: 'AC 11/8/2018 11:15:05'!
moveXFrom: aPoint to: aPoint2

	terniLapilli cantMoveTillAllTokensArePositionedError! !

!PlacingX methodsFor: 'operations' stamp: 'AC 11/8/2018 12:24:05'!
transitionate

	| posibleNextStates nextState |
	
	terniLapilli verifyXHasWon ifTrue: [^WinnerX with: terniLapilli ].
	posibleNextStates := OrderedCollection  with: PlacingO with: SlidingO.
	
	nextState := posibleNextStates detect: [:aTerniLapilliState | aTerniLapilliState isFor: terniLapilli ].
	^nextState with: terniLapilli.! !


!PlacingX methodsFor: 'testing' stamp: 'Lucas 11/7/2018 00:14:26'!
oHasWon
	^false! !

!PlacingX methodsFor: 'testing' stamp: 'Lucas 11/7/2018 00:14:24'!
xHasWon
	^false! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PlacingX class' category: #'Terni-Lapilli'!
PlacingX class
	instanceVariableNames: ''!

!PlacingX class methodsFor: 'initialization' stamp: 'AC 11/8/2018 12:27:57'!
with: aTerniLapilli

	^self new inicializeWith: aTerniLapilli.! !


!PlacingX class methodsFor: 'testing' stamp: 'AC 11/8/2018 12:28:18'!
isFor: aTerniLapilli

	^aTerniLapilli xCount < 3! !


!classDefinition: #SlidingO category: #'Terni-Lapilli'!
TerniLapilliState subclass: #SlidingO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Terni-Lapilli'!

!SlidingO methodsFor: 'initialization' stamp: 'AC 11/8/2018 11:15:05'!
inicializeWith: aTablero

	terniLapilli := aTablero.! !


!SlidingO methodsFor: 'operations' stamp: 'AC 11/8/2018 11:15:05'!
addOAt: aPoint

	terniLapilli cantAddedWhenAllTokensArePositionedError! !

!SlidingO methodsFor: 'operations' stamp: 'AC 11/8/2018 11:15:05'!
addXAt: aPoint

	terniLapilli cantAddedWhenAllTokensArePositionedError! !

!SlidingO methodsFor: 'operations' stamp: 'AC 11/8/2018 11:15:05'!
moveOFrom: aPoint to: aPoint2

	terniLapilli slideOFrom: aPoint to: aPoint2! !

!SlidingO methodsFor: 'operations' stamp: 'AC 11/8/2018 11:15:05'!
moveXFrom: aPoint to: aPoint2

	terniLapilli notXTurnError! !

!SlidingO methodsFor: 'operations' stamp: 'AC 11/8/2018 12:06:38'!
transitionate

	terniLapilli verifyOHasWon ifTrue: [^WinnerO with: terniLapilli ].	
	^SlidingX with: terniLapilli ! !


!SlidingO methodsFor: 'testing' stamp: 'Lucas 11/7/2018 00:14:33'!
oHasWon
	^false! !

!SlidingO methodsFor: 'testing' stamp: 'Lucas 11/7/2018 00:14:31'!
xHasWon
	^false! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SlidingO class' category: #'Terni-Lapilli'!
SlidingO class
	instanceVariableNames: ''!

!SlidingO class methodsFor: 'initialization' stamp: 'AC 11/8/2018 12:29:09'!
with: aTerniLapilli

	^self new inicializeWith: aTerniLapilli.! !


!SlidingO class methodsFor: 'testing' stamp: 'AC 11/8/2018 12:26:28'!
isFor: aTerniLapilli

	^aTerniLapilli oCount = 3! !


!classDefinition: #SlidingX category: #'Terni-Lapilli'!
TerniLapilliState subclass: #SlidingX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Terni-Lapilli'!

!SlidingX methodsFor: 'initialization' stamp: 'AC 11/8/2018 11:15:05'!
inicializeWith: aTablero

	terniLapilli := aTablero.! !


!SlidingX methodsFor: 'operations' stamp: 'AC 11/8/2018 11:15:05'!
addOAt: aPoint

	terniLapilli cantAddedWhenAllTokensArePositionedError! !

!SlidingX methodsFor: 'operations' stamp: 'AC 11/8/2018 11:15:05'!
addXAt: aPoint

	terniLapilli cantAddedWhenAllTokensArePositionedError! !

!SlidingX methodsFor: 'operations' stamp: 'AC 11/8/2018 11:15:05'!
moveOFrom: aPoint to: aPoint2

	terniLapilli notOTurnError! !

!SlidingX methodsFor: 'operations' stamp: 'AC 11/8/2018 11:15:05'!
moveXFrom: aPoint to: aPoint2

	terniLapilli slideXFrom: aPoint to: aPoint2! !

!SlidingX methodsFor: 'operations' stamp: 'AC 11/8/2018 12:07:03'!
transitionate

	terniLapilli verifyXHasWon ifTrue: [^WinnerX with: terniLapilli ].	
	^SlidingO with: terniLapilli ! !


!SlidingX methodsFor: 'testing' stamp: 'Lucas 11/7/2018 00:14:41'!
oHasWon
	^false! !

!SlidingX methodsFor: 'testing' stamp: 'Lucas 11/7/2018 00:14:38'!
xHasWon
	^false! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SlidingX class' category: #'Terni-Lapilli'!
SlidingX class
	instanceVariableNames: ''!

!SlidingX class methodsFor: 'initialization' stamp: 'AC 11/8/2018 12:29:02'!
with: aTerniLapilli

	^self new inicializeWith: aTerniLapilli.! !


!SlidingX class methodsFor: 'testing' stamp: 'AC 11/8/2018 12:26:10'!
isFor: aTerniLapilli

	^aTerniLapilli xCount = 3! !


!classDefinition: #WinnerO category: #'Terni-Lapilli'!
TerniLapilliState subclass: #WinnerO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Terni-Lapilli'!

!WinnerO methodsFor: 'initialization' stamp: 'AC 11/8/2018 11:15:05'!
inicializeWith: aTablero

	terniLapilli := aTablero.! !


!WinnerO methodsFor: 'operations' stamp: 'AC 11/8/2018 11:15:05'!
addOAt: aPoint

	terniLapilli gameIsOverError! !

!WinnerO methodsFor: 'operations' stamp: 'AC 11/8/2018 11:15:05'!
addXAt: aPoint

	terniLapilli gameIsOverError! !

!WinnerO methodsFor: 'operations' stamp: 'AC 11/8/2018 11:15:05'!
moveOFrom: aPoint to: aPoint2

	terniLapilli gameIsOverError! !

!WinnerO methodsFor: 'operations' stamp: 'AC 11/8/2018 11:15:05'!
moveXFrom: aPoint to: aPoint2

	terniLapilli gameIsOverError! !

!WinnerO methodsFor: 'operations' stamp: 'AC 11/8/2018 12:07:47'!
transitionate

	self error: 'Cant transitionate from and end state.' ! !


!WinnerO methodsFor: 'testing' stamp: 'Lucas 11/7/2018 00:12:55'!
oHasWon
	^true! !

!WinnerO methodsFor: 'testing' stamp: 'Lucas 11/7/2018 00:12:48'!
xHasWon
	^false! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'WinnerO class' category: #'Terni-Lapilli'!
WinnerO class
	instanceVariableNames: ''!

!WinnerO class methodsFor: 'initialization' stamp: 'AC 11/8/2018 12:28:55'!
with: aTerniLapilli

	^self new inicializeWith: aTerniLapilli.! !


!WinnerO class methodsFor: 'testing' stamp: 'AC 11/8/2018 12:27:30'!
isFor: aTerniLapilli

	^aTerniLapilli oCount = 3! !


!classDefinition: #WinnerX category: #'Terni-Lapilli'!
TerniLapilliState subclass: #WinnerX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Terni-Lapilli'!

!WinnerX methodsFor: 'initialization' stamp: 'AC 11/8/2018 11:15:05'!
inicializeWith: aTablero

	terniLapilli := aTablero.! !


!WinnerX methodsFor: 'operations' stamp: 'AC 11/8/2018 11:15:05'!
addOAt: aPoint

	self error: terniLapilli class gameIsOverErrorMessage! !

!WinnerX methodsFor: 'operations' stamp: 'AC 11/8/2018 11:15:05'!
addXAt: aPoint

	self error: terniLapilli class gameIsOverErrorMessage! !

!WinnerX methodsFor: 'operations' stamp: 'AC 11/8/2018 11:15:05'!
moveOFrom: aPoint to: aPoint2

	self error: terniLapilli class gameIsOverErrorMessage! !

!WinnerX methodsFor: 'operations' stamp: 'AC 11/8/2018 11:15:05'!
moveXFrom: aPoint to: aPoint2

	self error: terniLapilli class gameIsOverErrorMessage! !

!WinnerX methodsFor: 'operations' stamp: 'AC 11/8/2018 12:07:56'!
transitionate

	self error: 'Cant transitionate from and end state.' ! !


!WinnerX methodsFor: 'testing' stamp: 'Lucas 11/7/2018 00:13:23'!
oHasWon
	^false! !

!WinnerX methodsFor: 'testing' stamp: 'Lucas 11/7/2018 00:13:16'!
xHasWon
	^true! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'WinnerX class' category: #'Terni-Lapilli'!
WinnerX class
	instanceVariableNames: ''!

!WinnerX class methodsFor: 'initialization' stamp: 'AC 11/8/2018 12:28:48'!
with: aTerniLapilli

	^self new inicializeWith: aTerniLapilli.! !


!WinnerX class methodsFor: 'testing' stamp: 'AC 11/8/2018 12:27:20'!
isFor: aTerniLapilli

	^aTerniLapilli xCount = 3! !
