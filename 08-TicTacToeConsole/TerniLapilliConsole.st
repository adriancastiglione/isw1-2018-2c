!classDefinition: #TerniLapilliConsoleTest category: #TerniLapilliConsole!
TestCase subclass: #TerniLapilliConsoleTest
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliConsole'!

!TerniLapilliConsoleTest methodsFor: 'testing' stamp: 'AC 11/11/2018 01:25:20'!
test01ConsoleIsEmptyWhenCreated

	| console |
	game _ TerniLapilli  new.
	console _ TerniLapilliConsole on: game.

	self assert: console lines isEmpty.! !

!TerniLapilliConsoleTest methodsFor: 'testing' stamp: 'AC 11/11/2018 01:26:10'!
test02ConsoleDisplaysXPlacingWithCorrectState

	| console lines |
	game _ TerniLapilli  new.
	console _ TerniLapilliConsole on: game.

	game putXAt: 1@1.
	
	lines _ console lines.
	
	self assert: 'X marcó en 1@1' equals: lines next.
	self assert: 'Estado: Jugando O' equals: lines next.
	self assert: lines atEnd.! !

!TerniLapilliConsoleTest methodsFor: 'testing' stamp: 'AC 11/11/2018 01:26:28'!
test03ConsoleDisplaysOPlacingWithCorrectState

	| console lines |
	game _ TerniLapilli  new.
	console _ TerniLapilliConsole on: game.

	game putXAt: 2@2.
	game putOAt: 1@1.
	
	lines _ console lines.
	
	self assert: 'X marcó en 2@2' equals: lines next.
	self assert: 'Estado: Jugando O' equals: lines next.
	self assert: 'O marcó en 1@1' equals: lines next.
	self assert: 'Estado: Jugando X' equals: lines next.
	self assert: lines atEnd.! !

!TerniLapilliConsoleTest methodsFor: 'testing' stamp: 'AC 11/11/2018 01:27:00'!
test04ConsoleDisplaysXWinningByPlacing

	| console lines |
	game _ TerniLapilli  new.
	console _ TerniLapilliConsole on: game.

	game putXAt: 2@2.
	game putOAt: 1@1.
	game putXAt: 1@3.
	game putOAt: 1@2.
	game putXAt: 3@1.
	
	lines _ console lines.
	
	self assert: 'X marcó en 2@2' equals: lines next.
	self assert: 'Estado: Jugando O' equals: lines next.
	self assert: 'O marcó en 1@1' equals: lines next.
	self assert: 'Estado: Jugando X' equals: lines next.
	self assert: 'X marcó en 1@3' equals: lines next.
	self assert: 'Estado: Jugando O' equals: lines next.
	self assert: 'O marcó en 1@2' equals: lines next.
	self assert: 'Estado: Jugando X' equals: lines next.
	self assert: 'X marcó en 3@1' equals: lines next.
	self assert: 'Estado: Juego terminado - ¡Ganó X!!' equals: lines next.
	self assert: lines atEnd.! !

!TerniLapilliConsoleTest methodsFor: 'testing' stamp: 'AC 11/11/2018 01:27:36'!
test05ConsoleDisplaysOWinningByPlacing

	| console lines |
	game _ TerniLapilli  new.
	console _ TerniLapilliConsole on: game.

	game putXAt: 3@2.
	game putOAt: 1@1.
	game putXAt: 2@3.
	game putOAt: 1@2.
	game putXAt: 2@1.
	game putOAt: 1@3.
	
	lines _ console lines.
	
	self assert: 'X marcó en 3@2' equals: lines next.
	self assert: 'Estado: Jugando O' equals: lines next.
	self assert: 'O marcó en 1@1' equals: lines next.
	self assert: 'Estado: Jugando X' equals: lines next.
	self assert: 'X marcó en 2@3' equals: lines next.
	self assert: 'Estado: Jugando O' equals: lines next.
	self assert: 'O marcó en 1@2' equals: lines next.
	self assert: 'Estado: Jugando X' equals: lines next.
	self assert: 'X marcó en 2@1' equals: lines next.
	self assert: 'Estado: Jugando O' equals: lines next.
	self assert: 'O marcó en 1@3' equals: lines next.
	self assert: 'Estado: Juego terminado - ¡Ganó O!!' equals: lines next.
	self assert: lines atEnd.! !

!TerniLapilliConsoleTest methodsFor: 'testing' stamp: 'AC 11/11/2018 01:28:38'!
test06ConsoleDisplaysSlidingsFromBothPlayers

	| console lines |
	game _ TerniLapilli  new.
	console _ TerniLapilliConsole on: game.

	game putXAt: 2@2.
	game putOAt: 1@1.
	game putXAt: 1@3.
	game putOAt: 3@1.
	game putXAt: 2@1.
	game putOAt: 2@3.
	game slideXFrom: 1@3  to: 1@2.
	game slideOFrom: 3@1  to: 3@2.
	game slideXFrom: 2@2  to: 3@3.
	
	lines _ console lines.
	
	self assert: 'X marcó en 2@2' equals: lines next.
	self assert: 'Estado: Jugando O' equals: lines next.
	self assert: 'O marcó en 1@1' equals: lines next.
	self assert: 'Estado: Jugando X' equals: lines next.
	self assert: 'X marcó en 1@3' equals: lines next.
	self assert: 'Estado: Jugando O' equals: lines next.
	self assert: 'O marcó en 3@1' equals: lines next.
	self assert: 'Estado: Jugando X' equals: lines next.
	self assert: 'X marcó en 2@1' equals: lines next.
	self assert: 'Estado: Jugando O' equals: lines next.
	self assert: 'O marcó en 2@3' equals: lines next.
	self assert: 'Estado: Jugando X' equals: lines next.
	self assert: 'X deslizó hasta 1@2 desde 1@3' equals: lines next.
	self assert: 'Estado: Jugando O' equals: lines next.
	self assert: 'O deslizó hasta 3@2 desde 3@1' equals: lines next.
	self assert: 'Estado: Jugando X' equals: lines next.
	self assert: 'X deslizó hasta 3@3 desde 2@2' equals: lines next.
	self assert: 'Estado: Jugando O' equals: lines next.
	self assert: lines atEnd.! !

!TerniLapilliConsoleTest methodsFor: 'testing' stamp: 'AC 11/11/2018 01:28:32'!
test07ConsoleDisplaysXWinningBySliding

	| console lines |
	game _ TerniLapilli  new.
	console _ TerniLapilliConsole on: game.

	game putXAt: 2@2.
	game putOAt: 1@1.
	game putXAt: 1@3.
	game putOAt: 3@1.
	game putXAt: 2@1.
	game putOAt: 3@3.
	game slideXFrom: 1@3  to: 2@3.

	
	lines _ console lines.
	
	self assert: 'X marcó en 2@2' equals: lines next.
	self assert: 'Estado: Jugando O' equals: lines next.
	self assert: 'O marcó en 1@1' equals: lines next.
	self assert: 'Estado: Jugando X' equals: lines next.
	self assert: 'X marcó en 1@3' equals: lines next.
	self assert: 'Estado: Jugando O' equals: lines next.
	self assert: 'O marcó en 3@1' equals: lines next.
	self assert: 'Estado: Jugando X' equals: lines next.
	self assert: 'X marcó en 2@1' equals: lines next.
	self assert: 'Estado: Jugando O' equals: lines next.
	self assert: 'O marcó en 3@3' equals: lines next.
	self assert: 'Estado: Jugando X' equals: lines next.
	self assert: 'X deslizó hasta 2@3 desde 1@3' equals: lines next.
	self assert: 'Estado: Juego terminado - ¡Ganó X!!' equals: lines next.
	self assert: lines atEnd.! !

!TerniLapilliConsoleTest methodsFor: 'testing' stamp: 'AC 11/11/2018 01:29:06'!
test08ConsoleDisplaysOWinnnigBySliding

	| console lines |
	game _ TerniLapilli  new.
	console _ TerniLapilliConsole on: game.

	game putXAt: 2@2.
	game putOAt: 3@2.
	game putXAt: 1@3.
	game putOAt: 3@1.
	game putXAt: 2@1.
	game putOAt: 2@3.
	game slideXFrom: 1@3  to: 1@2.
	game slideOFrom: 2@3  to: 3@3.

	
	lines _ console lines.
	
	self assert: 'X marcó en 2@2' equals: lines next.
	self assert: 'Estado: Jugando O' equals: lines next.
	self assert: 'O marcó en 3@2' equals: lines next.
	self assert: 'Estado: Jugando X' equals: lines next.
	self assert: 'X marcó en 1@3' equals: lines next.
	self assert: 'Estado: Jugando O' equals: lines next.
	self assert: 'O marcó en 3@1' equals: lines next.
	self assert: 'Estado: Jugando X' equals: lines next.
	self assert: 'X marcó en 2@1' equals: lines next.
	self assert: 'Estado: Jugando O' equals: lines next.
	self assert: 'O marcó en 2@3' equals: lines next.
	self assert: 'Estado: Jugando X' equals: lines next.
	self assert: 'X deslizó hasta 1@2 desde 1@3' equals: lines next.
	self assert: 'Estado: Jugando O' equals: lines next.
	self assert: 'O deslizó hasta 3@3 desde 2@3' equals: lines next.
	self assert: 'Estado: Juego terminado - ¡Ganó O!!' equals: lines next.
	self assert: lines atEnd.! !

!TerniLapilliConsoleTest methodsFor: 'testing' stamp: 'Lucas 11/11/2018 22:21:08'!
test09ViewIsEmptyWhenCreated

	| view lines |
	game _ TerniLapilli  new.
	view _ TerniLapilliView on: game.
	
	lines _ view lines.
	
	self assert: ' | | ' equals: lines next.
	self assert: '-----' equals: lines next.
	self assert: ' | | ' equals: lines next.
	self assert: '-----' equals: lines next.
	self assert: ' | | ' equals: lines next.
	self assert: 'Playing X' equals: lines next.
	
	
	! !

!TerniLapilliConsoleTest methodsFor: 'testing' stamp: 'Lucas 11/11/2018 21:40:22'!
test10ViewDisplaysXPlacingWithCorrectState

	| view lines |
	game _ TerniLapilli  new.
	view _ TerniLapilliView on: game.
	
	game putXAt: 2@2.

	lines _ view lines.
	
	self assert: ' | | ' equals: lines next.
	self assert: '-----' equals: lines next.
	self assert: ' |X| ' equals: lines next.
	self assert: '-----' equals: lines next.
	self assert: ' | | ' equals: lines next.
	self assert: 'Playing O' equals: lines next.
	
	! !

!TerniLapilliConsoleTest methodsFor: 'testing' stamp: 'Lucas 11/11/2018 21:33:59'!
test11ViewDisplaysOPlacingWithCorrectState

	| view lines |
	game _ TerniLapilli  new.
	view _ TerniLapilliView on: game.
	
	game putXAt: 2@2.
	game putOAt: 3@1.

	lines _ view lines.
	
	self assert: ' | | ' equals: lines next.
	self assert: '-----' equals: lines next.
	self assert: ' |X| ' equals: lines next.
	self assert: '-----' equals: lines next.
	self assert: 'O| | ' equals: lines next.
	self assert: 'Playing X' equals: lines next.
	
	! !

!TerniLapilliConsoleTest methodsFor: 'testing' stamp: 'Lucas 11/11/2018 21:34:02'!
test12ViewDisplaysXWinningByPlacing

	| view lines |
	game _ TerniLapilli  new.
	view _ TerniLapilliView on: game.
	
	game putXAt: 2@2.
	game putOAt: 3@1.
	game putXAt: 1@1.
	game putOAt: 2@1.
	game putXAt: 3@3.

	lines _ view lines.
	
	self assert: 'X| | ' equals: lines next.
	self assert: '-----' equals: lines next.
	self assert: 'O|X| ' equals: lines next.
	self assert: '-----' equals: lines next.
	self assert: 'O| |X' equals: lines next.
	self assert: 'X Won!!' equals: lines next.
	
	! !

!TerniLapilliConsoleTest methodsFor: 'testing' stamp: 'Lucas 11/11/2018 21:34:06'!
test13ViewDisplaysOWinningByPlacing

	| view lines |
	game _ TerniLapilli  new.
	view _ TerniLapilliView on: game.
	
	game putXAt: 2@2.
	game putOAt: 3@1.
	game putXAt: 1@1.
	game putOAt: 3@2.
	game putXAt: 1@3.
	game putOAt: 3@3.

	lines _ view lines.
	
	self assert: 'X| |X' equals: lines next.
	self assert: '-----' equals: lines next.
	self assert: ' |X| ' equals: lines next.
	self assert: '-----' equals: lines next.
	self assert: 'O|O|O' equals: lines next.
	self assert: 'O Won!!' equals: lines next.
	
	! !

!TerniLapilliConsoleTest methodsFor: 'testing' stamp: 'Lucas 11/11/2018 22:06:42'!
test14ViewDisplaysSlidingsFromBothPlayers

	| view lines |
	game _ TerniLapilli  new.
	view _ TerniLapilliView on: game.
	
	game putXAt: 2@2.
	game putOAt: 3@1.
	game putXAt: 1@1.
	game putOAt: 3@3.
	game putXAt: 1@3.
	game putOAt: 1@2.
	game slideXFrom: 1@1  to: 2@1.
	game slideOFrom: 3@3  to: 2@3.
	game slideXFrom: 2@2  to: 3@2.

	lines _ view lines.
	
	self assert: ' |O|X' equals: lines next.
	self assert: '-----' equals: lines next.
	self assert: 'X| |O' equals: lines next.
	self assert: '-----' equals: lines next.
	self assert: 'O|X| ' equals: lines next.
	self assert: 'Playing O' equals: lines next.
	
	! !

!TerniLapilliConsoleTest methodsFor: 'testing' stamp: 'Lucas 11/11/2018 21:34:13'!
test15ViewDisplaysXWinningBySliding

	| view lines |
	game _ TerniLapilli  new.
	view _ TerniLapilliView on: game.
	
	game putXAt: 2@2.
	game putOAt: 3@1.
	game putXAt: 1@1.
	game putOAt: 3@2.
	game putXAt: 2@3.
	game putOAt: 2@1.
	game slideXFrom: 2@3  to: 3@3.

	lines _ view lines.
	
	self assert: 'X| | ' equals: lines next.
	self assert: '-----' equals: lines next.
	self assert: 'O|X| ' equals: lines next.
	self assert: '-----' equals: lines next.
	self assert: 'O|O|X' equals: lines next.
	self assert: 'X Won!!' equals: lines next.
	
	! !

!TerniLapilliConsoleTest methodsFor: 'testing' stamp: 'Lucas 11/11/2018 21:34:16'!
test16ViewDisplaysOWinnnigBySliding

	| view lines |
	game _ TerniLapilli  new.
	view _ TerniLapilliView on: game.
	
	game putXAt: 2@2.
	game putOAt: 3@1.
	game putXAt: 1@1.
	game putOAt: 3@2.
	game putXAt: 1@3.
	game putOAt: 2@3.
	game slideXFrom: 1@1  to: 2@1.
	game slideOFrom: 2@3  to: 3@3.

	lines _ view lines.
	
	self assert: ' | |X' equals: lines next.
	self assert: '-----' equals: lines next.
	self assert: 'X|X| ' equals: lines next.
	self assert: '-----' equals: lines next.
	self assert: 'O|O|O' equals: lines next.
	self assert: 'O Won!!' equals: lines next.
	
	! !


!classDefinition: #TerniLapilliTest category: #TerniLapilliConsole!
TestCase subclass: #TerniLapilliTest
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliConsole'!

!TerniLapilliTest methodsFor: 'assertions' stamp: 'HAW 11/8/2018 09:51:39'!
assertCanNotMarkAt: aPosition
	self assertCanNotMarkUsing: [ game putXAt: aPosition ].
	self assertCanNotMarkUsing: [ game putOAt: aPosition ].! !

!TerniLapilliTest methodsFor: 'assertions' stamp: 'JG 11/6/2018 20:12:53'!
assertCanNotMarkUsing: aMarkingClosure
	self
		should: aMarkingClosure 
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self
				assert: TerniLapilli positionOutsideBoardErrorMessage
				equals: anError messageText.
			self
				assertXIsMarkedOn:
					{}
				andOOn:
					{} ].! !

!TerniLapilliTest methodsFor: 'assertions' stamp: 'JG 11/6/2018 07:53:12'!
assertGameIsNotOver
	self deny: game isOver.
	self deny: game hasPlayerXWon.
	self deny: game hasPlayerOWon.! !

!TerniLapilliTest methodsFor: 'assertions' stamp: 'JG 11/6/2018 08:20:23'!
assertGameIsOver
	self assert: game isOver.
	self deny: game isPlayingX.
	self deny: game isPlayingO.! !

!TerniLapilliTest methodsFor: 'assertions' stamp: 'JG 11/6/2018 07:59:35'!
assertIsPlayingO
	self assert: game isPlayingO.
	self deny: game isPlayingX.
	self assertGameIsNotOver.! !

!TerniLapilliTest methodsFor: 'assertions' stamp: 'JG 11/6/2018 07:52:33'!
assertIsPlayingX
	self assert: game isPlayingX.
	self deny: game isPlayingO.
	self assertGameIsNotOver.! !

!TerniLapilliTest methodsFor: 'assertions' stamp: 'AC 11/11/2018 00:17:33'!
assertLastPlayIsAMarkingOn: aPosition
	
	| lastPlay |
	lastPlay _ game lastPlay.
	self assert: (lastPlay isAMarking).
	self assert: (lastPlay markedPosition = aPosition).! !

!TerniLapilliTest methodsFor: 'assertions' stamp: 'AC 11/11/2018 00:41:23'!
assertLastPlayIsASlidingFrom: fromPosition to: toPosition

	| lastPlay |
	lastPlay _ game lastPlay.
	self deny: lastPlay isAMarking.
	self assert: lastPlay isASliding.
	self assert: (lastPlay fromPosition) = fromPosition.
	self assert: (lastPlay toPosition) = toPosition.! !

!TerniLapilliTest methodsFor: 'assertions' stamp: 'AC 11/10/2018 20:51:15'!
assertLastPlayWasMadeByO
	
	| lastPlay |
	lastPlay _ game lastPlay.
	self assert: lastPlay wasMadeByO.
	self deny: lastPlay wasMadeByX.! !

!TerniLapilliTest methodsFor: 'assertions' stamp: 'AC 11/11/2018 00:16:26'!
assertLastPlayWasMadeByX
	
	| lastPlay |
	lastPlay _ game lastPlay.
	self assert: lastPlay wasMadeByX.
	self deny: lastPlay wasMadeByO.! !

!TerniLapilliTest methodsFor: 'assertions' stamp: 'JG 11/6/2018 07:56:00'!
assertOIsMarkedOn: oPositions
	self
		assert: oPositions size
		equals: game playerOPositions size.
	self assert: (game playerOPositions difference: oPositions ) isEmpty.! !

!TerniLapilliTest methodsFor: 'assertions' stamp: 'JG 11/6/2018 08:38:50'!
assertOWon
	self assertGameIsOver.
	self assert: game hasPlayerOWon.
	self deny: game hasPlayerXWon.! !

!TerniLapilliTest methodsFor: 'assertions' stamp: 'JG 11/6/2018 07:50:53'!
assertXIsMarkedOn: xPositions
	self
		assert: xPositions size
		equals: game playerXPositions size.
	self assert: (game playerXPositions difference: xPositions ) isEmpty.! !

!TerniLapilliTest methodsFor: 'assertions' stamp: 'JG 11/6/2018 07:48:39'!
assertXIsMarkedOn: xPositions andOOn: oPositions
	self assertXIsMarkedOn: xPositions .
	self assertOIsMarkedOn: oPositions .! !

!TerniLapilliTest methodsFor: 'assertions' stamp: 'JG 11/6/2018 08:20:00'!
assertXWon
	self assertGameIsOver.
	self assert: game hasPlayerXWon.
	self deny: game hasPlayerOWon.! !


!TerniLapilliTest methodsFor: 'testing' stamp: 'JG 11/6/2018 07:25:01'!
functionalException
	^ Error - MessageNotUnderstood.! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HAW 11/8/2018 09:31:31'!
test01aGameStartsWithAnEmptyBoardAndPlayingX

	game _ TerniLapilli new.

	self assertXIsMarkedOn: {} andOOn: {}.
	self assertIsPlayingX.! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HAW 11/8/2018 09:33:14'!
test01bGameStartsWithAnEmptyBoardButOCanNotPlayFirst
	
	| oPosition |
	
	game _ TerniLapilli new.
	oPosition _ 2@2.
	
	self should: [ game putOAt: oPosition]
		raise: self functionalException
		withExceptionDo: [ :anError |
			self
				assert: TerniLapilli notOTurnErrorMessage 
				equals: anError messageText.
			self deny: (game isTaken: oPosition) ].			
	! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'JG 11/6/2018 08:54:38'!
test02AfterMarkingWithXGameKeepsMarkAndNextPlayerIsO
	game _ TerniLapilli new.
	game putXAt: 1 @ 1.
	self
		assertXIsMarkedOn:
			{1 @ 1}
		andOOn:
			{}.
	self assertIsPlayingO.
	
	
! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'JG 11/6/2018 08:04:28'!
test03AfterMarkingWithOGameKeepsMarkAndNextPlayerIsX
	game _ TerniLapilli new.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 2.
	self
		assertXIsMarkedOn:
			{1 @ 1}
		andOOn:
			{2 @ 2}.
	self assertIsPlayingX.	
! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'JG 11/6/2018 08:07:30'!
test04CanNotMarkWithXWhenLastMarkWasX
	game _ TerniLapilli new.
	game putXAt: 1 @ 1.
	self
		should: [ game putXAt: 2 @ 2 ]
		raise: self functionalException
		withExceptionDo: [ :anError |
			self
				assert: TerniLapilli notXTurnErrorMessage
				equals: anError messageText.
			self
				assertXIsMarkedOn:
					{1 @ 1}
				andOOn:
					{} ].	
				
! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'JG 11/6/2018 08:09:21'!
test05CanNotMarkWithOWhenLastMarkWasO
	game _ TerniLapilli new.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 2.
	self
		should: [ game putOAt: 3 @ 3 ]
		raise: self functionalException
		withExceptionDo: [ :anError |
			self
				assert: TerniLapilli notOTurnErrorMessage
				equals: anError messageText.
			self
				assertXIsMarkedOn:
					{1 @ 1}
				andOOn:
					{2 @ 2} ].
				
! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'JG 11/6/2018 08:11:07'!
test06CanNotMarkWithXAnAlreadyMarkedPositionWithX
	game _ TerniLapilli new.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 2.
	self
		should: [ game putXAt: 1 @ 1. ]
		raise: self functionalException
		withExceptionDo: [ :anError |
			self
				assert: TerniLapilli positionTakenErrorMessage
				equals: anError messageText.
			self
				assertXIsMarkedOn:
					{1 @ 1}
				andOOn:
					{2 @ 2} ].
				
				
! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'JG 11/6/2018 08:13:58'!
test07CanNotMarkWithXAnAlreadyMarkedPositionWithO
	game _ TerniLapilli new.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 2.
	self
		should: [ game putXAt: 2 @ 2 ]
		raise: self functionalException
		withExceptionDo: [ :anError |
			self
				assert: TerniLapilli positionTakenErrorMessage
				equals: anError messageText.
			self
				assertXIsMarkedOn:
					{1 @ 1}
				andOOn:
					{2 @ 2} ].
! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'JG 11/6/2018 08:16:06'!
test08CanNotMarkWithOAnAlreadyMarkedPositionWithX
	game _ TerniLapilli new.
	game putXAt: 1 @ 1.
	self
		should: [ game putOAt: 1 @ 1 ]
		raise: self functionalException
		withExceptionDo: [ :anError |
			self
				assert: TerniLapilli positionTakenErrorMessage
				equals: anError messageText.
			self
				assertXIsMarkedOn:
					{1 @ 1}
				andOOn:
					{} ].	
! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'JG 11/6/2018 08:18:11'!
test09CanNotMarkWithOAnAlreadyMarkedPositionWithO
	game _ TerniLapilli new.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 2.
	game putXAt: 3 @ 3.
	self
		should: [ game putOAt: 2 @ 2 ]
		raise: self functionalException
		withExceptionDo: [ :anError |
			self
				assert: TerniLapilli positionTakenErrorMessage
				equals: anError messageText.
			self
				assertXIsMarkedOn:
					{1 @ 1. 3 @ 3}
				andOOn:
					{2 @ 2} ].
				
! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'JG 11/8/2018 13:11:55'!
test10AssertThereIsNotWinner
	game _ TerniLapilli new.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 1.
	game putXAt: 1 @ 2.
	game putOAt: 3 @ 1.
	game putXAt: 2 @ 2.
	game putOAt: 3 @ 2.
	
	self assertGameIsNotOver ! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'JG 11/6/2018 08:22:01'!
test11XWinsWhenCompletesRowNumber1
	game _ TerniLapilli new.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 1.
	game putXAt: 1 @ 2.
	game putOAt: 3 @ 1.
	game putXAt: 1 @ 3.
	self assertXWon.
	
	! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'JG 11/6/2018 08:30:21'!
test12XWinsWhenCompletesRowNumber2
	game _ TerniLapilli new.
	game putXAt: 2 @ 1.
	game putOAt: 1 @ 1.
	game putXAt: 2 @ 2.
	game putOAt: 3 @ 1.
	game putXAt: 2 @ 3.
	self assertXWon.

! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'JG 11/6/2018 08:31:38'!
test13XWinsWhenCompletesRowNumber3
	
	game _ TerniLapilli new.

	game putXAt: 3 @ 1.
	game putOAt: 1 @ 1.
	game putXAt: 3 @ 2.
	game putOAt: 2 @ 1.
	game putXAt: 3 @ 3.
	self assertXWon.! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'JG 11/6/2018 08:35:10'!
test14XWinsWhenCompletesAColumn
	
	game _ TerniLapilli new.

	game putXAt: 1 @ 1.
	game putOAt: 2 @ 2.
	game putXAt: 2 @ 1.
	game putOAt: 3 @ 3.
	game putXAt: 3 @ 1.
	self assertXWon.! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'JG 11/6/2018 08:36:18'!
test15XWinsWhenCompletesDiagonalGoingDown
	game _ TerniLapilli new.
	game putXAt: 1 @ 1.
	game putOAt: 1 @ 2.
	game putXAt: 2 @ 2.
	game putOAt: 1 @ 3.
	game putXAt: 3 @ 3.
	self assertXWon.! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'JG 11/6/2018 08:37:09'!
test16XWinsWhenCompletesDiagonalGoingUp
	game _ TerniLapilli new.

	game putXAt: 1 @ 3.
	game putOAt: 1 @ 2.
	game putXAt: 2 @ 2.
	game putOAt: 2 @ 1.
	game putXAt: 3 @ 1.
	self assertXWon.! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'JG 11/6/2018 08:38:20'!
test17OWinsWhenCompletesARow
	
	game _ TerniLapilli new.
	game putXAt: 2 @ 1.
	game putOAt: 1 @ 1.
	game putXAt: 2 @ 2.
	game putOAt: 1 @ 2.
	game putXAt: 3 @ 1.
	game putOAt: 1 @ 3.
	self assertOWon.! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'JG 11/6/2018 09:24:09'!
test18OCanNotMarkWhenXWon
	game _ TerniLapilli new.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 1.
	game putXAt: 1 @ 2.
	game putOAt: 3 @ 1.
	game putXAt: 1 @ 3.
	self
		should: [ game putOAt: 3 @ 1 ]
		raise: self functionalException
		withExceptionDo: [ :anError |
			self
				assert: TerniLapilli canNotPlayWhenGameIsOverErrorMessage
				equals: anError messageText.
			self assertOIsMarkedOn:
				{2 @ 1. 3 @ 1} ].
			
! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'JG 11/6/2018 19:29:18'!
test19XCanNotMarkWhenXWon
	game _ TerniLapilli new.
	game putXAt: 2 @ 1.
	game putOAt: 1 @ 1.
	game putXAt: 2 @ 2.
	game putOAt: 3 @ 1.
	game putXAt: 2 @ 3.

	self 
		should: [ game  putXAt: 2 @ 3 ] 
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TerniLapilli canNotPlayWhenGameIsOverErrorMessage equals: anError messageText.
			self assertXIsMarkedOn:
				{2 @ 1. 2 @ 2. 2@3}
			 ]
		! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'JG 11/6/2018 19:29:30'!
test20XCanNotPlaceMoreThanThreePieces
	game _ TerniLapilli new.
	game putXAt: 2 @ 2.
	game putOAt: 1 @ 1.
	game putXAt: 2 @ 1.
	game putOAt: 1 @ 2.
	game putXAt: 3 @ 1.
	game putOAt: 2 @ 3.
	self
		should: [ game putXAt: 3 @ 2 ]
		raise: self functionalException
		withExceptionDo: [ :anError |
			self
				assert: TerniLapilli playerXHasPlacedThreePieces
				equals: anError messageText.
			self assertXIsMarkedOn:
				{2 @ 2. 2 @ 1. 3 @ 1} ].
			
			! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HAW 11/8/2018 11:48:20'!
test21XCanSlideWhenAllXPiecesWerePlaced
	game _ TerniLapilli new.
	game putXAt: 2 @ 2.
	game putOAt: 1 @ 1.
	game putXAt: 1 @ 3.
	game putOAt: 3 @ 1.
	game putXAt: 2 @ 1.
	game putOAt: 2 @ 3.
	game slideXFrom: 2 @ 2 to: 1 @ 2.
	
	self assertXIsMarkedOn: {1 @ 2. 1 @ 3. 2 @ 1}.
	self assertIsPlayingO.	
	! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HAW 11/8/2018 11:48:39'!
test22OCanSlideWhenAllOPiecesWerePlaced
	
	game _ TerniLapilli new.
	game putXAt: 2@2.
	game putOAt: 1@1.	
	game putXAt: 2@1.
	game putOAt: 3@1.
	game putXAt: 1@3.	
	game putOAt: 2@3.
	
	game slideXFrom: 2@2 to: 1@2.
	game slideOFrom: 1@1 to: 2@2.


	self assertXIsMarkedOn: {1 @ 2. 2 @ 1. 1 @ 3}.
	self assertOIsMarkedOn: {2 @ 2. 3 @ 1. 2 @ 3}.
	self assertIsPlayingX.! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HAW 11/8/2018 11:48:39'!
test23CanNotSlideWithXToAnAlreadyMarkedPositionWithX

	game _ TerniLapilli new.
	
	game putXAt: 2@2.
	game putOAt: 1@1.	
	game putXAt: 2@1.
	game putOAt: 3@1.
	game putXAt: 1@3.	
	game putOAt: 2@3.
	
	game slideXFrom: 2@2 to: 1@2.
	game slideOFrom: 1@1 to: 2@2.
				
	self 
		should: [ game slideXFrom: 1@2 to: 1@3 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TerniLapilli positionTakenErrorMessage equals: anError messageText.
			self assertXIsMarkedOn:
					{1@2. 2@1. 1@3}
				andOOn:
					{2@2. 3@1. 2@3} ].! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HAW 11/8/2018 11:48:39'!
test24CanNotSlideWithXToAnAlreadyMarkedPositionWithO

	game _ TerniLapilli new.	
	game putXAt: 2@2.
	game putOAt: 1@1.	
	game putXAt: 2@1.
	game putOAt: 3@1.
	game putXAt: 1@3.	
	game putOAt: 2@3.
	
	game slideXFrom: 2@2 to: 1@2.
	game slideOFrom: 1@1 to: 2@2.
				
	self 
		should: [ game slideXFrom: 2@1 to: 3@1 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TerniLapilli positionTakenErrorMessage equals: anError messageText.
			self assertXIsMarkedOn:
					{1@2. 2@1. 1@3}
				andOOn:
					{2@2. 3@1. 2@3} ].! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HAW 11/8/2018 11:48:39'!
test25CanNotSlideWithOToAnAlreadyMarkedPositionWithO
	game _ TerniLapilli new.
	
	game putXAt: 2@2.
	game putOAt: 1@1.	
	game putXAt: 2@1.
	game putOAt: 3@1.
	game putXAt: 1@3.	
	game putOAt: 2@3.
	
	game slideXFrom: 2@2 to: 1@2.
	game slideOFrom: 3@1 to: 2@2.
	game slideXFrom: 2@1 to: 3@1.
					
	self 
		should: [ game slideOFrom: 1@1 to: 2@2 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TerniLapilli positionTakenErrorMessage equals: anError messageText.
			self assertXIsMarkedOn:
					{1@2. 3@1. 1@3}
				andOOn:
					{1@1. 2@2. 2@3} ].! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HAW 11/8/2018 11:48:38'!
test26CanNotSlideWithOToAnAlreadyMarkedPositionWithX
	
	game _ TerniLapilli new.
	
	game putXAt: 2@2.
	game putOAt: 1@1.	
	game putXAt: 2@1.
	game putOAt: 3@1.
	game putXAt: 1@3.	
	game putOAt: 2@3.
	
	game slideXFrom: 2@2 to: 1@2.
					
	self 
		should: [ game slideOFrom: 1@1 to: 2@1 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TerniLapilli positionTakenErrorMessage equals: anError messageText.
			self assertXIsMarkedOn:
					{1@2. 2@1. 1@3}
				andOOn:
					{1@1. 3@1. 2@3} ].
! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HAW 11/8/2018 11:48:39'!
test27XWinsSliding

	game _ TerniLapilli new.
	
	game putXAt: 2@2.
	game putOAt: 1@1.	
	game putXAt: 2@1.
	game putOAt: 3@1.
	game putXAt: 1@3.	
	game putOAt: 2@3.
	
	game slideXFrom: 2@2 to: 1@2.
	game slideOFrom: 3@1 to: 2@2.
	game slideXFrom: 2@1 to: 3@1.
	game slideOFrom: 2@2 to: 3@3.
	game slideXFrom: 1@2 to: 2@2.
					
	self assertXWon.! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HAW 11/8/2018 11:48:38'!
test28OWinsSliding

	game _ TerniLapilli new.
	
	game putXAt: 2@2.
	game putOAt: 1@1.	
	game putXAt: 2@1.
	game putOAt: 3@1.
	game putXAt: 1@3.	
	game putOAt: 2@3.
	
	game slideXFrom: 2@2 to: 1@2.
	game slideOFrom: 3@1 to: 2@2.
	game slideXFrom: 2@1 to: 3@1.
	game slideOFrom: 1@1 to: 2@1.
					
	self assertOWon.
! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HAW 11/8/2018 11:48:38'!
test29XCanNotSlideWhenOWon
	game _ TerniLapilli new.
	
	game putXAt: 2@2.
	game putOAt: 1@1.	
	game putXAt: 2@1.
	game putOAt: 3@1.
	game putXAt: 1@3.	
	game putOAt: 2@3.
	
	game slideXFrom: 2@2 to: 1@2.
	game slideOFrom: 3@1 to: 2@2.
	game slideXFrom: 2@1 to: 3@1.
	game slideOFrom: 1@1 to: 2@1.
					
	self 
		should: [ game slideXFrom: 3@1 to: 3@2. ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TerniLapilli canNotPlayWhenGameIsOverErrorMessage equals: anError messageText.
			self assertXIsMarkedOn:
					{1@2.     3@1. 1@3}
				andOOn:
					{2@1. 2@2. 2@3}  ]
			

! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HAW 11/8/2018 11:48:39'!
test30OCanNotSlideWhenXWon
	game _ TerniLapilli new.	
	
	game putXAt: 2 @ 2.
	game putOAt: 1 @ 1.
	game putXAt: 2 @ 1.
	game putOAt: 3 @ 1.
	game putXAt: 1 @ 3.
	game putOAt: 2 @ 3.
	
	game slideXFrom: 2 @ 2 to: 1 @ 2.
	game slideOFrom: 3 @ 1 to: 2 @ 2.
	game slideXFrom: 2 @ 1 to: 3 @ 1.
	game slideOFrom: 2 @ 2 to: 3 @ 3.
	game slideXFrom: 1 @ 2 to: 2 @ 2.
	
	self should: [game slideOFrom: 1 @ 1 to: 2 @ 1 ]
		raise: self functionalException
		withExceptionDo: [ :anError | self assert: TerniLapilli canNotPlayWhenGameIsOverErrorMessage
				equals: anError messageText.
		self assertXIsMarkedOn:
					{2@2.     3@1. 1@3}
				andOOn:
					{1@1. 3@3. 2@3} ].! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HAW 11/8/2018 11:48:20'!
test30_01CanNotSlideXToAnInvalidPosition

	game _ TerniLapilli new.	
	
	game putXAt: 2 @ 2.
	game putOAt: 1 @ 1.
	game putXAt: 2 @ 1.
	game putOAt: 3 @ 1.
	game putXAt: 1 @ 3.
	game putOAt: 2 @ 3.
	
	self 
		should: [game slideXFrom: 1 @ 3 to: 0 @ 3]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: TerniLapilli illegalMovement.
			self assertXIsMarkedOn: { 2@2. 2@1. 1@3 } ]
	! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HAW 11/8/2018 11:48:39'!
test30_02CanNotSlideOToAnInvalidPosition

	game _ TerniLapilli new.	
	
	game putXAt: 2 @ 2.
	game putOAt: 1 @ 1.
	game putXAt: 2 @ 1.
	game putOAt: 3 @ 1.
	game putXAt: 1 @ 3.
	game putOAt: 2 @ 3.
	
	game slideXFrom: 1 @ 3 to: 1@ 2.
	self 
		should: [ game slideOFrom: 1@1 to: 0@1 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: TerniLapilli illegalMovement.
			self assertOIsMarkedOn: { 1@1. 3@1. 2@3 } ]
	! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HAW 11/8/2018 11:48:20'!
test31DifferenceBetweenPositionsShouldNotBeGreaterThanOneWhenSliding
	game _ TerniLapilli new.	
	game putXAt: 2@2.
	game putOAt: 1@1.	
	game putXAt: 2@1.
	game putOAt: 1@2.
	game putXAt: 3@1.	
	game putOAt: 2@3.

	self 
		should: [ game slideXFrom: 3@1 to: 3@3 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TerniLapilli illegalMovement equals: anError messageText.
			self assertXIsMarkedOn:
					{2@2. 2@1. 3@1}
				andOOn:
					{1@1. 1@2. 2@3}  ]
			
			

! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HAW 11/8/2018 11:48:39'!
test32OnlyPermittedXSlidingsBetweenAdjacentsPositions

	game _ TerniLapilli new.	
	game putXAt: 2@2.
	game putOAt: 1@1.	
	game putXAt: 2@1.
	game putOAt: 3@1.
	game putXAt: 1@3.	
	game putOAt: 2@3.
	
	game slideXFrom: 2@2 to: 1@2.
	game slideOFrom: 3@1 to: 2@2.
	game slideXFrom: 2@1 to: 3@1.
	game slideOFrom: 2@2 to: 3@3.	
					
		self 
		should: [ game slideXFrom: 1@2 to: 3@2 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TerniLapilli illegalMovement equals: anError messageText.
			self assertXIsMarkedOn:
					{1@2. 3@1. 1@3}
				andOOn:
					{1@1. 3@3. 2@3}   ]
			
! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HAW 11/8/2018 11:48:39'!
test33OnlyPermittedOSlidingsBetweenAdjacentsPositions
game _ TerniLapilli new.	

	game putXAt: 2@2.
	game putOAt: 1@1.	
	game putXAt: 2@1.
	game putOAt: 1@2.
	game putXAt: 3@1.	
	game putOAt: 2@3.
	
	game slideXFrom: 3@1 to: 3@2.

	self 
		should: [ game slideOFrom: 2@3 to: 3@1 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TerniLapilli illegalMovement equals: anError messageText.
			self assertXIsMarkedOn:
					{2@2. 2@1. 3@2}
				andOOn:
					{1@1. 1@2. 2@3}  ]
			
			

! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'JG 11/6/2018 20:34:51'!
test34CanNotMarkOutsideBoard
	game _ TerniLapilli new.
	#(0 4 ) do: [ :aPositionComponent |
		self assertCanNotMarkAt: aPositionComponent @ 1.
		self assertCanNotMarkAt: 1 @ aPositionComponent ].
	
	! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HAW 11/8/2018 11:48:20'!
test35CanNotSlideWithXFromAPositionMarkedWithO

	game _ TerniLapilli new.	
	game putXAt: 2@2.
	game putOAt: 1@1.	
	game putXAt: 2@1.
	game putOAt: 3@1.
	game putXAt: 1@3.	
	game putOAt: 2@3.
			
	self 
		should: [ game slideXFrom: 3@1 to: 3@2 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TerniLapilli playersCanOnlySlideTheirOwnPieces equals: anError messageText.
			self assertXIsMarkedOn:
					{2@2. 2@1. 1@3}
				andOOn:
					{1@1. 3@1. 2@3} ].! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HAW 11/8/2018 11:48:39'!
test36CanNotSlideWithOFromAPositionMarkedWithX

	game _ TerniLapilli new.	
	game putXAt: 2@2.
	game putOAt: 1@1.	
	game putXAt: 2@1.
	game putOAt: 3@1.
	game putXAt: 1@3.	
	game putOAt: 2@3.

	game slideXFrom: 2@2 to: 1@2.
			
	self 
		should: [ game slideOFrom: 2@1 to: 2@2 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TerniLapilli playersCanOnlySlideTheirOwnPieces equals: anError messageText.
			self assertXIsMarkedOn:
					{1@2. 2@1. 1@3}
				andOOn:
					{1@1. 3@1. 2@3} ].! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HAW 11/8/2018 11:49:16'!
test37CanNotSlideXWhenPutingX

	game _ TerniLapilli new.	
	game putXAt: 2@2.
	game putOAt: 1@1.	

	self 
		should: [ game slideXFrom: 2@2 to: 1@2 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: TerniLapilli  playerXHasPiecesToPlace.
			self assertXIsMarkedOn: { 2@2 } ]
	! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HAW 11/8/2018 11:49:30'!
test38CanNotSlideOWhenPuttingO

	game _ TerniLapilli new.	
	game putXAt: 2@2.
	game putOAt: 1@1.
	game putXAt: 1@3.

	self 
		should: [ game slideOFrom: 1@1 to: 1@2 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: TerniLapilli  playerOHasPiecesToPlace.
			self assertOIsMarkedOn: { 1@1 } ]
	! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HAW 11/8/2018 11:49:49'!
test39CanNotSlideXWhenPlayingO

	game _ TerniLapilli new.	
	game putXAt: 2@2.

	self 
		should: [ game slideXFrom: 2@2 to: 1@2 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: TerniLapilli  notXTurnErrorMessage.
			self assertXIsMarkedOn: { 2@2 } ]
	! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'HAW 11/8/2018 11:50:01'!
test40CanNotSlideOWhenPlayingX

	game _ TerniLapilli new.	
	game putXAt: 2@2.
	game putOAt: 1@1.

	self 
		should: [ game slideOFrom: 1@1 to: 1@2 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: TerniLapilli  notOTurnErrorMessage.
			self assertOIsMarkedOn: { 1@1 } ]
	! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'AC 11/10/2018 20:33:45'!
test41LastPlayRaisesErrorIfNoPlaysWereMade

	game _ TerniLapilli new.	

	self 
		should: [ game lastPlay ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: TerniLapilli  noPlaysWereMade.
			self assertXIsMarkedOn: {} andOOn: {}.
			self assertIsPlayingX.]
	! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'AC 11/10/2018 20:41:34'!
test42AfterMarkingWithXLastPlayIsMarkedPositionWithX

	game _ TerniLapilli new.
	game putXAt: 1 @ 1.

	self assertLastPlayIsAMarkingOn: 1@1.
	self assertLastPlayWasMadeByX.
	
	
! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'AC 11/10/2018 20:49:16'!
test43AfterMarkingWithOLastPlayIsMarkedPositionWithO

	game _ TerniLapilli new.
	game putXAt: 1 @ 1.
	game putOAt: 2 @ 2.

	self assertLastPlayIsAMarkingOn: 2@2.
	self assertLastPlayWasMadeByO.
	
	
! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'AC 11/10/2018 23:34:11'!
test44AfterSlidingWithXLastPlayIsSlidingWithXBetweenCorrectPositions

	game _ TerniLapilli new.
	game 
		putXAt: 1 @ 1;
		putOAt: 3 @ 1;
		putXAt: 1 @ 2;
		putOAt: 1 @3;
		putXAt: 2 @ 1;
		putOAt: 3 @ 2;
		slideXFrom: 1@2 to: 2@2. 

	self assertLastPlayIsASlidingFrom: (1@2) to: (2@2).
	self assertLastPlayWasMadeByX.
	
	
! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'AC 11/10/2018 23:50:35'!
test45AfterSlidingWithOLastPlayIsSlidingWithOBetweenCorrectPositions

	game _ TerniLapilli new.
	game 
		putXAt: 1 @ 1;
		putOAt: 3 @ 1;
		putXAt: 1 @ 2;
		putOAt: 1 @3;
		putXAt: 2 @ 1;
		putOAt: 3 @ 2;
		slideXFrom: 1@2 to: 2@2;
		slideOFrom: 3@2 to: 3@3. 

	self assertLastPlayIsASlidingFrom: (3@2) to: (3@3).
	self assertLastPlayWasMadeByO.
	
	
! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'AC 11/11/2018 00:40:22'!
test46MarkingPlayRaisesErrorWhenAskedForPositionsFromSliding

	| lastPlay |
	game _ TerniLapilli new.
	game 
		putXAt: 1 @ 1.
		
	lastPlay _ game lastPlay.
	
	self assertLastPlayIsAMarkingOn: (1@1).
	self 
		should: [lastPlay fromPosition]
		raise: self functionalException
		withMessageText: TerniLapilliPlay notASlidingPlayErrorMessage.
		
	self 
		should: [lastPlay toPosition]
		raise: self functionalException
		withMessageText: TerniLapilliPlay notASlidingPlayErrorMessage! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'AC 11/11/2018 00:45:46'!
test47SlidingPlayRaisesErrorWhenAskedForMarkedPosition

	| lastPlay |
	game _ TerniLapilli new.
	game 
		putXAt: 1 @ 1;
		putOAt: 3 @ 1;
		putXAt: 1 @ 2;
		putOAt: 1 @3;
		putXAt: 2 @ 1;
		putOAt: 3 @ 2;
		slideXFrom: 1@2 to: 2@2;
		slideOFrom: 3@2 to: 3@3. 
		
	lastPlay _ game lastPlay.
	
	self assertLastPlayIsASlidingFrom: (3@2) to: (3@3).
	self 
		should: [lastPlay markedPosition ]
		raise: self functionalException
		withMessageText: TerniLapilliPlay notAMarkingPlayErrorMessage
! !


!classDefinition: #TerniLapilli category: #TerniLapilliConsole!
Object subclass: #TerniLapilli
	instanceVariableNames: 'state playerOPositions playerXPositions console lastPlay'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliConsole'!

!TerniLapilli methodsFor: 'assertions' stamp: 'JG 10/28/2018 15:11:39'!
assertAllPiecesOPlaced

	(self playerOPositions size = 3 ) ifFalse: [ self error: self class playerOHasPiecesToPlace ].
! !

!TerniLapilli methodsFor: 'assertions' stamp: 'JG 10/28/2018 15:11:20'!
assertAllPiecesXPlaced

	(self playerXPositions size = 3 ) ifFalse: [ self error: self class playerXHasPiecesToPlace ].
! !

!TerniLapilli methodsFor: 'assertions' stamp: 'HAW 10/25/2017 15:35:08'!
assertIsFree: aPosition

	(self isTaken: aPosition) ifTrue: [ self error: self class positionTakenErrorMessage ].
! !

!TerniLapilli methodsFor: 'assertions' stamp: 'HAW 11/8/2018 10:47:35'!
assertIsInBoardBounds: aPosition

	(self isInBoardBounds: aPosition) ifFalse: [ self error: self class positionOutsideBoardErrorMessage ]! !

!TerniLapilli methodsFor: 'assertions' stamp: 'HAW 11/8/2018 09:55:12'!
assertIsLegalMovementFrom: aPosition to: anotherPosition

	(self moveLegalFrom: aPosition to: anotherPosition) ifFalse: [ self error: self class illegalMovement ].
! !

!TerniLapilli methodsFor: 'assertions' stamp: 'JG 11/6/2018 22:31:24'!
assertThereIsAnOPieceIn: aPosition

	(self playerOPositions includes: aPosition) ifFalse: [ self error: self class playersCanOnlySlideTheirOwnPieces ]! !

!TerniLapilli methodsFor: 'assertions' stamp: 'JG 11/6/2018 22:30:17'!
assertThereIsAnXPieceIn: aPosition

	(self playerXPositions includes: aPosition) ifFalse: [ self error: self class playersCanOnlySlideTheirOwnPieces ]! !


!TerniLapilli methodsFor: 'game over testing - private' stamp: 'HAW 10/25/2017 16:10:30'!
has: positions threeOf: aPositionComponent

	^positions size >= 3 and: [ (positions collect: aPositionComponent) asBag contents values includes: 3 ]
	! !

!TerniLapilli methodsFor: 'game over testing - private' stamp: 'HAW 11/8/2018 10:58:20'!
hasCompletedColumn: positions

	^ self has: positions threeOf: [ :aPosition | aPosition y ].! !

!TerniLapilli methodsFor: 'game over testing - private' stamp: 'HAW 11/8/2018 10:58:36'!
hasCompletedRow: positions
	
	^ self has: positions threeOf: [ :aPosition | aPosition x ].! !

!TerniLapilli methodsFor: 'game over testing - private' stamp: 'HAW 5/31/2018 00:15:47'!
hasDownDiagonal: positions

	^ (1 to: 3) allSatisfy: [ :n | positions includes: n @ (4-n) ].! !

!TerniLapilli methodsFor: 'game over testing - private' stamp: 'HAW 5/31/2018 00:15:59'!
hasUpDiagonal: positions

	^ (1 to: 3) allSatisfy: [ :n | positions includes: n @ n ].! !

!TerniLapilli methodsFor: 'game over testing - private' stamp: 'HAW 5/31/2018 00:16:26'!
hasWin: positions

	^ (self hasCompletedRow: positions) 
		or: [ (self hasCompletedColumn: positions) 
		or: [ (self hasUpDiagonal: positions) 
		or: [ self hasDownDiagonal: positions ]]].! !


!TerniLapilli methodsFor: 'initialization' stamp: 'AC 11/10/2018 19:27:57'!
initialize

	playerXPositions := OrderedCollection new.
	playerOPositions := OrderedCollection new.
	state := ActiveVariable on:(PlacingX new initializeFor: self).! !


!TerniLapilli methodsFor: 'marking board' stamp: 'AC 11/10/2018 19:17:34'!
putOAt: aPosition

	self assertIsInBoardBounds: aPosition .
	state putOAt: aPosition.! !

!TerniLapilli methodsFor: 'marking board' stamp: 'AC 11/10/2018 19:17:30'!
putXAt: aPosition

	self assertIsInBoardBounds: aPosition .
	state putXAt: aPosition.! !


!TerniLapilli methodsFor: 'marking board - private' stamp: 'AC 11/10/2018 20:19:08'!
changeStateAfterAdding: aPosition to: positions  

	positions add: aPosition.
	state changeTo: (TerniLapilliState for: self).
	! !

!TerniLapilli methodsFor: 'marking board - private' stamp: 'AC 11/11/2018 01:11:16'!
putOWhenPlacingOAt: aPosition

	self playerOHasPiecesToPlace.
	self assertIsFree: aPosition.

	lastPlay _ MarkingPlayO at: aPosition.
	
	self changeStateAfterAdding: aPosition to: playerOPositions
		! !

!TerniLapilli methodsFor: 'marking board - private' stamp: 'JG 10/28/2018 12:39:41'!
putOWhenPlacingXAt: aPosition

	self error: self class notOTurnErrorMessage ! !

!TerniLapilli methodsFor: 'marking board - private' stamp: 'JG 10/28/2018 12:08:31'!
putOWhenSlidingOAt: aPoint 
	
	self error: self class eachPlayerOnlyHasThreePieces ! !

!TerniLapilli methodsFor: 'marking board - private' stamp: 'JG 10/28/2018 12:38:11'!
putOWhenSlidingXAt: aPosition

	self error: self class notOTurnErrorMessage ! !

!TerniLapilli methodsFor: 'marking board - private' stamp: 'JG 10/28/2018 12:39:23'!
putXWhenPlacingOAt: aPoint 
	
	self error: self class notXTurnErrorMessage! !

!TerniLapilli methodsFor: 'marking board - private' stamp: 'AC 11/11/2018 01:11:33'!
putXWhenPlacingXAt: aPosition

	self playerXHasPiecesToPlace.
	self assertIsFree: aPosition.
	
	lastPlay _ MarkingPlayX at: aPosition.
	
	self changeStateAfterAdding: aPosition to: playerXPositions
	! !

!TerniLapilli methodsFor: 'marking board - private' stamp: 'JG 10/28/2018 12:38:49'!
putXWhenSlidingOAt: aPoint 
	
	self error: self class notXTurnErrorMessage! !

!TerniLapilli methodsFor: 'marking board - private' stamp: 'JG 10/28/2018 11:59:44'!
putXWhenSlidingXAt: aPoint 
	
	self error: self class eachPlayerOnlyHasThreePieces ! !


!TerniLapilli methodsFor: 'pieces' stamp: 'HAW 11/8/2018 09:58:58'!
playerOHasPiecesToPlace

	 self playerOPositions size < 3 ifFalse: [ self error: self class playerXHasPlacedThreePieces ].
	! !

!TerniLapilli methodsFor: 'pieces' stamp: 'HAW 11/8/2018 09:59:05'!
playerXHasPiecesToPlace

	 self playerXPositions size < 3 ifFalse: [ self error: self class playerXHasPlacedThreePieces ].
	! !


!TerniLapilli methodsFor: 'positions' stamp: 'HAW 11/8/2018 10:49:00'!
moveLegalFrom: aPosition to: anotherPosition
	
	^ (self is: aPosition adjacentTo: anotherPosition) and: [ self isInBoardBounds: anotherPosition ]! !

!TerniLapilli methodsFor: 'positions' stamp: 'HAW 10/25/2017 15:56:16'!
playerOPositions
	^ playerOPositions copy.! !

!TerniLapilli methodsFor: 'positions' stamp: 'HAW 10/25/2017 15:56:32'!
playerXPositions
	^ playerXPositions copy.! !


!TerniLapilli methodsFor: 'sliding' stamp: 'AC 11/10/2018 19:17:18'!
slideOFrom: aPosition to: anotherPosition

	self assertThereIsAnOPieceIn: aPosition.
	state slideOFrom: aPosition to: anotherPosition.! !

!TerniLapilli methodsFor: 'sliding' stamp: 'AC 11/10/2018 19:17:22'!
slideXFrom: aPosition to: anotherPosition

	self assertThereIsAnXPieceIn: aPosition.
	state slideXFrom: aPosition to: anotherPosition.! !


!TerniLapilli methodsFor: 'sliding - private' stamp: 'HAW 11/8/2018 11:41:03'!
slideOWhenPlacingOFrom: aPosition to: anotherPosition

	self error: self class playerOHasPiecesToPlace ! !

!TerniLapilli methodsFor: 'sliding - private' stamp: 'HAW 11/8/2018 11:46:55'!
slideOWhenPlayingXFrom: aPosition to: anotherPosition

	self error: self class notOTurnErrorMessage ! !

!TerniLapilli methodsFor: 'sliding - private' stamp: 'AC 11/11/2018 01:13:07'!
slideOWhenSlidingOFrom: aPosition to: anotherPosition
	
	self assertIsFree: anotherPosition .
	self assertIsLegalMovementFrom: aPosition to: anotherPosition.
	
	lastPlay _ SlidingPlayO from: aPosition to: anotherPosition.
	
	playerOPositions remove: aPosition.
	self changeStateAfterAdding: anotherPosition to: playerOPositions
	 ! !

!TerniLapilli methodsFor: 'sliding - private' stamp: 'HAW 11/8/2018 11:16:01'!
slideXWhenPlacingXFrom: aPosition to: anotherPosition

	self error: self class playerXHasPiecesToPlace ! !

!TerniLapilli methodsFor: 'sliding - private' stamp: 'HAW 11/8/2018 11:44:53'!
slideXWhenPlayingOFrom: aPosition to: anotherPosition

	self error: self class notXTurnErrorMessage! !

!TerniLapilli methodsFor: 'sliding - private' stamp: 'AC 11/11/2018 01:10:23'!
slideXWhenSlidingXFrom: aPosition to: anotherPosition
	
	self assertIsFree: anotherPosition .
	self assertIsLegalMovementFrom: aPosition to: anotherPosition.
	
	lastPlay _ SlidingPlayX from: aPosition to: anotherPosition .
	
	playerXPositions remove: aPosition.
	self changeStateAfterAdding: anotherPosition to: playerXPositions! !


!TerniLapilli methodsFor: 'testing board positions' stamp: 'HAW 11/8/2018 12:19:28'!
does: aNumber distanceOneTo: anotherNumber

	^ (aNumber - anotherNumber) abs < 2 ! !

!TerniLapilli methodsFor: 'testing board positions' stamp: 'HAW 11/8/2018 11:30:51'!
hasXMorePiecesToPlace
	
	^playerXPositions size < 3! !

!TerniLapilli methodsFor: 'testing board positions' stamp: 'HAW 11/8/2018 12:19:28'!
is: aPosition adjacentTo: anotherPosition

	^ (self does: aPosition x distanceOneTo: anotherPosition x) and: [ self does: aPosition y distanceOneTo: anotherPosition y ]
	! !

!TerniLapilli methodsFor: 'testing board positions' stamp: 'HAW 11/8/2018 10:47:53'!
isInBoardBounds: aPosition

	^aPosition between: 1@1 and: 3@3! !

!TerniLapilli methodsFor: 'testing board positions' stamp: 'HAW 5/31/2018 00:16:45'!
isTaken: aPosition

	^ (playerXPositions includes: aPosition) or: [ playerOPositions includes: aPosition ].! !


!TerniLapilli methodsFor: 'testing game result' stamp: 'AC 11/10/2018 19:55:00'!
hasPlayerOWon

	"^self hasWin: playerOPositions "
	^state hasPlayerOWon ! !

!TerniLapilli methodsFor: 'testing game result' stamp: 'AC 11/10/2018 19:54:48'!
hasPlayerXWon
	
	"^self hasWin: playerXPositions "
	^state hasPlayerXWon ! !

!TerniLapilli methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 13:32:14'!
isOver
	
	^state isOver! !


!TerniLapilli methodsFor: 'testing playing turn' stamp: 'HAW 11/8/2018 12:19:47'!
isPlacingX
	
	^state isPlacingX ! !

!TerniLapilli methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:17:38'!
isPlayingO
	
	^state isPlayingO! !

!TerniLapilli methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:17:14'!
isPlayingX
	
	^state isPlayingX ! !

!TerniLapilli methodsFor: 'testing playing turn' stamp: 'HAW 11/8/2018 11:29:16'!
isSlidingX
	
	^state isSlidingX! !


!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'AC 11/10/2018 19:24:25'!
addStateObserver: aTerniLapilliStateObserver

	state addObserver: aTerniLapilliStateObserver.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'AC 11/10/2018 20:44:28'!
lastPlay
	
	lastPlay ifNil: [self error: self class noPlaysWereMade].
	^lastPlay! !


!TerniLapilli methodsFor: 'testing game result - private' stamp: 'AC 11/10/2018 19:54:21'!
playerOWon

	^self hasWin: playerOPositions ! !

!TerniLapilli methodsFor: 'testing game result - private' stamp: 'AC 11/10/2018 19:54:29'!
playerXWon

	^self hasWin: playerXPositions ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilli class' category: #TerniLapilliConsole!
TerniLapilli class
	instanceVariableNames: ''!

!TerniLapilli class methodsFor: 'error messages' stamp: 'HAW 10/24/2017 17:12:48'!
canNotPlayWhenGameIsOverErrorMessage
	
	^'Can not play when game is over'! !

!TerniLapilli class methodsFor: 'error messages' stamp: 'JG 10/28/2018 11:12:02'!
eachPlayerOnlyHasThreePieces

	^ 'Each player only has three pieces'.! !

!TerniLapilli class methodsFor: 'error messages' stamp: 'HAW 11/8/2018 09:55:12'!
illegalMovement
	
	^'Movement is not legal'! !

!TerniLapilli class methodsFor: 'error messages' stamp: 'AC 11/10/2018 20:33:08'!
noPlaysWereMade
	
	^'There isnt any play made yet'! !

!TerniLapilli class methodsFor: 'error messages' stamp: 'HAW 10/24/2017 17:12:48'!
notOTurnErrorMessage
	
	^'Not O''s turn'! !

!TerniLapilli class methodsFor: 'error messages' stamp: 'HAW 10/24/2017 17:12:48'!
notXTurnErrorMessage
	
	^'Not X''s turn'! !

!TerniLapilli class methodsFor: 'error messages' stamp: 'JG 11/6/2018 22:50:08'!
playerOHasPiecesToPlace

	^ 'Must place all pieces to slide'.! !

!TerniLapilli class methodsFor: 'error messages' stamp: 'JG 10/28/2018 15:02:06'!
playerOHasPlacedThreePieces

	^ 'Each player only has three pieces'.! !

!TerniLapilli class methodsFor: 'error messages' stamp: 'JG 11/6/2018 22:50:16'!
playerXHasPiecesToPlace

	^ 'Must place all pieces to slide'.! !

!TerniLapilli class methodsFor: 'error messages' stamp: 'JG 10/28/2018 15:01:23'!
playerXHasPlacedThreePieces

	^ 'Each player only has three pieces'.! !

!TerniLapilli class methodsFor: 'error messages' stamp: 'JG 11/6/2018 22:21:33'!
playersCanOnlySlideTheirOwnPieces

	^ 'Players can only slide their own pieces'.! !

!TerniLapilli class methodsFor: 'error messages' stamp: 'JG 11/6/2018 20:07:12'!
positionOutsideBoardErrorMessage
	^ 'Position is outside board'.! !

!TerniLapilli class methodsFor: 'error messages' stamp: 'HAW 10/24/2017 17:12:48'!
positionTakenErrorMessage
	
	^'Position taken'! !


!classDefinition: #TerniLapilliPlay category: #TerniLapilliConsole!
Object subclass: #TerniLapilliPlay
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliConsole'!

!TerniLapilliPlay methodsFor: 'testing' stamp: 'AC 11/11/2018 00:55:26'!
fromPosition
	
	^self subclassResponsibility.! !

!TerniLapilliPlay methodsFor: 'testing' stamp: 'AC 11/11/2018 00:56:08'!
isAMarking

	^self subclassResponsibility.! !

!TerniLapilliPlay methodsFor: 'testing' stamp: 'AC 11/11/2018 00:56:13'!
isASliding
	
	^self subclassResponsibility.! !

!TerniLapilliPlay methodsFor: 'testing' stamp: 'AC 11/11/2018 00:56:17'!
markedPosition

	^self subclassResponsibility.! !

!TerniLapilliPlay methodsFor: 'testing' stamp: 'AC 11/11/2018 00:56:21'!
toPosition
	
	^self subclassResponsibility.! !

!TerniLapilliPlay methodsFor: 'testing' stamp: 'AC 11/11/2018 00:56:27'!
wasMadeByO
	
	^self subclassResponsibility.! !

!TerniLapilliPlay methodsFor: 'testing' stamp: 'AC 11/11/2018 00:56:31'!
wasMadeByX
	
	^self subclassResponsibility.! !


!TerniLapilliPlay methodsFor: 'visiting' stamp: 'AC 11/11/2018 01:23:59'!
accept: aTerniLapilliPlayVisitor

	aTerniLapilliPlayVisitor perform: ('visit', self class name, ':') asSymbol with: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilliPlay class' category: #TerniLapilliConsole!
TerniLapilliPlay class
	instanceVariableNames: ''!

!TerniLapilliPlay class methodsFor: 'error messages' stamp: 'AC 11/11/2018 00:45:20'!
notAMarkingPlayErrorMessage
	
	^'This is not a Marking play'.! !

!TerniLapilliPlay class methodsFor: 'error messages' stamp: 'AC 11/11/2018 01:17:24'!
notASlidingPlayErrorMessage
	
	^'This is not a Sliding play'! !


!classDefinition: #MarkingPlayO category: #TerniLapilliConsole!
TerniLapilliPlay subclass: #MarkingPlayO
	instanceVariableNames: 'position'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliConsole'!

!MarkingPlayO methodsFor: 'testing' stamp: 'AC 11/11/2018 00:58:49'!
fromPosition
	
	^self error: self class notASlidingPlayErrorMessage! !

!MarkingPlayO methodsFor: 'testing' stamp: 'AC 11/11/2018 00:57:54'!
isAMarking

	^position isNil not and: [position2 isNil]! !

!MarkingPlayO methodsFor: 'testing' stamp: 'AC 11/11/2018 00:57:54'!
isASliding
	
	^position isNil not and:[position2 isNil not].! !

!MarkingPlayO methodsFor: 'testing' stamp: 'AC 11/11/2018 00:59:07'!
markedPosition

	^position.! !

!MarkingPlayO methodsFor: 'testing' stamp: 'AC 11/11/2018 00:58:58'!
toPosition
	
	^self error: self class notASlidingPlayErrorMessage! !

!MarkingPlayO methodsFor: 'testing' stamp: 'AC 11/11/2018 00:58:21'!
wasMadeByO
	
	^true! !

!MarkingPlayO methodsFor: 'testing' stamp: 'AC 11/11/2018 00:58:15'!
wasMadeByX
	
	^false! !


!MarkingPlayO methodsFor: 'initialization' stamp: 'AC 11/11/2018 01:07:25'!
placeAt: aPosition

	position  := aPosition.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarkingPlayO class' category: #TerniLapilliConsole!
MarkingPlayO class
	instanceVariableNames: ''!

!MarkingPlayO class methodsFor: 'initialization' stamp: 'AC 11/11/2018 01:07:25'!
at: aPosition

	^self new placeAt: aPosition.! !


!classDefinition: #MarkingPlayX category: #TerniLapilliConsole!
TerniLapilliPlay subclass: #MarkingPlayX
	instanceVariableNames: 'position'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliConsole'!

!MarkingPlayX methodsFor: 'testing' stamp: 'AC 11/11/2018 01:08:03'!
fromPosition
	
	^self error: self class notASlidingPlayErrorMessage! !

!MarkingPlayX methodsFor: 'testing' stamp: 'AC 11/11/2018 01:08:03'!
isAMarking

	^position isNil not and: [position2 isNil]! !

!MarkingPlayX methodsFor: 'testing' stamp: 'AC 11/11/2018 01:08:03'!
isASliding
	
	^position isNil not and:[position2 isNil not].! !

!MarkingPlayX methodsFor: 'testing' stamp: 'AC 11/11/2018 01:08:03'!
markedPosition

	^position.! !

!MarkingPlayX methodsFor: 'testing' stamp: 'AC 11/11/2018 01:08:03'!
toPosition
	
	^self error: self class notASlidingPlayErrorMessage! !

!MarkingPlayX methodsFor: 'testing' stamp: 'AC 11/11/2018 01:08:20'!
wasMadeByO
	
	^false! !

!MarkingPlayX methodsFor: 'testing' stamp: 'AC 11/11/2018 01:08:15'!
wasMadeByX
	
	^true! !


!MarkingPlayX methodsFor: 'initialization' stamp: 'AC 11/11/2018 01:08:03'!
placeAt: aPosition

	position  := aPosition.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarkingPlayX class' category: #TerniLapilliConsole!
MarkingPlayX class
	instanceVariableNames: ''!

!MarkingPlayX class methodsFor: 'initialization' stamp: 'AC 11/11/2018 01:08:03'!
at: aPosition

	^self new placeAt: aPosition.! !


!classDefinition: #SlidingPlayO category: #TerniLapilliConsole!
TerniLapilliPlay subclass: #SlidingPlayO
	instanceVariableNames: 'toPosition fromPosition'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliConsole'!

!SlidingPlayO methodsFor: 'testing' stamp: 'AC 11/11/2018 01:03:57'!
fromPosition
	
	^fromPosition.! !

!SlidingPlayO methodsFor: 'testing' stamp: 'AC 11/11/2018 01:04:07'!
isAMarking

	^false! !

!SlidingPlayO methodsFor: 'testing' stamp: 'AC 11/11/2018 01:04:14'!
isASliding
	
	^true! !

!SlidingPlayO methodsFor: 'testing' stamp: 'AC 11/11/2018 01:04:32'!
markedPosition

	^self error: self class notAMarkingPlayErrorMessage! !

!SlidingPlayO methodsFor: 'testing' stamp: 'AC 11/11/2018 01:03:32'!
toPosition
	
	^toPosition.! !

!SlidingPlayO methodsFor: 'testing' stamp: 'AC 11/11/2018 01:03:21'!
wasMadeByO
	
	^true! !

!SlidingPlayO methodsFor: 'testing' stamp: 'AC 11/11/2018 01:03:17'!
wasMadeByX
	
	^false! !


!SlidingPlayO methodsFor: 'initialization' stamp: 'AC 11/11/2018 01:05:39'!
slideFrom: aPosition to: anotherPosition 

	fromPosition := aPosition .
	toPosition := anotherPosition .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SlidingPlayO class' category: #TerniLapilliConsole!
SlidingPlayO class
	instanceVariableNames: ''!

!SlidingPlayO class methodsFor: 'initialization' stamp: 'AC 11/11/2018 01:06:31'!
from: fromPosition to: toPosition

	^self new slideFrom: fromPosition to: toPosition.! !


!classDefinition: #SlidingPlayX category: #TerniLapilliConsole!
TerniLapilliPlay subclass: #SlidingPlayX
	instanceVariableNames: 'toPosition fromPosition'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliConsole'!

!SlidingPlayX methodsFor: 'testing' stamp: 'AC 11/11/2018 01:06:39'!
fromPosition
	
	^fromPosition.! !

!SlidingPlayX methodsFor: 'testing' stamp: 'AC 11/11/2018 01:06:39'!
isAMarking

	^false! !

!SlidingPlayX methodsFor: 'testing' stamp: 'AC 11/11/2018 01:06:39'!
isASliding
	
	^true! !

!SlidingPlayX methodsFor: 'testing' stamp: 'AC 11/11/2018 01:06:39'!
markedPosition

	^self error: self class notAMarkingPlayErrorMessage! !

!SlidingPlayX methodsFor: 'testing' stamp: 'AC 11/11/2018 01:06:39'!
toPosition
	
	^toPosition.! !

!SlidingPlayX methodsFor: 'testing' stamp: 'AC 11/11/2018 01:06:58'!
wasMadeByO
	
	^false! !

!SlidingPlayX methodsFor: 'testing' stamp: 'AC 11/11/2018 01:06:54'!
wasMadeByX
	
	^true! !


!SlidingPlayX methodsFor: 'initialization' stamp: 'AC 11/11/2018 01:06:39'!
slideFrom: aPosition to: anotherPosition 

	fromPosition := aPosition .
	toPosition := anotherPosition .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SlidingPlayX class' category: #TerniLapilliConsole!
SlidingPlayX class
	instanceVariableNames: ''!

!SlidingPlayX class methodsFor: 'initialization' stamp: 'AC 11/11/2018 01:06:39'!
from: fromPosition to: toPosition

	^self new slideFrom: fromPosition to: toPosition.! !


!classDefinition: #TerniLapilliState category: #TerniLapilliConsole!
Object subclass: #TerniLapilliState
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliConsole'!

!TerniLapilliState methodsFor: 'testing game result' stamp: 'HAW 11/8/2018 12:13:16'!
areAllXsOnTheBoard
	
	^false! !

!TerniLapilliState methodsFor: 'testing game result' stamp: 'AC 11/10/2018 19:55:45'!
hasPlayerOWon

	^false! !

!TerniLapilliState methodsFor: 'testing game result' stamp: 'AC 11/10/2018 19:55:42'!
hasPlayerXWon

	^false! !

!TerniLapilliState methodsFor: 'testing game result' stamp: 'HAW 11/8/2018 12:13:10'!
isOver
	
	^false! !


!TerniLapilliState methodsFor: 'testing playing turn' stamp: 'HAW 11/8/2018 12:06:17'!
isPlacingX
	
	^false! !

!TerniLapilliState methodsFor: 'testing playing turn' stamp: 'HAW 11/8/2018 12:15:12'!
isPlayingO
	
	^false! !

!TerniLapilliState methodsFor: 'testing playing turn' stamp: 'HAW 11/8/2018 12:14:00'!
isPlayingX
	
	^false! !

!TerniLapilliState methodsFor: 'testing playing turn' stamp: 'HAW 11/8/2018 11:29:36'!
isSlidingX
	
	^false! !


!TerniLapilliState methodsFor: 'marking board' stamp: 'HAW 11/8/2018 11:03:55'!
putOAt: aPosition
	
	self subclassResponsibility! !

!TerniLapilliState methodsFor: 'marking board' stamp: 'HAW 11/8/2018 11:04:00'!
putXAt: aPosition
	
	self subclassResponsibility! !


!TerniLapilliState methodsFor: 'sliding' stamp: 'HAW 11/8/2018 11:48:38'!
slideOFrom: aPosition to: anotherPosition
	
	self subclassResponsibility! !

!TerniLapilliState methodsFor: 'sliding' stamp: 'HAW 11/8/2018 11:48:20'!
slideXFrom: aPosition to: anotherPosition
	
	self subclassResponsibility! !


!TerniLapilliState methodsFor: 'initialization' stamp: 'HAW 10/25/2017 13:05:13'!
initializeFor: aGame

	game := aGame ! !


!TerniLapilliState methodsFor: 'visiting' stamp: 'AC 11/10/2018 20:11:07'!
accept: aTerniLapilliStateVisitor

	^self subclassResponsibility .
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilliState class' category: #TerniLapilliConsole!
TerniLapilliState class
	instanceVariableNames: ''!

!TerniLapilliState class methodsFor: 'instance creation' stamp: 'HAW 11/8/2018 11:21:36'!
for: aTerniLapilli 

	| stateClass |
	
	stateClass := self allSubclasses detect: [:anStateClass | anStateClass isFor: aTerniLapilli ].	
	^stateClass new initializeFor: aTerniLapilli ! !


!TerniLapilliState class methodsFor: 'state selection' stamp: 'HAW 11/8/2018 11:21:46'!
isFor: aTerniLapilli 

	^self subclassResponsibility ! !


!classDefinition: #GameOverState category: #TerniLapilliConsole!
TerniLapilliState subclass: #GameOverState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliConsole'!

!GameOverState methodsFor: 'testing game result' stamp: 'AC 11/10/2018 19:51:04'!
hasPlayerOWon

	^self subclassResponsibility.! !

!GameOverState methodsFor: 'testing game result' stamp: 'AC 11/10/2018 19:51:08'!
hasPlayerXWon

	^self subclassResponsibility.! !

!GameOverState methodsFor: 'testing game result' stamp: 'HAW 11/8/2018 12:15:43'!
isOver

	^ true.! !


!GameOverState methodsFor: 'marking board' stamp: 'HAW 11/8/2018 11:08:57'!
putOAt: aPosition

	game error: game class canNotPlayWhenGameIsOverErrorMessage ! !

!GameOverState methodsFor: 'marking board' stamp: 'HAW 11/8/2018 11:09:02'!
putXAt: aPosition

	game error: game class canNotPlayWhenGameIsOverErrorMessage ! !


!GameOverState methodsFor: 'sliding' stamp: 'HAW 11/8/2018 11:48:38'!
slideOFrom: aPosition to: anotherPostion

	game error: game class canNotPlayWhenGameIsOverErrorMessage ! !

!GameOverState methodsFor: 'sliding' stamp: 'HAW 11/8/2018 11:48:20'!
slideXFrom: aPosition to: anotherPostion

	game error: game class canNotPlayWhenGameIsOverErrorMessage ! !


!GameOverState methodsFor: 'visiting' stamp: 'AC 11/10/2018 20:14:50'!
accept: aTerniLapilliStateVisitor

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'GameOverState class' category: #TerniLapilliConsole!
GameOverState class
	instanceVariableNames: ''!

!GameOverState class methodsFor: 'state selection' stamp: 'AC 11/10/2018 19:56:20'!
isFor: aTerniLapilli 

	^false! !


!classDefinition: #WinnerIsO category: #TerniLapilliConsole!
GameOverState subclass: #WinnerIsO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliConsole'!

!WinnerIsO methodsFor: 'testing game result' stamp: 'AC 11/10/2018 19:51:57'!
hasPlayerOWon

	^true! !

!WinnerIsO methodsFor: 'testing game result' stamp: 'AC 11/10/2018 19:52:18'!
hasPlayerXWon

	^false! !


!WinnerIsO methodsFor: 'visiting' stamp: 'AC 11/10/2018 20:15:06'!
accept: aTerniLapilliStateVisitor

	aTerniLapilliStateVisitor visitWinnerIsO! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'WinnerIsO class' category: #TerniLapilliConsole!
WinnerIsO class
	instanceVariableNames: ''!

!WinnerIsO class methodsFor: 'state selection' stamp: 'AC 11/10/2018 19:53:24'!
isFor: aTerniLapilli 

	^aTerniLapilli playerOWon! !


!classDefinition: #WinnerIsX category: #TerniLapilliConsole!
GameOverState subclass: #WinnerIsX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliConsole'!

!WinnerIsX methodsFor: 'testing game result' stamp: 'AC 11/10/2018 19:52:10'!
hasPlayerOWon

	^false! !

!WinnerIsX methodsFor: 'testing game result' stamp: 'AC 11/10/2018 19:52:06'!
hasPlayerXWon

	^true! !


!WinnerIsX methodsFor: 'visiting' stamp: 'AC 11/10/2018 20:15:28'!
accept: aTerniLapilliStateVisitor

	aTerniLapilliStateVisitor visitWinnerIsX! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'WinnerIsX class' category: #TerniLapilliConsole!
WinnerIsX class
	instanceVariableNames: ''!

!WinnerIsX class methodsFor: 'state selection' stamp: 'AC 11/10/2018 19:53:40'!
isFor: aTerniLapilli 

	^ aTerniLapilli playerXWon! !


!classDefinition: #PlayingO category: #TerniLapilliConsole!
TerniLapilliState subclass: #PlayingO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliConsole'!

!PlayingO methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:18:36'!
isPlayingO
	
	^true! !


!PlayingO methodsFor: 'sliding' stamp: 'HAW 11/8/2018 11:48:20'!
slideXFrom: aPosition to: anotherPostion

	game slideXWhenPlayingOFrom: aPosition to: anotherPostion .! !


!PlayingO methodsFor: 'visiting' stamp: 'AC 11/10/2018 20:14:05'!
accept: aTerniLapilliStateVisitor

	aTerniLapilliStateVisitor visitPlayingO! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PlayingO class' category: #TerniLapilliConsole!
PlayingO class
	instanceVariableNames: ''!

!PlayingO class methodsFor: 'state selection' stamp: 'HAW 11/8/2018 11:23:04'!
isFor: aTerniLapilli 

	^false! !


!classDefinition: #PlacingO category: #TerniLapilliConsole!
PlayingO subclass: #PlacingO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliConsole'!

!PlacingO methodsFor: 'marking board' stamp: 'JG 10/28/2018 12:10:45'!
putOAt: aPosition

	game putOWhenPlacingOAt: aPosition ! !

!PlacingO methodsFor: 'marking board' stamp: 'JG 10/28/2018 13:05:38'!
putXAt: aPosition

	game putXWhenPlacingOAt: aPosition ! !


!PlacingO methodsFor: 'sliding' stamp: 'HAW 11/8/2018 11:48:38'!
slideOFrom: aPosition to: anotherPostion

	game slideOWhenPlacingOFrom: aPosition to: anotherPostion .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PlacingO class' category: #TerniLapilliConsole!
PlacingO class
	instanceVariableNames: ''!

!PlacingO class methodsFor: 'state selection' stamp: 'AC 11/10/2018 20:03:41'!
isFor: aTerniLapilli 

	^aTerniLapilli isPlacingX and: [ aTerniLapilli playerXWon not ] ! !


!classDefinition: #SlidingO category: #TerniLapilliConsole!
PlayingO subclass: #SlidingO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliConsole'!

!SlidingO methodsFor: 'marking board' stamp: 'JG 10/28/2018 12:11:14'!
putOAt: aPosition

	game putOWhenSlidingOAt: aPosition ! !

!SlidingO methodsFor: 'marking board' stamp: 'JG 10/28/2018 12:04:38'!
putXAt: aPosition

	game putXWhenSlidingXAt: aPosition ! !


!SlidingO methodsFor: 'sliding' stamp: 'HAW 11/8/2018 11:48:38'!
slideOFrom: aPosition to: anotherPostion
 
	game slideOWhenSlidingOFrom: aPosition to: anotherPostion .! !


!SlidingO methodsFor: 'testing pieces placed' stamp: 'JG 10/28/2018 12:04:38'!
areAllXsOnTheBoard
	
	^true! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SlidingO class' category: #TerniLapilliConsole!
SlidingO class
	instanceVariableNames: ''!

!SlidingO class methodsFor: 'state selection' stamp: 'AC 11/10/2018 20:03:57'!
isFor: aTerniLapilli 

	^aTerniLapilli isSlidingX and: [ aTerniLapilli playerXWon not ]! !


!classDefinition: #PlayingX category: #TerniLapilliConsole!
TerniLapilliState subclass: #PlayingX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliConsole'!

!PlayingX methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:17:23'!
isPlayingX
	
	^true! !


!PlayingX methodsFor: 'sliding' stamp: 'HAW 11/8/2018 11:48:38'!
slideOFrom: aPosition to: anotherPostion
 
	game slideOWhenPlayingXFrom: aPosition to: anotherPostion .! !


!PlayingX methodsFor: 'visiting' stamp: 'AC 11/10/2018 20:14:20'!
accept: aTerniLapilliStateVisitor

	aTerniLapilliStateVisitor visitPlayingX! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PlayingX class' category: #TerniLapilliConsole!
PlayingX class
	instanceVariableNames: ''!

!PlayingX class methodsFor: 'state selection' stamp: 'HAW 11/8/2018 11:25:23'!
isFor: aTerniLapilli 

	^false! !


!classDefinition: #PlacingX category: #TerniLapilliConsole!
PlayingX subclass: #PlacingX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliConsole'!

!PlacingX methodsFor: 'marking board' stamp: 'JG 10/28/2018 13:52:28'!
putOAt: aPosition

	game putOWhenPlacingXAt: aPosition ! !

!PlacingX methodsFor: 'marking board' stamp: 'JG 10/28/2018 11:58:08'!
putXAt: aPosition

	game putXWhenPlacingXAt: aPosition ! !


!PlacingX methodsFor: 'sliding' stamp: 'HAW 11/8/2018 11:48:20'!
slideXFrom: aPosition to: anotherPostion

	game slideXWhenPlacingXFrom: aPosition to: anotherPostion .! !


!PlacingX methodsFor: 'testing playing turn' stamp: 'HAW 11/8/2018 12:06:28'!
isPlacingX

	^true! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PlacingX class' category: #TerniLapilliConsole!
PlacingX class
	instanceVariableNames: ''!

!PlacingX class methodsFor: 'state selection' stamp: 'HAW 11/8/2018 11:25:47'!
isFor: aTerniLapilli 

	^aTerniLapilli isPlayingO and: [ aTerniLapilli hasXMorePiecesToPlace]! !


!classDefinition: #SlidingX category: #TerniLapilliConsole!
PlayingX subclass: #SlidingX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliConsole'!

!SlidingX methodsFor: 'marking board' stamp: 'JG 10/28/2018 14:51:46'!
putOAt: aPosition

	game putOWhenSlidingXAt: aPosition ! !

!SlidingX methodsFor: 'marking board' stamp: 'JG 10/28/2018 12:00:12'!
putXAt: aPosition

	game putXWhenSlidingXAt: aPosition ! !


!SlidingX methodsFor: 'sliding' stamp: 'HAW 11/8/2018 11:48:20'!
slideXFrom: aPosition to: anotherPostion
 
	game slideXWhenSlidingXFrom: aPosition to: anotherPostion .! !


!SlidingX methodsFor: 'testing pieces placed' stamp: 'JG 10/28/2018 11:30:43'!
areAllXsOnTheBoard
	
	^true! !


!SlidingX methodsFor: 'testing playing turn' stamp: 'HAW 11/8/2018 11:29:47'!
isSlidingX

	^true! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SlidingX class' category: #TerniLapilliConsole!
SlidingX class
	instanceVariableNames: ''!

!SlidingX class methodsFor: 'state selection' stamp: 'AC 11/10/2018 20:04:10'!
isFor: aTerniLapilli 

	^aTerniLapilli isPlayingO and: [ aTerniLapilli hasXMorePiecesToPlace not and: [ aTerniLapilli playerOWon not ]]! !


!classDefinition: #TerniLapilliStateObserver category: #TerniLapilliConsole!
Object subclass: #TerniLapilliStateObserver
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliConsole'!

!TerniLapilliStateObserver methodsFor: 'as yet unclassified' stamp: 'AC 11/10/2018 19:21:16'!
initializeOn: aTerniLapilli

	^self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilliStateObserver class' category: #TerniLapilliConsole!
TerniLapilliStateObserver class
	instanceVariableNames: ''!

!TerniLapilliStateObserver class methodsFor: 'as yet unclassified' stamp: 'AC 11/10/2018 19:20:53'!
on: aTerniLapilli

	^self new initializeOn: aTerniLapilli .! !


!classDefinition: #TerniLapilliConsole category: #TerniLapilliConsole!
TerniLapilliStateObserver subclass: #TerniLapilliConsole
	instanceVariableNames: 'terniLapilli lines'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliConsole'!

!TerniLapilliConsole methodsFor: 'initialization' stamp: 'AC 11/10/2018 20:17:33'!
initializeOn: aTerniLapilli
	
	terniLapilli := aTerniLapilli.
	aTerniLapilli addStateObserver: self.
	lines := OrderedCollection new.! !


!TerniLapilliConsole methodsFor: 'visiting TerniLapilli states' stamp: 'AC 11/11/2018 00:21:17'!
visitPlayingO

	lines add: 'Estado: Jugando O'! !

!TerniLapilliConsole methodsFor: 'visiting TerniLapilli states' stamp: 'AC 11/11/2018 00:21:23'!
visitPlayingX

	lines add: 'Estado: Jugando X'! !

!TerniLapilliConsole methodsFor: 'visiting TerniLapilli states' stamp: 'AC 11/10/2018 20:16:19'!
visitWinnerIsO

	lines add: 'Estado: Juego terminado - ¡Ganó O!!'! !

!TerniLapilliConsole methodsFor: 'visiting TerniLapilli states' stamp: 'AC 11/10/2018 20:16:11'!
visitWinnerIsX

	lines add: 'Estado: Juego terminado - ¡Ganó X!!'! !


!TerniLapilliConsole methodsFor: 'operations' stamp: 'AC 11/8/2018 20:19:02'!
lines

	^ReadStream on: lines from: 1 to: (lines size)! !

!TerniLapilliConsole methodsFor: 'operations' stamp: 'Lucas 11/11/2018 19:05:21'!
update: aTerniLapilliState

	terniLapilli lastPlay accept: self.
	aTerniLapilliState accept: self

"
	| lastPlay |
	lastPlay _ terniLapilli lastPlay.
	
	lastPlay wasMadeByX ifTrue:[
		(lastPlay isAMarking ) ifTrue: [lines add: 'X marcó en ', (lastPlay markedPosition printString)].
		(lastPlay isASliding) ifTrue: [lines add: 'X deslizó hasta ', (lastPlay toPosition printString), ' desde ', (lastPlay fromPosition printString)].
	]
	ifFalse:[
		(lastPlay isAMarking ) ifTrue: [lines add: 'O marcó en ', (lastPlay markedPosition printString)].
		(lastPlay isASliding) ifTrue: [lines add: 'O deslizó hasta ', (lastPlay toPosition printString), ' desde ', (lastPlay fromPosition printString)].
	].
	
	aTerniLapilliState accept: self
	
"! !


!TerniLapilliConsole methodsFor: 'visiting TerniLapilli Plays' stamp: 'AC 11/11/2018 01:22:46'!
visitMarkingPlayO: aTerniLapilliPlay

	lines add: 'O marcó en ', (aTerniLapilliPlay markedPosition printString).! !

!TerniLapilliConsole methodsFor: 'visiting TerniLapilli Plays' stamp: 'AC 11/11/2018 01:22:59'!
visitMarkingPlayX: aTerniLapilliPlay

	lines add: 'X marcó en ', (aTerniLapilliPlay markedPosition printString).! !

!TerniLapilliConsole methodsFor: 'visiting TerniLapilli Plays' stamp: 'AC 11/11/2018 01:23:43'!
visitSlidingPlayO: aTerniLapilliPlay

	lines add: 'O deslizó hasta ', (aTerniLapilliPlay toPosition printString), ' desde ', (aTerniLapilliPlay fromPosition printString)! !

!TerniLapilliConsole methodsFor: 'visiting TerniLapilli Plays' stamp: 'AC 11/11/2018 01:23:35'!
visitSlidingPlayX: aTerniLapilliPlay

	lines add: 'X deslizó hasta ', (aTerniLapilliPlay toPosition printString), ' desde ', (aTerniLapilliPlay fromPosition printString)! !


!classDefinition: #TerniLapilliView category: #TerniLapilliConsole!
TerniLapilliStateObserver subclass: #TerniLapilliView
	instanceVariableNames: 'terniLapilli lines'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliConsole'!

!TerniLapilliView methodsFor: 'initialization' stamp: 'Lucas 11/11/2018 22:58:24'!
initializeOn: aTerniLapilli
	
	terniLapilli := aTerniLapilli.
	aTerniLapilli addStateObserver: self.
	lines := OrderedCollection new.
	lines add: ' | | '.
	lines add: ' | | '.
	lines add: ' | | '.
	lines add: 'Playing X'.
	
	lines removeFirst.
	lines removeFirst.
	lines removeFirst.
	lines removeFirst.
	
	lines add: ' | | '.
	lines add: ' | | '.
	lines add: ' | | '.
	lines add: 'Playing X'.
	! !


!TerniLapilliView methodsFor: 'visiting TerniLapilli states' stamp: 'Lucas 11/11/2018 22:00:21'!
visitPlayingO

	lines at: 4 put: 'Playing O'; yourself.! !

!TerniLapilliView methodsFor: 'visiting TerniLapilli states' stamp: 'Lucas 11/11/2018 22:00:25'!
visitPlayingX

	lines at: 4 put: 'Playing X'; yourself.! !

!TerniLapilliView methodsFor: 'visiting TerniLapilli states' stamp: 'Lucas 11/11/2018 22:00:29'!
visitWinnerIsO

	lines at: 4 put: 'O Won!!'; yourself.! !

!TerniLapilliView methodsFor: 'visiting TerniLapilli states' stamp: 'Lucas 11/11/2018 22:00:33'!
visitWinnerIsX

	lines at: 4 put: 'X Won!!'; yourself.! !


!TerniLapilliView methodsFor: 'operations' stamp: 'Lucas 11/11/2018 22:21:39'!
lines
	
	| linesView aLine |
	
	linesView := OrderedCollection new.
	
	aLine := lines at: 1.
	linesView add: aLine.
	linesView add: '-----'.
	aLine := lines at: 2.
	linesView add: aLine.
	linesView add: '-----'.
	aLine := lines at: 3.
	linesView add: aLine.
	aLine := lines at: 4.
	linesView add: aLine.
	
	^ReadStream on: linesView from: 1 to: (linesView size).! !

!TerniLapilliView methodsFor: 'operations' stamp: 'Lucas 11/11/2018 20:58:21'!
update: aTerniLapilliState

	terniLapilli lastPlay accept: self.
	aTerniLapilliState accept: self

"
	| lastPlay |
	lastPlay _ terniLapilli lastPlay.
	
	lastPlay wasMadeByX ifTrue:[
		(lastPlay isAMarking ) ifTrue: [lines add: 'X marcó en ', (lastPlay markedPosition printString)].
		(lastPlay isASliding) ifTrue: [lines add: 'X deslizó hasta ', (lastPlay toPosition printString), ' desde ', (lastPlay fromPosition printString)].
	]
	ifFalse:[
		(lastPlay isAMarking ) ifTrue: [lines add: 'O marcó en ', (lastPlay markedPosition printString)].
		(lastPlay isASliding) ifTrue: [lines add: 'O deslizó hasta ', (lastPlay toPosition printString), ' desde ', (lastPlay fromPosition printString)].
	].
	
	aTerniLapilliState accept: self
	
"! !


!TerniLapilliView methodsFor: 'visiting TerniLapilli Plays' stamp: 'Lucas 11/11/2018 22:48:50'!
visitMarkingPlayO: aTerniLapilliPlay

	| aLine |
	
	aLine := lines at: aTerniLapilliPlay markedPosition y.
	
	((aTerniLapilliPlay markedPosition x) = 1) ifTrue: [aLine at: 1 put: $O].  
	((aTerniLapilliPlay markedPosition x) = 2) ifTrue: [aLine at: 3 put: $O].  
	((aTerniLapilliPlay markedPosition x) = 3) ifTrue: [aLine at: 5 put: $O]. 
	
	lines at: aTerniLapilliPlay markedPosition y put: aLine; yourself.! !

!TerniLapilliView methodsFor: 'visiting TerniLapilli Plays' stamp: 'Lucas 11/11/2018 22:48:38'!
visitMarkingPlayX: aTerniLapilliPlay

	| aLine |
	
	aLine := lines at: aTerniLapilliPlay markedPosition y.
	
	((aTerniLapilliPlay markedPosition x) = 1) ifTrue: [aLine at: 1 put: $X].  
	((aTerniLapilliPlay markedPosition x) = 2) ifTrue: [aLine at: 3 put: $X].  
	((aTerniLapilliPlay markedPosition x) = 3) ifTrue: [aLine at: 5 put: $X]. 
	
	lines at: aTerniLapilliPlay markedPosition y put: aLine; yourself.! !

!TerniLapilliView methodsFor: 'visiting TerniLapilli Plays' stamp: 'Lucas 11/11/2018 23:04:58'!
visitSlidingPlayO: aTerniLapilliPlay

	| aLine |
	
	self deleteFromPosition: aTerniLapilliPlay.	
	
	aLine := lines at: aTerniLapilliPlay toPosition y.
	
	(aTerniLapilliPlay toPosition x = 1) ifTrue: [aLine at: 1 put: $O].  
	(aTerniLapilliPlay toPosition x = 2) ifTrue: [aLine at: 3 put: $O].  
	(aTerniLapilliPlay toPosition x = 3) ifTrue: [aLine at: 5 put: $O]. 
	
	lines at: aTerniLapilliPlay toPosition y put: aLine; yourself.! !

!TerniLapilliView methodsFor: 'visiting TerniLapilli Plays' stamp: 'Lucas 11/11/2018 23:05:02'!
visitSlidingPlayX: aTerniLapilliPlay

	| aLine |
	
	self deleteFromPosition: aTerniLapilliPlay.
	
	aLine := lines at: aTerniLapilliPlay toPosition y.
	
	(aTerniLapilliPlay toPosition x = 1) ifTrue: [aLine at: 1 put: $X].  
	(aTerniLapilliPlay toPosition x = 2) ifTrue: [aLine at: 3 put: $X].  
	(aTerniLapilliPlay toPosition x = 3) ifTrue: [aLine at: 5 put: $X]. 
	
	lines at: aTerniLapilliPlay toPosition y put: aLine; yourself.
! !


!TerniLapilliView methodsFor: 'as yet unclassified' stamp: 'Lucas 11/11/2018 23:04:41'!
deleteFromPosition: aTerniLapilliPlay

	| aLine |
	
	aLine := lines at: aTerniLapilliPlay fromPosition y.
	
	(aTerniLapilliPlay fromPosition x = 1) ifTrue: [aLine at: 1 put: $ ].  
	(aTerniLapilliPlay fromPosition x = 2) ifTrue: [aLine at: 3 put: $ ].  
	(aTerniLapilliPlay fromPosition x = 3) ifTrue: [aLine at: 5 put: $ ]. 
	
	lines at: aTerniLapilliPlay fromPosition y put: aLine; yourself.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilliView class' category: #TerniLapilliConsole!
TerniLapilliView class
	instanceVariableNames: ''!

!TerniLapilliView class methodsFor: 'as yet unclassified' stamp: 'Lucas 11/11/2018 22:16:55'!
on: aTerniLapilli

	^self new initializeOn: aTerniLapilli .! !


!classDefinition: #TerniLapilliViewAux category: #TerniLapilliConsole!
Object subclass: #TerniLapilliViewAux
	instanceVariableNames: 'terniLapilli lines'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliConsole'!

!TerniLapilliViewAux methodsFor: 'initialization' stamp: 'Lucas 11/11/2018 20:58:04'!
initializeOn: aTerniLapilli

	terniLapilli := aTerniLapilli.
	lines := OrderedCollection new.
	lines add: ' | | '.
	lines add: ' | | '.
	lines add: ' | | '.
	lines add: 'Playing X'.
	! !


!TerniLapilliViewAux methodsFor: 'as yet unclassified' stamp: 'Lucas 11/11/2018 20:58:04'!
lines
	
	| linesView aLine |
	
	linesView := OrderedCollection new.
	
	aLine := lines at: 1.
	linesView add: aLine.
	linesView add: '-----'.
	aLine := lines at: 2.
	linesView add: aLine.
	linesView add: '-----'.
	aLine := lines at: 3.
	linesView add: aLine.
	aLine := lines at: 4.
	linesView add: aLine.
	
	^ReadStream on: linesView from: 1 to: (linesView size).
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilliViewAux class' category: #TerniLapilliConsole!
TerniLapilliViewAux class
	instanceVariableNames: ''!

!TerniLapilliViewAux class methodsFor: 'as yet unclassified' stamp: 'Lucas 11/11/2018 20:58:04'!
on: aTerniLapilli

	^self new initializeOn: aTerniLapilli! !


!classDefinition: #ActiveVariable category: #TerniLapilliConsole!
ProtoObject subclass: #ActiveVariable
	instanceVariableNames: 'value observers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilliConsole'!

!ActiveVariable methodsFor: 'as yet unclassified' stamp: 'AC 11/10/2018 20:18:05'!
addObserver: anObserver

	observers add: anObserver ! !

!ActiveVariable methodsFor: 'as yet unclassified' stamp: 'AC 11/10/2018 19:20:09'!
changeTo: aValue

	value := aValue.
	observers do: [:anObserver | anObserver update: aValue ].! !

!ActiveVariable methodsFor: 'as yet unclassified' stamp: 'AC 11/10/2018 19:18:36'!
doesNotUnderstand: aMessage

	^aMessage sendTo: value.! !

!ActiveVariable methodsFor: 'as yet unclassified' stamp: 'AC 11/10/2018 19:25:25'!
initializeOn: aVariable

	value := aVariable.
	observers := OrderedCollection new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ActiveVariable class' category: #TerniLapilliConsole!
ActiveVariable class
	instanceVariableNames: ''!

!ActiveVariable class methodsFor: 'as yet unclassified' stamp: 'AC 11/10/2018 19:24:56'!
on: aVariable

	^self new initializeOn: aVariable.! !
