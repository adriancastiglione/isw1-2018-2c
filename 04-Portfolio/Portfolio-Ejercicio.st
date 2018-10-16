!classDefinition: #AccountTransaction category: #'Portfolio-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'value - private' stamp: 'AC 10/14/2018 19:42:50'!
valueInBalance

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #'Portfolio-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
register: aValue on: account

	| withdraw |
	
	withdraw := self for: aValue.
	account register: withdraw.
		
	^ withdraw! !


!classDefinition: #Deposit category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'value - private' stamp: 'AC 10/14/2018 19:43:18'!
valueInBalance

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'Portfolio-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'value - private' stamp: 'AC 10/14/2018 19:43:42'!
valueInBalance

	^ value negated.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'Portfolio-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #SummarizingAccount category: #'Portfolio-Ejercicio'!
Object subclass: #SummarizingAccount
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!SummarizingAccount methodsFor: 'testing' stamp: 'HAW 10/11/2018 16:53:28'!
doesManage: anAccount

	self subclassResponsibility ! !

!SummarizingAccount methodsFor: 'testing' stamp: 'HAW 10/11/2018 16:53:54'!
hasRegistered: aTransaction

	self subclassResponsibility ! !


!SummarizingAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:35'!
transactions

	self subclassResponsibility ! !


!SummarizingAccount methodsFor: 'balance' stamp: 'HernanWilkinson 7/13/2011 18:34'!
balance

	self subclassResponsibility ! !


!SummarizingAccount methodsFor: 'testing - private' stamp: 'AC 10/15/2018 01:10:07'!
accounts

	self subclassResponsibility ! !


!classDefinition: #Portfolio category: #'Portfolio-Ejercicio'!
SummarizingAccount subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'balance' stamp: 'AC 10/11/2018 21:14:30'!
balance

	
	^self transactions sum:[:aTrx | (aTrx isKindOf:Deposit) ifTrue: [aTrx value]
																	ifFalse: [aTrx value negated]].! !


!Portfolio methodsFor: 'testing' stamp: 'AC 10/14/2018 20:38:46'!
doesManage: anAccount

	accounts detect: [:aSummarizingAccount | aSummarizingAccount  doesManage: anAccount] ifNone:[^self = anAccount].
	^true. 
		! !

!Portfolio methodsFor: 'testing' stamp: 'AC 10/11/2018 21:34:18'!
hasRegistered: aTransaction

	^self transactions includes: aTransaction ! !


!Portfolio methodsFor: 'transactions' stamp: 'AC 10/11/2018 21:30:49'!
transactions 


	| xx |
	xx := OrderedCollection new.
	accounts do: [:xAccount | xx addAll: (xAccount  transactions) ; yourself.] .
	^xx
	! !

!Portfolio methodsFor: 'transactions' stamp: 'AC 10/14/2018 20:42:30'!
transactionsOf: anAccount 

	| summarizingAccount |
	summarizingAccount := accounts detect:[ :aSummarizingAccount | aSummarizingAccount doesManage: anAccount] ifNone:[self error: self class accountNotManagedMessageDescription ].
	^summarizingAccount transactions 
	! !


!Portfolio methodsFor: 'initialization' stamp: 'AC 10/14/2018 23:26:50'!
initializeWith: aCollectionOfAccouts

	accounts := aCollectionOfAccouts.
! !


!Portfolio methodsFor: 'testing - private' stamp: 'AC 10/15/2018 01:11:20'!
accounts

	^accounts ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #'Portfolio-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'instance creation' stamp: 'AC 10/14/2018 21:11:29'!
with: leftAccount with: rightAccount

	^self withAll: (OrderedCollection with: leftAccount with:rightAccount )! !

!Portfolio class methodsFor: 'instance creation' stamp: 'AC 10/15/2018 01:23:35'!
withAll: aCollectionOfAccounts

	| aSetOfAccounts |
	
	"No puede haber cuentas repetidas"
	aSetOfAccounts := Set withAll: aCollectionOfAccounts .
	(aCollectionOfAccounts size = aSetOfAccounts size) ifFalse:[self error: self accountAlreadyManagedErrorMessage ].

	"ninguna cuenta es manejada por otra"
	(aCollectionOfAccounts allSatisfy: 
		[ :anAccount | aCollectionOfAccounts allSatisfy: 
			[:anotherAccount | (anAccount = anotherAccount) 
				or:[anotherAccount  accounts allSatisfy: [:anotherAccountManagedAccount | (anAccount doesManage: anotherAccountManagedAccount) not ]] 
			]
		]
	 )
	ifFalse: [self error: self accountAlreadyManagedErrorMessage ].
	

	^self new initializeWith: aCollectionOfAccounts ! !


!Portfolio class methodsFor: 'error messages' stamp: 'HAW 5/8/2018 16:08:43'!
accountAlreadyManagedErrorMessage

	^ 'Account already managed'! !

!Portfolio class methodsFor: 'error messages' stamp: 'HAW 5/8/2018 16:08:53'!
accountNotManagedMessageDescription
	
	^ 'Account not managed'! !


!classDefinition: #ReceptiveAccount category: #'Portfolio-Ejercicio'!
SummarizingAccount subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'Lucas 10/16/2018 00:51:22'!
balance

	transactions isEmpty ifTrue: [^0].
	^self transactions sum:[:aTransaction | aTransaction valueInBalance]! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'HAW 10/11/2018 16:53:28'!
doesManage: anAccount

	^ self = anAccount 
! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'HAW 10/11/2018 16:53:54'!
hasRegistered: aTtransaction

	^ transactions includes: aTtransaction 
! !


!ReceptiveAccount methodsFor: 'testing - private' stamp: 'AC 10/15/2018 01:10:46'!
accounts

	^OrderedCollection  with: self.! !
