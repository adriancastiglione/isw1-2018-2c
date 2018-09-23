!classDefinition: #CantSuspend category: #'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: #'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: #'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: 'customerBook'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'Lucas 9/22/2018 23:59:45'!
assertAmountActiveCustomers: activeCustomers amountSuspendedCustomers: suspendedCustomers amountCustomers: customers aMethodCustomerBelongs: aMethodcustomerBelongs

	self assert: activeCustomers equals: customerBook numberOfActiveCustomers.
	self assert: suspendedCustomers equals: customerBook numberOfSuspendedCustomers.
	self assert: customers equals: customerBook numberOfCustomers.
	aMethodcustomerBelongs value
	
	"
	customerBelongs
		ifTrue: [self assert: (customerBook includesCustomerNamed: 'paulMcCartney').]
		ifFalse: [self deny: (customerBook includesCustomerNamed: 'paulMcCartney').]"
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'AC 9/21/2018 17:03:02'!
assertThat: aMethodThatFails failsWithErrorType: errorType thenExecute: aMethodToExecuteOnError"andVerifyThat: c"

	[ aMethodThatFails value.
	self fail ]
		on: errorType
		do: aMethodToExecuteOnError! !

!CustomerBookTest methodsFor: 'testing' stamp: 'AC 9/21/2018 16:56:32'!
setUp

	customerBook := CustomerBook  new.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'AC 9/21/2018 16:57:48'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	self assertExecutionTimeOf: [customerBook addCustomerNamed: 'John Lennon'.] notGreaterThanMilliseconds: 50.
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'AC 9/21/2018 16:57:57'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	|paulMcCartney|

	paulMcCartney := 'Paul McCartney'.
	customerBook addCustomerNamed: paulMcCartney.
	
	self assertExecutionTimeOf: [customerBook removeCustomerNamed: paulMcCartney.] notGreaterThanMilliseconds: 100.
	
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'AC 9/21/2018 17:03:12'!
test03CanNotAddACustomerWithEmptyName 

	self assertThat:[customerBook addCustomerNamed: ''] 
		  failsWithErrorType: Error 
		  thenExecute: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty.]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'AC 9/21/2018 17:03:17'!
test04CanNotRemoveAnInvalidCustomer
	
	|johnLennon|
	
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self assertThat:  [customerBook removeCustomerNamed: 'Paul McCartney'.] 
		  failsWithErrorType: NotFound
		  thenExecute: [ :anError | 
						self assert: customerBook numberOfCustomers = 1.
						self assert: (customerBook includesCustomerNamed: johnLennon) ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Lucas 9/23/2018 00:00:59'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	|paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self assertAmountActiveCustomers: 0 amountSuspendedCustomers: 1 amountCustomers: 1 aMethodCustomerBelongs: [self assert: (customerBook includesCustomerNamed: paulMcCartney).].
	
	
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Lucas 9/23/2018 00:03:30'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| paulMcCartney|

	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assertAmountActiveCustomers: 0 amountSuspendedCustomers: 0 amountCustomers: 0 aMethodCustomerBelongs: [self deny: (customerBook includesCustomerNamed: paulMcCartney).].



	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'AC 9/21/2018 16:58:39'!
test07CanNotSuspendAnInvalidCustomer
	
	| johnLennon |
			
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	[ customerBook suspendCustomerNamed: 'Paul McCartney'.
	self fail ]
		on: CantSuspend 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'AC 9/21/2018 16:58:48'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| johnLennon |

	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	[ customerBook suspendCustomerNamed: johnLennon.
	self fail ]
		on: CantSuspend 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
! !


!CustomerBookTest methodsFor: 'as yet unclassified' stamp: 'AC 9/21/2018 16:47:48'!
assertExecutionTimeOf: methodToBeMeaussured notGreaterThanMilliseconds: timeLimit

	| millisecondsAfterRunning millisecondsBeforeRunning |

	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	methodToBeMeaussured value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < (timeLimit * millisecond)! !


!classDefinition: #CustomerBook category: #'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'customers suspended'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'HAW 9/19/2018 08:40:28'!
includesCustomerNamed: aName

	^(customers includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'HAW 9/19/2018 08:40:38'!
isEmpty
	
	^customers isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NicolasRinaldi 9/16/2018 21:55:33'!
initialize

	super initialize.
	customers := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'HAW 9/19/2018 08:41:11'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((customers includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].
	
	customers add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:57'!
numberOfActiveCustomers
	
	^customers size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NicolasRinaldi 9/16/2018 22:01:43'!
numberOfCustomers
	
	^customers size + suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'HAW 9/19/2018 08:41:50'!
removeCustomerNamed: aName 
 
	1 to: customers size do: 
	[ :index |
		aName = (customers at: index)
			ifTrue: [
				customers removeAt: index.
				^ aName 
			] 
	].

	1 to: suspended size do: 	
	[ :index |
		aName = (suspended at: index)
			ifTrue: [
				suspended removeAt: index.
				^ aName 
			] 
	].
	
	^ NotFound signal.
! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:27:55'!
suspendCustomerNamed: aName 
	
	(customers includes: aName) ifFalse: [^CantSuspend signal].
	
	customers remove: aName.
	
	suspended add: aName
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: #'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/6/2011 17:57'!
customerAlreadyExistsErrorMessage

	^'Customer already exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/6/2011 17:53'!
customerCanNotBeEmptyErrorMessage

	^'Customer name cannot be empty'! !
