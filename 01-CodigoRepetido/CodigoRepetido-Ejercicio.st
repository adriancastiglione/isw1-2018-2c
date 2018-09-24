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
	instanceVariableNames: 'customerBook johnLennon paulMcCartney'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!
	
!CustomerBookTest methodsFor: 'testing' stamp: 'Lucas 9/23/2018 21:21:38'!
notChangeAmountAndNameOfCustomerWithErrorTypeCantSuspendIfAssertThat: aMethodThatFails		
		
	self assertThat:[aMethodThatFails value] 
		  failsWithErrorType: CantSuspend 
		  thenExecute: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon).]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'AC 9/23/2018 20:06:10'!
setUp

	customerBook := CustomerBook  new.
	johnLennon := 'John Lennon'.
	paulMcCartney := 'Paul McCartney'.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'AC 9/23/2018 20:06:20'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	self assertExecutionTimeOf: [customerBook addCustomerNamed: johnLennon .] notGreaterThanMilliseconds: 50.
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'AC 9/23/2018 20:06:32'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

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

!CustomerBookTest methodsFor: 'testing' stamp: 'AC 9/23/2018 20:06:51'!
test04CanNotRemoveAnInvalidCustomer

	customerBook addCustomerNamed: johnLennon.
	
	self assertThat:  [customerBook removeCustomerNamed: paulMcCartney .] 
		  failsWithErrorType: NotFound
		  thenExecute: [ :anError | 
						self assert: customerBook numberOfCustomers = 1.
						self assert: (customerBook includesCustomerNamed: johnLennon) ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'AC 9/23/2018 20:08:33'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	self addIntoBookAndSuspendCustomerNamed: paulMcCartney.
	self assertOnCustomersBookActiveCountEquals: 0 andSuspendedCountEquals: 1 andTotalCountEquals: 1 andIncludesCustomerNamed: paulMcCartney 
	
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'AC 9/23/2018 20:08:33'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	self addIntoBookAndSuspendCustomerNamed:  paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assertOnCustomersBookActiveCountEquals: 0 andSuspendedCountEquals: 0 andTotalCountEquals: 0 andDoesNotIncludeCustomerNamed: paulMcCartney.



	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Lucas 9/23/2018 21:22:25'!
test07CanNotSuspendAnInvalidCustomer
	
	self addIntoBookCustomerNamed: johnLennon.
	
	self notChangeAmountAndNameOfCustomerWithErrorTypeCantSuspendIfAssertThat: [customerBook suspendCustomerNamed: 'Paul McCartney'.]

! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Lucas 9/23/2018 21:22:30'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	self addIntoBookAndSuspendCustomerNamed: johnLennon.
	
	self notChangeAmountAndNameOfCustomerWithErrorTypeCantSuspendIfAssertThat: [customerBook suspendCustomerNamed: johnLennon.]
	! !


!CustomerBookTest methodsFor: 'assertions' stamp: 'AC 9/21/2018 16:47:48'!
assertExecutionTimeOf: methodToBeMeaussured notGreaterThanMilliseconds: timeLimit

	| millisecondsAfterRunning millisecondsBeforeRunning |

	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	methodToBeMeaussured value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < (timeLimit * millisecond)! !

!CustomerBookTest methodsFor: 'assertions' stamp: 'AC 9/23/2018 19:56:23'!
assertOnCustomersBookActiveCountEquals: activeCustomersCount andSuspendedCountEquals: suspendedCustomersCount andTotalCountEquals: totalCustomersCount andAssertThat: anAssertionToValue

	self assert: activeCustomersCount equals: customerBook numberOfActiveCustomers.
	self assert: suspendedCustomersCount equals: customerBook numberOfSuspendedCustomers.
	self assert: totalCustomersCount equals: customerBook numberOfCustomers.
	anAssertionToValue value
	
	"
	customerBelongs
		ifTrue: [self assert: (customerBook includesCustomerNamed: 'paulMcCartney').]
		ifFalse: [self deny: (customerBook includesCustomerNamed: 'paulMcCartney').]"
	

	
! !

!CustomerBookTest methodsFor: 'assertions' stamp: 'AC 9/23/2018 19:56:45'!
assertOnCustomersBookActiveCountEquals: activeCustomersCount andSuspendedCountEquals: suspendedCustomersCount andTotalCountEquals: totalCustomersCount andDoesNotIncludeCustomerNamed: aCustomerName
	
	self assertOnCustomersBookActiveCountEquals: activeCustomersCount andSuspendedCountEquals: suspendedCustomersCount andTotalCountEquals: totalCustomersCount andAssertThat: [self deny: (customerBook includesCustomerNamed: aCustomerName).].
		
! !

!CustomerBookTest methodsFor: 'assertions' stamp: 'AC 9/23/2018 19:56:23'!
assertOnCustomersBookActiveCountEquals: activeCustomersCount andSuspendedCountEquals: suspendedCustomersCount andTotalCountEquals: totalCustomersCount andIncludesCustomerNamed: aCustomerName
	
	self assertOnCustomersBookActiveCountEquals: activeCustomersCount andSuspendedCountEquals: suspendedCustomersCount andTotalCountEquals: totalCustomersCount andAssertThat: [self assert: (customerBook includesCustomerNamed: aCustomerName).].
		
! !

!CustomerBookTest methodsFor: 'assertions' stamp: 'AC 9/21/2018 17:03:02'!
assertThat: aMethodThatFails failsWithErrorType: errorType thenExecute: aMethodToExecuteOnError"andVerifyThat: c"

	[ aMethodThatFails value.
	self fail ]
		on: errorType
		do: aMethodToExecuteOnError! !


!CustomerBookTest methodsFor: 'operations' stamp: 'AC 9/23/2018 20:08:33'!
addIntoBookAndSuspendCustomerNamed: aName
	
	customerBook addCustomerNamed: aName.
	customerBook suspendCustomerNamed: aName.! !
	
!CustomerBookTest methodsFor: 'operations' stamp: 'Lucas 9/23/2018 20:46:31'!
addIntoBookCustomerNamed: aName
	
	customerBook addCustomerNamed: aName.! !


!classDefinition: #CustomerBook category: #'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'AC 9/23/2018 20:03:31'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'AC 9/23/2018 20:03:32'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'AC 9/23/2018 20:03:31'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'AC 9/23/2018 20:03:31'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'AC 9/23/2018 20:03:32'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'AC 9/23/2018 20:04:14'!
numberOfCustomers
	
	^self numberOfActiveCustomers + self numberOfSuspendedCustomers! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'AC 9/23/2018 20:03:32'!
removeCustomerNamed: aName 
 
	1 to: active size do: 
	[ :index |
		aName = (active at: index)
			ifTrue: [
				active removeAt: index.
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

!CustomerBook methodsFor: 'customer management' stamp: 'AC 9/23/2018 20:03:31'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
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
