!classDefinition: #TerniLapilliTest category: #'Terni-Lapilli'!
TestCase subclass: #TerniLapilliTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Terni-Lapilli'!

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/5/2018 17:31:21'!
test01TableIsEmptyWhenCreate

	| tableTerniLapilli |
	
	tableTerniLapilli := Tablero new.
	self assert: tableTerniLapilli xCount equals: 0.
	self assert: tableTerniLapilli oCount equals: 0.! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/5/2018 17:54:36'!
test02XIsAddedInCorrectPosition

	| tableTerniLapilli |
	
	tableTerniLapilli := Tablero new.
	tableTerniLapilli addXIn: (1@1).
	self deny: (tableTerniLapilli hasXIn: (2@2)).
	self assert: (tableTerniLapilli hasXIn: (1@1)) ! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/5/2018 17:54:49'!
test03OIsAddedInCorrectPosition

	| tableTerniLapilli |
	
	tableTerniLapilli := Tablero new.
	tableTerniLapilli addXIn: (2@2).
	tableTerniLapilli addOIn: (1@1).
	self assert: (tableTerniLapilli hasOIn: (1@1)).
	self deny: (tableTerniLapilli hasOIn: (2@2))! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/5/2018 17:42:52'!
test04OCantStartGame

	| tableTerniLapilli |
	
	tableTerniLapilli := Tablero new.
	self should: [tableTerniLapilli addOIn: (1@1).]
	raise: Error - MessageNotUnderstood 
	withMessageText: Tablero notOTurnErrorMessage! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/5/2018 17:54:57'!
test05XCantBeAddedTwoConsecutiveTimes

	| tableTerniLapilli |
	
	tableTerniLapilli := Tablero new.
	tableTerniLapilli addXIn: (2@2).
	self should: [tableTerniLapilli addXIn: (1@1).]
	raise: Error - MessageNotUnderstood 
	withMessageText: Tablero notXTurnErrorMessage! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/5/2018 17:55:08'!
test06OCantBeAddedTwoConsecutiveTimes

	| tableTerniLapilli |
	
	tableTerniLapilli := Tablero new.
	tableTerniLapilli addXIn: (1@2).
	tableTerniLapilli addOIn: (2@2).
	self should: [tableTerniLapilli addOIn: (1@1).]
	raise: Error - MessageNotUnderstood 
	withMessageText: Tablero notOTurnErrorMessage! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/5/2018 17:57:32'!
test07XcantAddedInvalidPosition

	| tableTerniLapilli |
	
	tableTerniLapilli := Tablero new.
	
	self should: [tableTerniLapilli addXIn: (5@5).] raise: Error withMessageText: (Tablero invalidPositionErrorMessage).

	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/5/2018 18:01:14'!
test08OcantAddedInvalidPosition

	| tableTerniLapilli |
	
	tableTerniLapilli := Tablero new.
	tableTerniLapilli addXIn: (1@1).
	self should: [tableTerniLapilli addOIn: (5@5).] raise: Error withMessageText: (Tablero invalidPositionErrorMessage).

	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/5/2018 18:05:00'!
test09XCantBeAddedInTakenPosition

	| tableTerniLapilli |
	
	tableTerniLapilli := Tablero new.
	tableTerniLapilli addXIn: (1@1).	
	tableTerniLapilli addOIn: (2@2).
	
	self should: [tableTerniLapilli addXIn: (2@2).] raise: Error withMessageText: (Tablero positionAlreadyTakenErrorMessage).
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/5/2018 18:05:05'!
test10OCantBeAddedInTakenPosition

	| tableTerniLapilli |
	
	tableTerniLapilli := Tablero new.
	tableTerniLapilli addXIn: (1@1).
	

	self should: [tableTerniLapilli addOIn: (1@1).] raise: Error withMessageText: (Tablero positionAlreadyTakenErrorMessage).

	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'Lucas 11/6/2018 23:54:28'!
test11CantAddMoreThanThreeXTokens

	| tableTerniLapilli |
	
	tableTerniLapilli := Tablero new.
	tableTerniLapilli addXIn: (1@1).
	tableTerniLapilli addOIn: (1@2).	
	
	tableTerniLapilli addXIn: (1@3).
	tableTerniLapilli addOIn: (2@1).
	
	tableTerniLapilli addXIn: (2@2).
	tableTerniLapilli addOIn: (2@3).
	
	
	self should: [tableTerniLapilli addXIn: (3@1).] raise: Error withMessageText: (Tablero cantAddedWhenAllTokensArePositionedErrorMessage).
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/5/2018 18:26:06'!
test12XHasWonDiagonal

	| tableTerniLapilli |
	
	tableTerniLapilli := Tablero new.
	tableTerniLapilli addXIn: (1@1).	
	tableTerniLapilli addOIn: (1@3).
	tableTerniLapilli addXIn: (2@2).
	tableTerniLapilli addOIn: (2@1).	
	tableTerniLapilli addXIn: (3@3).
	
	self assert: (tableTerniLapilli xHasWon).
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/5/2018 18:25:53'!
test13OHasWonDiagonal

	| tableTerniLapilli |
	
	tableTerniLapilli := Tablero new.
	tableTerniLapilli addXIn: (1@2).	
	tableTerniLapilli addOIn: (1@1).
	tableTerniLapilli addXIn: (2@3).
	tableTerniLapilli addOIn: (2@2).	
	tableTerniLapilli addXIn: (3@2).
	tableTerniLapilli addOIn: (3@3).	

	
	self assert: (tableTerniLapilli oHasWon).
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/5/2018 18:34:28'!
test14XHasWonInvertedDiagonal

	| tableTerniLapilli |
	
	tableTerniLapilli := Tablero new.
	tableTerniLapilli addXIn: (3@1).	
	tableTerniLapilli addOIn: (1@1).
	tableTerniLapilli addXIn: (2@2).
	tableTerniLapilli addOIn: (3@3).	
	tableTerniLapilli addXIn: (1@3).
	
	self assert: (tableTerniLapilli xHasWon).
	self deny: (tableTerniLapilli oHasWon).
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/5/2018 18:34:36'!
test15OHasWonInvertedDiagonal

	| tableTerniLapilli |
	
	tableTerniLapilli := Tablero new.
	tableTerniLapilli addXIn: (2@1).	
	tableTerniLapilli addOIn: (3@1).
	tableTerniLapilli addXIn: (2@3).
	tableTerniLapilli addOIn: (2@2).	
	tableTerniLapilli addXIn: (1@1).
	tableTerniLapilli addOIn: (1@3).
	
	self assert: (tableTerniLapilli oHasWon).
	self deny: (tableTerniLapilli xHasWon).

	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/5/2018 18:40:17'!
test16XHasWonByRow

	| tableTerniLapilli |
	
	tableTerniLapilli := Tablero new.
	tableTerniLapilli addXIn: (2@1).	
	tableTerniLapilli addOIn: (1@1).
	tableTerniLapilli addXIn: (2@2).
	tableTerniLapilli addOIn: (1@3).	
	tableTerniLapilli addXIn: (2@3).
	
	self assert: (tableTerniLapilli xHasWon).
	self deny: (tableTerniLapilli oHasWon).
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/5/2018 18:41:15'!
test17OHasWonByRow

	| tableTerniLapilli |
	
	tableTerniLapilli := Tablero new.
	tableTerniLapilli addXIn: (2@1).	
	tableTerniLapilli addOIn: (1@1).
	tableTerniLapilli addXIn: (3@2).
	tableTerniLapilli addOIn: (1@2).	
	tableTerniLapilli addXIn: (2@3).
	tableTerniLapilli addOIn: (1@3).
	
	self assert: (tableTerniLapilli oHasWon).
	self deny: (tableTerniLapilli xHasWon).
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/5/2018 18:52:32'!
test18OHasWonByColumn

	| tableTerniLapilli |
	
	tableTerniLapilli := Tablero new.
	tableTerniLapilli addXIn: (2@1).	
	tableTerniLapilli addOIn: (1@2).
	tableTerniLapilli addXIn: (1@3).
	tableTerniLapilli addOIn: (2@2).	
	tableTerniLapilli addXIn: (3@1).
	tableTerniLapilli addOIn: (3@2).
	
	self assert: (tableTerniLapilli oHasWon).
	self deny: (tableTerniLapilli xHasWon).
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/5/2018 18:52:40'!
test18XHasWonByColumn

	| tableTerniLapilli |
	
	tableTerniLapilli := Tablero new.
	tableTerniLapilli addXIn: (1@1).	
	tableTerniLapilli addOIn: (3@2).
	tableTerniLapilli addXIn: (2@1).
	tableTerniLapilli addOIn: (1@3).	
	tableTerniLapilli addXIn: (3@1).
	
	self assert: (tableTerniLapilli xHasWon).
	self deny: (tableTerniLapilli oHasWon).
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/5/2018 18:59:21'!
test19OcantAddedWhenGameIsOver

	| tableTerniLapilli |
	
	tableTerniLapilli := Tablero new.
	tableTerniLapilli addXIn: (1@1).	
	tableTerniLapilli addOIn: (1@3).
	tableTerniLapilli addXIn: (2@2).
	tableTerniLapilli addOIn: (2@1).	
	tableTerniLapilli addXIn: (3@3).
	
	self should: [tableTerniLapilli addOIn: (3@2).]
	raise: Error - MessageNotUnderstood 
	withMessageText: Tablero gameIsOverErrorMessage
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/5/2018 19:03:33'!
test20XCanBeMoved

	| tableTerniLapilli |
	
	tableTerniLapilli := Tablero new.
	tableTerniLapilli addXIn: (1@1).	
	tableTerniLapilli addOIn: (1@3).
	tableTerniLapilli addXIn: (2@1).
	tableTerniLapilli addOIn: (2@2).	
	tableTerniLapilli addXIn: (3@3).
	tableTerniLapilli addOIn: (3@2).
	
	tableTerniLapilli moveXFrom: (1@1) to: (1@2).

	self assert: (tableTerniLapilli hasXIn: (1@2)).
	self deny: (tableTerniLapilli 	hasXIn: (1@1)).
	self deny: (tableTerniLapilli hasOIn: (1@1)).
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/5/2018 19:06:05'!
test21OCanBeMoved

	| tableTerniLapilli |
	
	tableTerniLapilli := Tablero new.
	tableTerniLapilli addXIn: (1@3).	
	tableTerniLapilli addOIn: (1@1).
	tableTerniLapilli addXIn: (2@1).
	tableTerniLapilli addOIn: (2@2).	
	tableTerniLapilli addXIn: (3@3).
	tableTerniLapilli addOIn: (3@2).
	tableTerniLapilli moveXFrom: (2@1) to: (3@1).
	
	tableTerniLapilli moveOFrom: (1@1) to: (1@2).

	self assert: (tableTerniLapilli hasOIn: (1@2)).
	self deny: (tableTerniLapilli 	hasXIn: (1@1)).
	self deny: (tableTerniLapilli hasOIn: (1@1)).
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/5/2018 19:09:48'!
test22cantMoveXMoreThanOneSegment

	| tableTerniLapilli |
	
	tableTerniLapilli := Tablero new.
	tableTerniLapilli addXIn: (1@1).	
	tableTerniLapilli addOIn: (2@1).
	tableTerniLapilli addXIn: (1@2).
	tableTerniLapilli addOIn: (3@1).	
	tableTerniLapilli addXIn: (2@3).
	tableTerniLapilli addOIn: (3@2).
	
	self should: [tableTerniLapilli moveXFrom: (1@1) to: (3@3).] raise: Error - MessageNotUnderstood withMessageText: Tablero cantMoveMoreThanOneSegmentsErrorMessage.
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/5/2018 19:12:38'!
test23cantMoveXMoreThanOneSegment

	| tableTerniLapilli |
	
	tableTerniLapilli := Tablero new.
	tableTerniLapilli addXIn: (1@1).	
	tableTerniLapilli addOIn: (2@1).
	tableTerniLapilli addXIn: (1@2).
	tableTerniLapilli addOIn: (3@1).	
	tableTerniLapilli addXIn: (2@3).
	tableTerniLapilli addOIn: (3@2).
	
	tableTerniLapilli moveXFrom: (2@3) to: (3@3). 
	
	self should: [tableTerniLapilli moveOFrom: (3@1) to: (1@3).] raise: Error - MessageNotUnderstood withMessageText: Tablero cantMoveMoreThanOneSegmentsErrorMessage.
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/5/2018 19:26:54'!
test24cantMoveXToTakenPosition

	| tableTerniLapilli |
	
	tableTerniLapilli := Tablero new.
	tableTerniLapilli addXIn: (1@1).	
	tableTerniLapilli addOIn: (2@1).
	tableTerniLapilli addXIn: (1@2).
	tableTerniLapilli addOIn: (3@1).	
	tableTerniLapilli addXIn: (2@3).
	tableTerniLapilli addOIn: (3@2).
	
	self should: [tableTerniLapilli moveXFrom: (1@1) to: (1@2).] raise: Error - MessageNotUnderstood withMessageText: Tablero positionAlreadyTakenErrorMessage.
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/5/2018 19:26:45'!
test25cantMoveOToTakenPosition

	| tableTerniLapilli |
	
	tableTerniLapilli := Tablero new.
	tableTerniLapilli addXIn: (1@1).	
	tableTerniLapilli addOIn: (2@1).
	tableTerniLapilli addXIn: (1@2).
	tableTerniLapilli addOIn: (3@1).	
	tableTerniLapilli addXIn: (2@3).
	tableTerniLapilli addOIn: (3@2).
	
	tableTerniLapilli moveXFrom: (1@2) to: (2@2).
	
	self should: [tableTerniLapilli moveOFrom: (2@1) to: (1@1).] raise: Error - MessageNotUnderstood withMessageText: Tablero positionAlreadyTakenErrorMessage.
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/5/2018 19:36:53'!
test26cantMoveXWithInvalidPosition

	| tableTerniLapilli |
	
	tableTerniLapilli := Tablero new.
	tableTerniLapilli addXIn: (1@1).	
	tableTerniLapilli addOIn: (2@1).
	tableTerniLapilli addXIn: (1@2).
	tableTerniLapilli addOIn: (3@1).	
	tableTerniLapilli addXIn: (2@3).
	tableTerniLapilli addOIn: (3@2).
	
	self should: [tableTerniLapilli moveXFrom: (3@3) to: (2@2).] raise: Error - MessageNotUnderstood withMessageText: Tablero noTokenToMoveErrorMessage.
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/5/2018 19:36:39'!
test27cantMoveOWithInvalidPosition

	| tableTerniLapilli |
	
	tableTerniLapilli := Tablero new.
	tableTerniLapilli addXIn: (1@1).	
	tableTerniLapilli addOIn: (2@1).
	tableTerniLapilli addXIn: (1@2).
	tableTerniLapilli addOIn: (3@1).	
	tableTerniLapilli addXIn: (2@3).
	tableTerniLapilli addOIn: (3@2).
	
	tableTerniLapilli moveXFrom: (1@2) to: (1@3).
	
	self should: [tableTerniLapilli moveOFrom: (3@3) to: (2@2).] raise: Error - MessageNotUnderstood withMessageText: Tablero noTokenToMoveErrorMessage.
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'Lucas 11/6/2018 23:56:27'!
test28cantMoveXWithInexistantInitialPosition

	| tableTerniLapilli |
	
	tableTerniLapilli := Tablero new.
	tableTerniLapilli addXIn: (1@1).	
	tableTerniLapilli addOIn: (2@1).
	tableTerniLapilli addXIn: (1@2).
	tableTerniLapilli addOIn: (3@1).	
	tableTerniLapilli addXIn: (2@3).
	tableTerniLapilli addOIn: (3@2).

	
	self should: [tableTerniLapilli moveXFrom: (5@5) to: (2@2).] raise: Error - MessageNotUnderstood withMessageText: Tablero invalidPositionErrorMessage .
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'Lucas 11/6/2018 23:57:02'!
test29cantMoveXWithInexistantEndPosition

	| tableTerniLapilli |
	
	tableTerniLapilli := Tablero new.
	tableTerniLapilli addXIn: (1@1).	
	tableTerniLapilli addOIn: (2@1).
	tableTerniLapilli addXIn: (1@2).
	tableTerniLapilli addOIn: (3@1).	
	tableTerniLapilli addXIn: (2@3).
	tableTerniLapilli addOIn: (3@2).

	
	self should: [tableTerniLapilli moveXFrom: (1@1) to: (5@5).] raise: Error - MessageNotUnderstood withMessageText: Tablero invalidPositionErrorMessage .
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/5/2018 19:43:46'!
test30cantMoveOWithInexistantInitialPosition

	| tableTerniLapilli |
	
	tableTerniLapilli := Tablero new.
	tableTerniLapilli addXIn: (1@1).	
	tableTerniLapilli addOIn: (2@1).
	tableTerniLapilli addXIn: (1@2).
	tableTerniLapilli addOIn: (3@1).	
	tableTerniLapilli addXIn: (2@3).
	tableTerniLapilli addOIn: (3@2).

	tableTerniLapilli moveXFrom: (1@1) to: (2@2).
	
	self should: [tableTerniLapilli moveOFrom: (5@5) to: (3@3).] raise: Error - MessageNotUnderstood withMessageText: Tablero invalidPositionErrorMessage .
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/5/2018 19:44:38'!
test31cantMoveOWithInexistantEndPosition

	| tableTerniLapilli |
	
	tableTerniLapilli := Tablero new.
	tableTerniLapilli addXIn: (1@1).	
	tableTerniLapilli addOIn: (2@1).
	tableTerniLapilli addXIn: (1@2).
	tableTerniLapilli addOIn: (3@1).	
	tableTerniLapilli addXIn: (2@3).
	tableTerniLapilli addOIn: (3@2).

	tableTerniLapilli moveXFrom: (1@1) to: (2@2).
	
	self should: [tableTerniLapilli moveOFrom: (2@1) to: (5@5).] raise: Error - MessageNotUnderstood withMessageText: Tablero invalidPositionErrorMessage .
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/5/2018 19:50:57'!
test33XhasWonWithAfterMove

	| tableTerniLapilli |
	
	tableTerniLapilli := Tablero new.
	tableTerniLapilli addXIn: (1@1).	
	tableTerniLapilli addOIn: (2@1).
	tableTerniLapilli addXIn: (1@2).
	tableTerniLapilli addOIn: (3@1).	
	tableTerniLapilli addXIn: (2@3).
	tableTerniLapilli addOIn: (3@2).

	tableTerniLapilli moveXFrom: (2@3) to: (1@3).

	self assert: (tableTerniLapilli xHasWon).
	self deny: (tableTerniLapilli oHasWon).
	
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/5/2018 19:54:03'!
test34OhasWonWithAfterMove

	| tableTerniLapilli |
	
	tableTerniLapilli := Tablero new.
	tableTerniLapilli addXIn: (1@1).	
	tableTerniLapilli addOIn: (2@2).
	tableTerniLapilli addXIn: (1@2).
	tableTerniLapilli addOIn: (3@1).	
	tableTerniLapilli addXIn: (3@3).
	tableTerniLapilli addOIn: (3@2).

	tableTerniLapilli moveXFrom: (3@3) to: (2@3).
	tableTerniLapilli moveOFrom: (2@2) to: (3@3).

	self assert: (tableTerniLapilli oHasWon).
	self deny: (tableTerniLapilli xHasWon).
	
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/5/2018 19:56:46'!
test35XCantMoveAfterGameIsOver

	| tableTerniLapilli |
	
	tableTerniLapilli := Tablero new.
	tableTerniLapilli addXIn: (1@1).	
	tableTerniLapilli addOIn: (2@2).
	tableTerniLapilli addXIn: (1@2).
	tableTerniLapilli addOIn: (3@1).	
	tableTerniLapilli addXIn: (3@3).
	tableTerniLapilli addOIn: (3@2).

	tableTerniLapilli moveXFrom: (3@3) to: (2@3).
	tableTerniLapilli moveOFrom: (2@2) to: (3@3).

	self should: [tableTerniLapilli moveXFrom: (2@3) to: (1@3)] raise: Error - MessageNotUnderstood withMessageText: Tablero gameIsOverErrorMessage .
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/5/2018 19:58:24'!
test36OCantMoveAfterGameIsOver

	| tableTerniLapilli |
	
	tableTerniLapilli := Tablero new.
	tableTerniLapilli addXIn: (1@1).	
	tableTerniLapilli addOIn: (2@2).
	tableTerniLapilli addXIn: (1@2).
	tableTerniLapilli addOIn: (3@1).	
	tableTerniLapilli addXIn: (2@3).
	tableTerniLapilli addOIn: (3@2).

	tableTerniLapilli moveXFrom: (2@3) to: (1@3).
	

	self should: [tableTerniLapilli moveOFrom: (2@2) to: (3@3).] raise: Error - MessageNotUnderstood withMessageText: Tablero gameIsOverErrorMessage .
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/5/2018 20:07:25'!
test37XCantMoveIfNotAllTokensWherePlayed

	| tableTerniLapilli |
	
	tableTerniLapilli := Tablero new.
	tableTerniLapilli addXIn: (1@1).	
	tableTerniLapilli addOIn: (2@2).
	tableTerniLapilli addXIn: (1@3).
	tableTerniLapilli addOIn: (3@1).	
	

	self should: [tableTerniLapilli moveXFrom: (1@1) to: (1@2).] raise: Error - MessageNotUnderstood withMessageText: Tablero cantMoveTillAllTokensArePositionedErrorMessage.
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'AC 11/5/2018 20:09:13'!
test38OCantMoveIfNotAllTokensWherePlayed

	| tableTerniLapilli |
	
	tableTerniLapilli := Tablero new.
	tableTerniLapilli addXIn: (1@1).	
	tableTerniLapilli addOIn: (2@2).
	tableTerniLapilli addXIn: (1@3).
	

	self should: [tableTerniLapilli moveXFrom: (2@2) to: (1@2).] raise: Error - MessageNotUnderstood withMessageText: Tablero cantMoveTillAllTokensArePositionedErrorMessage.
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'Lucas 11/7/2018 00:20:32'!
test39OCantAddedIfAllTokensWherePlayed

	| tableTerniLapilli |
	
	tableTerniLapilli := Tablero new.
	tableTerniLapilli addXIn: (1@1).	
	tableTerniLapilli addOIn: (2@1).
	tableTerniLapilli addXIn: (1@2).
	tableTerniLapilli addOIn: (3@1).	
	tableTerniLapilli addXIn: (2@3).
	tableTerniLapilli addOIn: (3@2).

	tableTerniLapilli moveXFrom: (1@1) to: (2@2).
	
	self should: [tableTerniLapilli addOIn: (3@3).] raise: Error - MessageNotUnderstood withMessageText: Tablero cantAddedWhenAllTokensArePositionedErrorMessage.
	
	! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'Lucas 11/7/2018 00:22:22'!
test40XCantAddedIfAllTokensWherePlayed

	| tableTerniLapilli |
	
	tableTerniLapilli := Tablero new.
	tableTerniLapilli addXIn: (1@1).	
	tableTerniLapilli addOIn: (2@1).
	tableTerniLapilli addXIn: (1@2).
	tableTerniLapilli addOIn: (3@1).	
	tableTerniLapilli addXIn: (2@3).
	tableTerniLapilli addOIn: (3@2).

	tableTerniLapilli moveXFrom: (2@3) to: (3@3).
	tableTerniLapilli moveOFrom: (2@1) to: (2@2).
	
	self should: [tableTerniLapilli addXIn: (2@3).] raise: Error - MessageNotUnderstood withMessageText: Tablero cantAddedWhenAllTokensArePositionedErrorMessage.
	
	! !


!classDefinition: #Tablero category: #'Terni-Lapilli'!
Object subclass: #Tablero
	instanceVariableNames: 'pointsO pointsX state'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Terni-Lapilli'!

!Tablero methodsFor: 'operations' stamp: 'Lucas 11/7/2018 00:02:36'!
addOIn: aPoint 

	state addOIn: aPoint.
	(self xCount = 3) ifTrue: [state := SlidingX with: self] ifFalse: [state := PlacingX with: self].
	self verifyOWon.
	
! !

!Tablero methodsFor: 'operations' stamp: 'Lucas 11/7/2018 00:02:16'!
addXIn: aPoint 
	
	state addXIn: aPoint.
	state := PlacingO with: self.
	self verifyXWon.

	! !

!Tablero methodsFor: 'operations' stamp: 'AC 11/5/2018 18:00:29'!
isInvalidPosition: aPoint

	| xIsInvalid yIsInvalid |
	
	xIsInvalid := (aPoint x < 1) or: [aPoint x > 3].
	yIsInvalid := (aPoint y < 1) or: [aPoint y > 3].
	^xIsInvalid or:[yIsInvalid].! !

!Tablero methodsFor: 'operations' stamp: 'AC 11/5/2018 19:23:02'!
isValidMoveFrom: aPoint to: aPoint2 
	
	| center |
	center := (2@2).
	^(aPoint = center) or:[ aPoint2 = center or: [ | rest |rest := ((aPoint - aPoint2) abs). (rest x + rest y) = 1]]! !

!Tablero methodsFor: 'operations' stamp: 'Lucas 11/7/2018 00:10:28'!
moveOFrom: aPoint to: aPoint2 
	
	state moveOFrom: aPoint to: aPoint2.
	state := SlidingX with: self.
	self verifyOWon.
! !

!Tablero methodsFor: 'operations' stamp: 'Lucas 11/7/2018 00:10:34'!
moveXFrom: aPoint to: aPoint2 
	
	state moveXFrom: aPoint to: aPoint2.
	state := SlidingO with: self.
	self verifyXWon.! !

!Tablero methodsFor: 'operations' stamp: 'Lucas 11/7/2018 00:09:44'!
verifyOWon
	
	(self verifyHasWonUsing: pointsO) ifTrue: [state := WinnerO with: self].! !

!Tablero methodsFor: 'operations' stamp: 'Lucas 11/7/2018 00:09:35'!
verifyXWon
	
	(self verifyHasWonUsing: pointsX) ifTrue: [state := WinnerX with: self].! !


!Tablero methodsFor: 'testing' stamp: 'AC 11/1/2018 19:51:14'!
hasOIn: aPoint 
	
	^pointsO includes: aPoint.! !

!Tablero methodsFor: 'testing' stamp: 'AC 11/1/2018 19:50:02'!
hasXIn: aPoint 

	^pointsX includes: aPoint.
	! !

!Tablero methodsFor: 'testing' stamp: 'Lucas 11/7/2018 00:11:54'!
oHasWon
	^state oHasWon! !

!Tablero methodsFor: 'testing' stamp: 'Lucas 11/7/2018 00:12:06'!
xHasWon
	^state xHasWon! !


!Tablero methodsFor: 'information' stamp: 'AC 11/5/2018 17:29:59'!
oCount

	^pointsO size! !

!Tablero methodsFor: 'information' stamp: 'AC 11/5/2018 17:29:52'!
xCount

	^pointsX size! !


!Tablero methodsFor: 'private' stamp: 'Lucas 11/6/2018 22:12:57'!
add: aPoint in: aCollection
	
	(self isInvalidPosition: aPoint) ifTrue: [self error: self class invalidPositionErrorMessage].
	(self hasOIn: aPoint) ifTrue: [self error: self class positionAlreadyTakenErrorMessage ].
	(self hasXIn: aPoint) ifTrue: [self error: self class positionAlreadyTakenErrorMessage ].
	
	aCollection add: aPoint.
	


"
	winner ifNotNil: [self error: self class gameIsOverErrorMessage]. 
	
	(self isInvalidPosition: aPoint) ifTrue: [self error: self class invalidPositionErrorMessage].
	(self hasOIn: aPoint) ifTrue: [self error: self class positionAlreadyTakenErrorMessage ].
	(self hasXIn: aPoint) ifTrue: [self error: self class positionAlreadyTakenErrorMessage ].

	(aCollection size = 3) ifTrue: [self error: self class allTokensWhereAddedErrorMessage ].
	
	aCollection add: aPoint.
"! !

!Tablero methodsFor: 'private' stamp: 'Lucas 11/6/2018 22:11:45'!
addO: aPoint 
	
	self add: aPoint in: pointsO.

	! !

!Tablero methodsFor: 'private' stamp: 'Lucas 11/6/2018 22:11:00'!
addX: aPoint 
	
	self add: aPoint in: pointsX.

	! !

!Tablero methodsFor: 'private' stamp: 'Lucas 11/6/2018 23:46:05'!
moveFrom: aPoint to: aPoint2 with: aCollection andThen: aBlock
	
	((self isInvalidPosition: aPoint) or: [self isInvalidPosition: aPoint2]) ifTrue: [self error: self class invalidPositionErrorMessage ].
	((pointsX includes: aPoint2) or: [pointsO includes: aPoint2]) ifTrue: [self error: self class positionAlreadyTakenErrorMessage].
	((self isValidMoveFrom: aPoint to: aPoint2) not) ifTrue: [self error: self class cantMoveMoreThanOneSegmentsErrorMessage ].
	((aCollection includes: aPoint) not) ifTrue: [self error: self class noTokenToMoveErrorMessage].
	
	aCollection remove: aPoint.
	aBlock value.
	
	
	"
	((self isInvalidPosition: aPoint) or: [self isInvalidPosition: aPoint2]) ifTrue: [self error: self class invalidPositionErrorMessage ].
	((pointsX includes: aPoint2) or: [pointsO includes: aPoint2]) ifTrue: [self error: self class positionAlreadyTakenErrorMessage].
	((self isValidMoveFrom: aPoint to: aPoint2) not) ifTrue: [self error: self class cantMoveMoreThanOneSegmentsErrorMessage ].

	((aCollection size = 3) not) ifTrue: [self error: self class cantMoveTillAllTokensArePositionedErrorMessage ].
	((aCollection includes: aPoint) not) ifTrue: [self error: self class noTokenToMoveErrorMessage].
	aCollection remove: aPoint.
	
	aBlock value.
	
	"! !

!Tablero methodsFor: 'private' stamp: 'Lucas 11/6/2018 23:42:58'!
slidingOFrom: aPoint to: aPoint2
	
	self moveFrom: aPoint to: aPoint2 with: pointsO andThen: [self addO: aPoint2]! !

!Tablero methodsFor: 'private' stamp: 'Lucas 11/6/2018 23:42:27'!
slidingXFrom: aPoint to: aPoint2
	
	self moveFrom: aPoint to: aPoint2 with: pointsX andThen: [self addX: aPoint2]! !

!Tablero methodsFor: 'private' stamp: 'Lucas 11/7/2018 00:09:54'!
verifyHasWonUsing: aCollection
	
	| row column |
	
	((aCollection size = 3) not ) ifTrue: [^false].
	
	(aCollection allSatisfy: [:aPoint | (aPoint x = aPoint y)]) ifTrue: [^true].
	(aCollection allSatisfy: [:aPoint | (aPoint = (2@2)) or: (aPoint = (1@3)) or: (aPoint = (3@1))]) ifTrue: [^true].
	
	row := (aCollection at:1) x. 
	(aCollection allSatisfy: [:aPoint | aPoint x = row]) ifTrue: [^true].
	
	column := (aCollection at:1) y. 
	(aCollection allSatisfy: [:aPoint | aPoint y = column]) ifTrue: [^true].
	
	^false! !


!Tablero methodsFor: 'initialization' stamp: 'Lucas 11/6/2018 21:17:14'!
initialize
	
	pointsO := OrderedCollection new.
	pointsX := OrderedCollection new.
	turn := 'x'.
	winner := nil.
	state := PlacingX with: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Tablero class' category: #'Terni-Lapilli'!
Tablero class
	instanceVariableNames: ''!

!Tablero class methodsFor: 'ErrorMessage' stamp: 'AC 11/5/2018 18:06:02'!
allTokensWhereAddedErrorMessage
	
	^'Cant add more than 3 tokens of same type'! !

!Tablero class methodsFor: 'ErrorMessage' stamp: 'Lucas 11/6/2018 22:00:16'!
cantAddedWhenAllTokensArePositionedErrorMessage
	
	^'Cant add token when all tokens are positioned'! !

!Tablero class methodsFor: 'ErrorMessage' stamp: 'AC 11/5/2018 19:09:48'!
cantMoveMoreThanOneSegmentsErrorMessage
	
	^'Cant move more than 1 segment'! !

!Tablero class methodsFor: 'ErrorMessage' stamp: 'AC 11/5/2018 20:06:55'!
cantMoveTillAllTokensArePositionedErrorMessage

	^'Cant make a move if there are still tokens to be positioned'! !

!Tablero class methodsFor: 'ErrorMessage' stamp: 'AC 11/5/2018 18:56:38'!
gameIsOverErrorMessage
	^'Game is over'! !

!Tablero class methodsFor: 'ErrorMessage' stamp: 'AC 11/5/2018 17:56:59'!
invalidPositionErrorMessage
	^'Not a valid position'! !

!Tablero class methodsFor: 'ErrorMessage' stamp: 'AC 11/5/2018 19:31:56'!
noTokenToMoveErrorMessage
	^'No token to move'! !

!Tablero class methodsFor: 'ErrorMessage' stamp: 'AC 11/5/2018 17:41:31'!
notOTurnErrorMessage
	^'Its not O turn'! !

!Tablero class methodsFor: 'ErrorMessage' stamp: 'AC 11/5/2018 17:41:59'!
notXTurnErrorMessage
	^'Its not X turn'! !

!Tablero class methodsFor: 'ErrorMessage' stamp: 'AC 11/5/2018 18:02:49'!
positionAlreadyTakenErrorMessage
	
	^'Cant add token in cell that already has a token'! !


!classDefinition: #TableroState category: #'Terni-Lapilli'!
Object subclass: #TableroState
	instanceVariableNames: 'tablero'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Terni-Lapilli'!

!TableroState methodsFor: 'initialization' stamp: 'Lucas 11/6/2018 21:11:36'!
inicializeWith: aTablero

	tablero := aTablero.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TableroState class' category: #'Terni-Lapilli'!
TableroState class
	instanceVariableNames: ''!

!TableroState class methodsFor: 'as yet unclassified' stamp: 'Lucas 11/6/2018 21:11:07'!
with: aTablero

	^self new inicializeWith: aTablero.! !


!classDefinition: #PlacingO category: #'Terni-Lapilli'!
TableroState subclass: #PlacingO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Terni-Lapilli'!

!PlacingO methodsFor: 'initialization' stamp: 'Lucas 11/6/2018 21:53:14'!
inicializeWith: aTablero

	tablero := aTablero.! !


!PlacingO methodsFor: 'operations' stamp: 'Lucas 11/6/2018 21:53:43'!
addOIn: aPoint

	tablero addO: aPoint.
	! !

!PlacingO methodsFor: 'operations' stamp: 'Lucas 11/6/2018 22:19:52'!
addXIn: aPoint

	self error: tablero class notXTurnErrorMessage! !

!PlacingO methodsFor: 'operations' stamp: 'Lucas 11/6/2018 23:30:32'!
moveOFrom: aPoint to: aPoint2 

	self error: tablero class cantMoveTillAllTokensArePositionedErrorMessage! !

!PlacingO methodsFor: 'operations' stamp: 'Lucas 11/6/2018 23:34:28'!
moveXFrom: aPoint to: aPoint2 

	self error: tablero class cantMoveTillAllTokensArePositionedErrorMessage! !


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

!PlacingO class methodsFor: 'initialization' stamp: 'Lucas 11/6/2018 21:53:14'!
with: aTablero

	^self new inicializeWith: aTablero.! !


!classDefinition: #PlacingX category: #'Terni-Lapilli'!
TableroState subclass: #PlacingX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Terni-Lapilli'!

!PlacingX methodsFor: 'initialization' stamp: 'Lucas 11/6/2018 21:16:00'!
inicializeWith: aTablero

	tablero := aTablero.! !


!PlacingX methodsFor: 'operations' stamp: 'Lucas 11/6/2018 22:19:45'!
addOIn: aPoint

	self error: tablero class notOTurnErrorMessage! !

!PlacingX methodsFor: 'operations' stamp: 'Lucas 11/6/2018 21:45:42'!
addXIn: aPoint

	tablero addX: aPoint.! !

!PlacingX methodsFor: 'operations' stamp: 'Lucas 11/6/2018 23:30:20'!
moveOFrom: aPoint to: aPoint2

	self error: tablero class cantMoveTillAllTokensArePositionedErrorMessage! !

!PlacingX methodsFor: 'operations' stamp: 'Lucas 11/6/2018 23:34:34'!
moveXFrom: aPoint to: aPoint2

	self error: tablero class cantMoveTillAllTokensArePositionedErrorMessage! !


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

!PlacingX class methodsFor: 'initialization' stamp: 'Lucas 11/6/2018 21:12:03'!
with: aTablero

	^self new inicializeWith: aTablero.! !


!classDefinition: #SlidingO category: #'Terni-Lapilli'!
TableroState subclass: #SlidingO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Terni-Lapilli'!

!SlidingO methodsFor: 'initialization' stamp: 'Lucas 11/6/2018 22:02:20'!
inicializeWith: aTablero

	tablero := aTablero.! !


!SlidingO methodsFor: 'operations' stamp: 'Lucas 11/6/2018 22:21:17'!
addOIn: aPoint

	self error: tablero class cantAddedWhenAllTokensArePositionedErrorMessage! !

!SlidingO methodsFor: 'operations' stamp: 'Lucas 11/6/2018 22:21:13'!
addXIn: aPoint

	self error: tablero class cantAddedWhenAllTokensArePositionedErrorMessage! !

!SlidingO methodsFor: 'operations' stamp: 'Lucas 11/6/2018 23:41:13'!
moveOFrom: aPoint to: aPoint2

	tablero slidingOFrom: aPoint to: aPoint2! !

!SlidingO methodsFor: 'operations' stamp: 'Lucas 11/6/2018 23:35:26'!
moveXFrom: aPoint to: aPoint2

	self error: tablero class notXTurnErrorMessage! !


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

!SlidingO class methodsFor: 'initialization' stamp: 'Lucas 11/6/2018 22:02:20'!
with: aTablero

	^self new inicializeWith: aTablero.! !


!classDefinition: #SlidingX category: #'Terni-Lapilli'!
TableroState subclass: #SlidingX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Terni-Lapilli'!

!SlidingX methodsFor: 'initialization' stamp: 'Lucas 11/6/2018 21:16:07'!
inicializeWith: aTablero

	tablero := aTablero.! !


!SlidingX methodsFor: 'operations' stamp: 'Lucas 11/6/2018 22:20:33'!
addOIn: aPoint

	self error: tablero class cantAddedWhenAllTokensArePositionedErrorMessage! !

!SlidingX methodsFor: 'operations' stamp: 'Lucas 11/6/2018 22:20:39'!
addXIn: aPoint

	self error: tablero class cantAddedWhenAllTokensArePositionedErrorMessage! !

!SlidingX methodsFor: 'operations' stamp: 'Lucas 11/6/2018 23:35:14'!
moveOFrom: aPoint to: aPoint2

	self error: tablero class notOTurnErrorMessage! !

!SlidingX methodsFor: 'operations' stamp: 'Lucas 11/6/2018 23:40:50'!
moveXFrom: aPoint to: aPoint2

	tablero slidingXFrom: aPoint to: aPoint2! !


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

!SlidingX class methodsFor: 'initialization' stamp: 'Lucas 11/6/2018 21:12:18'!
with: aTablero

	^self new inicializeWith: aTablero.! !


!classDefinition: #WinnerO category: #'Terni-Lapilli'!
TableroState subclass: #WinnerO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Terni-Lapilli'!

!WinnerO methodsFor: 'initialization' stamp: 'Lucas 11/6/2018 22:03:56'!
inicializeWith: aTablero

	tablero := aTablero.! !


!WinnerO methodsFor: 'operations' stamp: 'Lucas 11/6/2018 22:20:46'!
addOIn: aPoint

	self error: tablero class gameIsOverErrorMessage! !

!WinnerO methodsFor: 'operations' stamp: 'Lucas 11/6/2018 22:20:51'!
addXIn: aPoint

	self error: tablero class gameIsOverErrorMessage! !

!WinnerO methodsFor: 'operations' stamp: 'Lucas 11/6/2018 23:31:02'!
moveOFrom: aPoint to: aPoint2

	self error: tablero class gameIsOverErrorMessage! !

!WinnerO methodsFor: 'operations' stamp: 'Lucas 11/6/2018 23:34:41'!
moveXFrom: aPoint to: aPoint2

	self error: tablero class gameIsOverErrorMessage! !


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

!WinnerO class methodsFor: 'initialization' stamp: 'Lucas 11/6/2018 22:03:56'!
with: aTablero

	^self new inicializeWith: aTablero.! !


!classDefinition: #WinnerX category: #'Terni-Lapilli'!
TableroState subclass: #WinnerX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Terni-Lapilli'!

!WinnerX methodsFor: 'initialization' stamp: 'Lucas 11/6/2018 21:16:14'!
inicializeWith: aTablero

	tablero := aTablero.! !


!WinnerX methodsFor: 'operations' stamp: 'Lucas 11/6/2018 22:20:57'!
addOIn: aPoint

	self error: tablero class gameIsOverErrorMessage! !

!WinnerX methodsFor: 'operations' stamp: 'Lucas 11/6/2018 22:21:02'!
addXIn: aPoint

	self error: tablero class gameIsOverErrorMessage! !

!WinnerX methodsFor: 'operations' stamp: 'Lucas 11/6/2018 23:31:09'!
moveOFrom: aPoint to: aPoint2

	self error: tablero class gameIsOverErrorMessage! !

!WinnerX methodsFor: 'operations' stamp: 'Lucas 11/6/2018 23:34:47'!
moveXFrom: aPoint to: aPoint2

	self error: tablero class gameIsOverErrorMessage! !


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

!WinnerX class methodsFor: 'initialization' stamp: 'Lucas 11/6/2018 21:12:29'!
with: aTablero

	^self new inicializeWith: aTablero.! !
