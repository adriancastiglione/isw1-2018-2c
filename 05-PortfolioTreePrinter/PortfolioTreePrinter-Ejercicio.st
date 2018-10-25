!classDefinition: #AccountTransaction category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!AccountTransaction methodsFor: 'evaluating' stamp: 'Lucas 10/22/2018 19:14:58'!
accept: aVisitor

	aVisitor perform: ('visit', self class name, ':') asSymbol with: self! !

!AccountTransaction methodsFor: 'evaluating' stamp: 'HAW 10/18/2018 18:48:48'!
affectBalance: currentBalance

	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'evaluating' stamp: 'HernanWilkinson 7/14/2011 06:48'!
value

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
register: aValue on: account

	| withdraw |
	
	withdraw := self for: aValue.
	account register: withdraw.
		
	^ withdraw! !


!classDefinition: #CertificateOfDeposit category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction subclass: #CertificateOfDeposit
	instanceVariableNames: 'value day interesRate'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!CertificateOfDeposit methodsFor: 'initialization' stamp: 'Lucas 10/20/2018 23:44:43'!
inicializeFor: aValue during: aNumberOfDays at: anInteresRate

	value := aValue.
	day  := aNumberOfDays.
	interesRate := anInteresRate! !


!CertificateOfDeposit methodsFor: 'value' stamp: 'Lucas 10/20/2018 23:28:50'!
affectBalance: currentBalance

	^currentBalance - value! !

!CertificateOfDeposit methodsFor: 'value' stamp: 'Lucas 10/20/2018 23:43:23'!
day

	^ day! !

!CertificateOfDeposit methodsFor: 'value' stamp: 'Lucas 10/20/2018 23:43:35'!
interesRate

	^ interesRate! !

!CertificateOfDeposit methodsFor: 'value' stamp: 'Lucas 10/20/2018 23:29:32'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CertificateOfDeposit class' category: #'PortfolioTreePrinter-Ejercicio'!
CertificateOfDeposit class
	instanceVariableNames: ''!

!CertificateOfDeposit class methodsFor: 'as yet unclassified' stamp: 'Lucas 10/20/2018 23:45:37'!
for: aValue during: aNumberOfDays at: anInteresRate

	^self new inicializeFor: aValue during: aNumberOfDays at: anInteresRate.

	! !

!CertificateOfDeposit class methodsFor: 'as yet unclassified' stamp: 'Lucas 10/20/2018 23:45:20'!
register: aValue during: aNumberOfDays at: anInteresRate on: account

	| transaction |
	
	transaction := self for: aValue during: aNumberOfDays at: anInteresRate.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HAW 10/18/2018 18:49:00'!
affectBalance: currentBalance

	^currentBalance + value! !

!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'PortfolioTreePrinter-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !

!Deposit class methodsFor: 'instance creation' stamp: 'Lucas 10/20/2018 23:40:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #TransferLeg category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!TransferLeg methodsFor: 'value' stamp: 'AC 10/24/2018 20:47:20'!
affectBalance: currentBalance

	self subclassResponsibility ! !

!TransferLeg methodsFor: 'value' stamp: 'Lucas 10/20/2018 20:32:10'!
transfer

	^transfer ! !

!TransferLeg methodsFor: 'value' stamp: 'Lucas 10/20/2018 20:32:25'!
value

	^transfer value! !


!TransferLeg methodsFor: 'initialization' stamp: 'Lucas 10/20/2018 20:31:54'!
initializeRelatedTo: aTransfer 
	
	transfer := aTransfer ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: #'PortfolioTreePrinter-Ejercicio'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'as yet unclassified' stamp: 'Lucas 10/20/2018 20:31:35'!
relatedTo: aTransfer 
	
	^self new initializeRelatedTo: aTransfer ! !


!classDefinition: #TransferDeposit category: #'PortfolioTreePrinter-Ejercicio'!
TransferLeg subclass: #TransferDeposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!TransferDeposit methodsFor: 'value' stamp: 'Lucas 10/20/2018 20:33:06'!
affectBalance: currentBalance

	^currentBalance + self value! !


!classDefinition: #TransferWithdraw category: #'PortfolioTreePrinter-Ejercicio'!
TransferLeg subclass: #TransferWithdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!TransferWithdraw methodsFor: 'value' stamp: 'Lucas 10/20/2018 20:33:16'!
affectBalance: currentBalance

	^currentBalance - self value! !


!classDefinition: #Withdraw category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HAW 10/18/2018 18:49:08'!
affectBalance: currentBalance

	^currentBalance - value! !

!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/14/2011 05:54'!
value

	^ value ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'PortfolioTreePrinter-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !

!Withdraw class methodsFor: 'instance creation' stamp: 'Lucas 10/20/2018 23:40:15'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #AccountTransactionVisitor category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #AccountTransactionVisitor
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!AccountTransactionVisitor methodsFor: 'initialization' stamp: 'Lucas 10/22/2018 20:07:52'!
inicializeOf: aReceptiveAccount

	account := aReceptiveAccount! !


!AccountTransactionVisitor methodsFor: 'operations' stamp: 'Lucas 10/22/2018 20:00:05'!
visitCertificateOfDeposit: aCertificateOfDeposit! !

!AccountTransactionVisitor methodsFor: 'operations' stamp: 'Lucas 10/22/2018 19:59:02'!
visitDeposit: aDeposit! !

!AccountTransactionVisitor methodsFor: 'operations' stamp: 'Lucas 10/22/2018 19:59:27'!
visitTransferDeposit: aTransferDeposit! !

!AccountTransactionVisitor methodsFor: 'operations' stamp: 'Lucas 10/22/2018 19:59:39'!
visitTransferWithdraw: aTransferWithdraw! !

!AccountTransactionVisitor methodsFor: 'operations' stamp: 'Lucas 10/22/2018 19:58:48'!
visitWithdraw: aWithdraw! !


!AccountTransactionVisitor methodsFor: 'value' stamp: 'Lucas 10/22/2018 20:02:23'!
value

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransactionVisitor class' category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransactionVisitor class
	instanceVariableNames: ''!

!AccountTransactionVisitor class methodsFor: 'initialization' stamp: 'Lucas 10/22/2018 20:05:51'!
of: aReceptiveAccount

	^self new inicializeOf: aReceptiveAccount! !


!classDefinition: #AccountInvestmentEarnings category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransactionVisitor subclass: #AccountInvestmentEarnings
	instanceVariableNames: 'investmentNet'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!AccountInvestmentEarnings methodsFor: 'operations' stamp: 'Lucas 10/22/2018 20:14:10'!
visitCertificateOfDeposit: aCertificateOfDeposit

	investmentNet := investmentNet + ((aCertificateOfDeposit value)* ((aCertificateOfDeposit interesRate)/360) * (aCertificateOfDeposit day) ).
	"
		self registerCertificateOfDepositOf: 100 during: 30 at: 1/10 on: account.
	self registerCertificateOfDepositOf: 100 during: 60 at: 15/100 on: account.

	investmentEarnings := 
		(100*((1/10)/360)*30) +
		(100*((15/100)/360)*60).
		"! !


!AccountInvestmentEarnings methodsFor: 'value' stamp: 'Lucas 10/22/2018 20:11:25'!
value 

	investmentNet  := 0.
	account transactions do: [:aTrx | aTrx accept: self].
	^investmentNet
	! !


!classDefinition: #AccountInvestmentNet category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransactionVisitor subclass: #AccountInvestmentNet
	instanceVariableNames: 'investmentNet'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!AccountInvestmentNet methodsFor: 'operations' stamp: 'Lucas 10/22/2018 20:04:01'!
visitCertificateOfDeposit: aCertificateOfDeposit

	investmentNet := investmentNet + aCertificateOfDeposit value.! !


!AccountInvestmentNet methodsFor: 'value' stamp: 'Lucas 10/22/2018 20:10:49'!
value 

	investmentNet  := 0.
	account transactions do: [:aTrx | aTrx accept: self].
	^investmentNet
	! !


!classDefinition: #AccountSummaryLines category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransactionVisitor subclass: #AccountSummaryLines
	instanceVariableNames: 'summaryLines'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!AccountSummaryLines methodsFor: 'operations' stamp: 'Lucas 10/22/2018 19:21:56'!
visitCertificateOfDeposit: aCertificateOfDeposit

	summaryLines add: 'Plazo fijo por ', aCertificateOfDeposit value printString, ' durante ', aCertificateOfDeposit day printString, ' dias a una tna de ', (aCertificateOfDeposit interesRate * 100) printString, '%'; yourself.! !

!AccountSummaryLines methodsFor: 'operations' stamp: 'Lucas 10/22/2018 19:18:03'!
visitDeposit: aDeposit

	summaryLines add: 'Deposito por ', aDeposit value printString ; yourself.! !

!AccountSummaryLines methodsFor: 'operations' stamp: 'Lucas 10/22/2018 19:19:46'!
visitTransferDeposit: aDeposit

	summaryLines add: 'Transferencia por ', aDeposit value printString ; yourself.! !

!AccountSummaryLines methodsFor: 'operations' stamp: 'Lucas 10/22/2018 19:20:07'!
visitTransferWithdraw: aWithdraw

	summaryLines add: 'Transferencia por -', aWithdraw value printString ; yourself.! !

!AccountSummaryLines methodsFor: 'operations' stamp: 'Lucas 10/22/2018 19:19:26'!
visitWithdraw: aWithdraw

	summaryLines add: 'Extraccion por ', aWithdraw value printString ; yourself.! !


!AccountSummaryLines methodsFor: 'value' stamp: 'Lucas 10/22/2018 20:35:59'!
value


	summaryLines := OrderedCollection new.
	account transactions do: [:aTrx | aTrx accept: self].

	^summaryLines! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountSummaryLines class' category: #'PortfolioTreePrinter-Ejercicio'!
AccountSummaryLines class
	instanceVariableNames: ''!

!AccountSummaryLines class methodsFor: 'as yet unclassified' stamp: 'Lucas 10/22/2018 17:49:39'!
of: aReceptiveAccount

	^self new inicializeOf: aReceptiveAccount! !


!classDefinition: #AccountTransferNet category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransactionVisitor subclass: #AccountTransferNet
	instanceVariableNames: 'transferNet'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!AccountTransferNet methodsFor: 'operations' stamp: 'Lucas 10/22/2018 19:34:15'!
visitTransferDeposit: aDeposit

	transferNet := transferNet + aDeposit value.! !

!AccountTransferNet methodsFor: 'operations' stamp: 'Lucas 10/22/2018 19:34:53'!
visitTransferWithdraw: aWithdraw

	transferNet := transferNet - aWithdraw value.! !


!AccountTransferNet methodsFor: 'value' stamp: 'Lucas 10/22/2018 19:36:12'!
value

	transferNet := 0.
	account transactions do: [:aTrx | aTrx accept: self].
	
		
	^transferNet ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransferNet class' category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransferNet class
	instanceVariableNames: ''!

!AccountTransferNet class methodsFor: 'as yet unclassified' stamp: 'Lucas 10/22/2018 19:32:12'!
of: aReceptiveAccount

	^self new inicializeOf: aReceptiveAccount! !


!classDefinition: #SummarizingAccount category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #SummarizingAccount
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!SummarizingAccount methodsFor: 'testing' stamp: 'HAW 10/18/2018 16:31:24'!
doesManage: anAccount

	self subclassResponsibility ! !

!SummarizingAccount methodsFor: 'testing' stamp: 'HAW 10/18/2018 16:32:05'!
hasRegistered: aTransaction

	self subclassResponsibility ! !


!SummarizingAccount methodsFor: 'transactions' stamp: 'Lucas 10/22/2018 20:28:26'!
accept: aVisitor

	aVisitor perform: ('visit', self class name, ':') asSymbol with: self! !

!SummarizingAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:34'!
balance

	self subclassResponsibility ! !

!SummarizingAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:35'!
transactions

	self subclassResponsibility ! !


!classDefinition: #Portfolio category: #'PortfolioTreePrinter-Ejercicio'!
SummarizingAccount subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!Portfolio methodsFor: 'testing' stamp: 'HAW 10/18/2018 16:31:24'!
anyManagedAccountManages: anAccount 

	^accounts anySatisfy: [ :managedAccount | (managedAccount doesManage: anAccount) or: [ anAccount doesManage: managedAccount ] ] ! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 10/18/2018 16:31:24'!
doesManage: anAccount

	^ self = anAccount  or: [ self anyManagedAccountManages: anAccount ]! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 10/18/2018 16:32:05'!
hasRegistered: aTransaction

	^ accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]  ! !


!Portfolio methodsFor: 'transactions' stamp: 'HAW 8/13/2017 17:47:44'!
balance

	^ accounts sum: [ :account | account balance ]
! !

!Portfolio methodsFor: 'transactions' stamp: 'HAW 9/25/2017 19:40:20'!
transactions 

	^ accounts 
		inject: OrderedCollection new 
		into: [ :transactions :account | transactions addAll: account transactions. transactions ]
	! !

!Portfolio methodsFor: 'transactions' stamp: 'HAW 10/18/2018 16:31:24'!
transactionsOf: anAccount 

	^ (self doesManage: anAccount)
		ifTrue: [ anAccount transactions ] 
		ifFalse: [ self error: self class accountNotManagedMessageDescription]
	! !


!Portfolio methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 19:19'!
initializeWithAll: aCollectionOfAccounts

	accounts := aCollectionOfAccounts   ! !


!Portfolio methodsFor: 'implementation - private' stamp: 'Lucas 10/22/2018 21:01:18'!
acceptInAllSubAccounts: aVisitor

	accounts do: [:anAccount | anAccount accept: aVisitor].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #'PortfolioTreePrinter-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/8/2018 16:33:13'!
with: leftAccount with: rightAccount

	^ self withAll: (Array with: leftAccount with: rightAccount)! !

!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/8/2018 16:40:55'!
withAll: aCollectionOfAccounts

	self checkCreationPreconditions: aCollectionOfAccounts.
	
	^self new initializeWithAll: aCollectionOfAccounts ! !


!Portfolio class methodsFor: 'assertions' stamp: 'HAW 10/18/2018 16:31:24'!
check: sourceAccount doesNotManagaAnyOf: aCollectionOfAccounts

	^ aCollectionOfAccounts do: [ :targetAccount | 
			(sourceAccount = targetAccount) not ifTrue: [ 
				(sourceAccount doesManage: targetAccount) ifTrue: [ self error: self accountAlreadyManagedErrorMessage ] ] ]! !

!Portfolio class methodsFor: 'assertions' stamp: 'HernanWilkinson 9/18/2011 17:21'!
checkAccountsAreUnique: aCollectionOfAccounts

	aCollectionOfAccounts asSet size = aCollectionOfAccounts size
		ifFalse: [ self error: self accountAlreadyManagedErrorMessage ]! !

!Portfolio class methodsFor: 'assertions' stamp: 'HernanWilkinson 9/18/2011 17:21'!
checkCreationPreconditions: aCollectionOfAccounts

	self checkAccountsAreUnique: aCollectionOfAccounts.
	self checkNoCircularReferencesIn: aCollectionOfAccounts! !

!Portfolio class methodsFor: 'assertions' stamp: 'HernanWilkinson 9/18/2011 17:22'!
checkNoCircularReferencesIn: aCollectionOfAccounts

	aCollectionOfAccounts do: [ :sourceAccount | self check: sourceAccount doesNotManagaAnyOf: aCollectionOfAccounts ]! !


!Portfolio class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/13/2011 19:28'!
accountAlreadyManagedErrorMessage

	^ 'Account already managed'! !

!Portfolio class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/13/2011 19:27'!
accountNotManagedMessageDescription
	
	^ 'Account not managed'! !


!classDefinition: #ReceptiveAccount category: #'PortfolioTreePrinter-Ejercicio'!
SummarizingAccount subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HAW 10/18/2018 18:49:23'!
balance

	^ transactions inject: 0 into: [ :balance :transaction | transaction affectBalance: balance ]! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'HAW 10/18/2018 16:31:24'!
doesManage: anAccount

	^ self = anAccount 
! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'HAW 10/18/2018 16:32:05'!
hasRegistered: aTtransaction

	^ transactions includes: aTtransaction 
! !


!classDefinition: #SummarizingAccountVisitor category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #SummarizingAccountVisitor
	instanceVariableNames: 'summarizingAccount accountNames treeLines amountSpaces'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!SummarizingAccountVisitor methodsFor: 'initialization' stamp: 'Lucas 10/22/2018 20:34:19'!
inicializeOf: aComposedPortfolio with: anAccountNames

	summarizingAccount := aComposedPortfolio.
	accountNames := anAccountNames.! !


!SummarizingAccountVisitor methodsFor: 'operations' stamp: 'AC 10/24/2018 20:53:45'!
visitPortfolio: aPortfolio

! !

!SummarizingAccountVisitor methodsFor: 'operations' stamp: 'AC 10/24/2018 20:53:53'!
visitReceptiveAccount: aReceptiveAccount
! !


!SummarizingAccountVisitor methodsFor: 'value' stamp: 'AC 10/24/2018 20:53:36'!
value
	
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SummarizingAccountVisitor class' category: #'PortfolioTreePrinter-Ejercicio'!
SummarizingAccountVisitor class
	instanceVariableNames: ''!

!SummarizingAccountVisitor class methodsFor: 'initialization' stamp: 'Lucas 10/22/2018 20:33:06'!
of: aComposedPortfolio with: accountNames

	^self new inicializeOf: aComposedPortfolio with: accountNames.! !


!classDefinition: #SummarizingAccountReverseTreePrinter category: #'PortfolioTreePrinter-Ejercicio'!
SummarizingAccountVisitor subclass: #SummarizingAccountReverseTreePrinter
	instanceVariableNames: 'treePrinter'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!SummarizingAccountReverseTreePrinter methodsFor: 'initialization' stamp: 'AC 10/24/2018 20:59:46'!
inicializeOf: aComposedPortfolio with: anAccountNames

	treePrinter := SummarizingAccountTreePrinter of: aComposedPortfolio with: anAccountNames ! !


!SummarizingAccountReverseTreePrinter methodsFor: 'operations' stamp: 'AC 10/24/2018 21:00:04'!
visitPortfolio: aPortfolio

	treePrinter visitPortfolio: aPortfolio ! !

!SummarizingAccountReverseTreePrinter methodsFor: 'operations' stamp: 'AC 10/24/2018 21:00:22'!
visitReceptiveAccount: aReceptiveAccount

	treePrinter  visitReceptiveAccount: aReceptiveAccount ! !


!SummarizingAccountReverseTreePrinter methodsFor: 'value' stamp: 'AC 10/24/2018 21:09:30'!
value
	
	| reversedLines |
	
	reversedLines _ OrderedCollection new.
	treePrinter value do:[:currentLine | reversedLines addFirst: currentLine].
	^reversedLines
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SummarizingAccountReverseTreePrinter class' category: #'PortfolioTreePrinter-Ejercicio'!
SummarizingAccountReverseTreePrinter class
	instanceVariableNames: ''!

!SummarizingAccountReverseTreePrinter class methodsFor: 'as yet unclassified' stamp: 'AC 10/24/2018 20:56:08'!
of: aComposedPortfolio with: accountNames

	^self new inicializeOf: aComposedPortfolio with: accountNames.! !


!classDefinition: #SummarizingAccountTreePrinter category: #'PortfolioTreePrinter-Ejercicio'!
SummarizingAccountVisitor subclass: #SummarizingAccountTreePrinter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!SummarizingAccountTreePrinter methodsFor: 'initialization' stamp: 'AC 10/24/2018 20:53:12'!
inicializeOf: aComposedPortfolio with: anAccountNames

	summarizingAccount := aComposedPortfolio.
	accountNames := anAccountNames.! !


!SummarizingAccountTreePrinter methodsFor: 'operations' stamp: 'AC 10/24/2018 20:53:12'!
visitPortfolio: aPortfolio

	treeLines add: (((String new:amountSpaces) atAllPut:$ ),(accountNames at: aPortfolio)).
	amountSpaces := amountSpaces + 1.
	aPortfolio acceptInAllSubAccounts: self .
	amountSpaces := amountSpaces - 1.! !

!SummarizingAccountTreePrinter methodsFor: 'operations' stamp: 'AC 10/24/2018 20:53:12'!
visitReceptiveAccount: aReceptiveAccount

	treeLines add: (((String new:amountSpaces) atAllPut:$ ),(accountNames at: aReceptiveAccount)).! !


!SummarizingAccountTreePrinter methodsFor: 'value' stamp: 'AC 10/24/2018 20:53:12'!
value
	amountSpaces := 0.
	treeLines := OrderedCollection new.
	summarizingAccount accept: self.

	^treeLines! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SummarizingAccountTreePrinter class' category: #'PortfolioTreePrinter-Ejercicio'!
SummarizingAccountTreePrinter class
	instanceVariableNames: ''!

!SummarizingAccountTreePrinter class methodsFor: 'as yet unclassified' stamp: 'AC 10/24/2018 20:53:12'!
of: aComposedPortfolio with: accountNames

	^self new inicializeOf: aComposedPortfolio with: accountNames.! !


!classDefinition: #Transfer category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'value depositLeg withdrawLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!Transfer methodsFor: 'initialization' stamp: 'Lucas 10/20/2018 20:30:10'!
initializeOf: anAmount 
	
	value := anAmount.
	depositLeg := TransferDeposit relatedTo: self.
	withdrawLeg := TransferWithdraw relatedTo: self ! !


!Transfer methodsFor: 'value' stamp: 'Lucas 10/20/2018 20:28:56'!
depositLeg

	^depositLeg ! !

!Transfer methodsFor: 'value' stamp: 'Lucas 10/20/2018 20:28:38'!
value
	
	^value ! !

!Transfer methodsFor: 'value' stamp: 'Lucas 10/20/2018 20:29:17'!
withdrawLeg

	^withdrawLeg ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: #'PortfolioTreePrinter-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'as yet unclassified' stamp: 'Lucas 10/20/2018 20:28:13'!
of: anAmount 

	^self new initializeOf: anAmount ! !

!Transfer class methodsFor: 'as yet unclassified' stamp: 'Lucas 10/20/2018 20:27:58'!
register: anAmount from: fromAccount to: toAccount

	|transfer |
	
	transfer := self of: anAmount.
	fromAccount register: transfer withdrawLeg.
	toAccount register: transfer depositLeg.
	
	^transfer! !
