!classDefinition: #CartTest category: #TusLibros!
TestCase subclass: #CartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:08'!
test01NewCartsAreCreatedEmpty

	self assert: self createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := self createCart.
	
	self 
		should: [ cart add: self itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := self createCart.
	
	cart add: self itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := self createCart.
	
	self 
		should: [cart add: 0 of: self itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := self createCart.
	
	self 
		should: [cart add: 2 of: self itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test06CartRemembersAddedItems

	| cart |
	
	cart := self createCart.
	
	cart add: self itemSellByTheStore.
	self assert: (cart includes: self itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := self createCart.
	
	self deny: (cart includes: self itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := self createCart.
	
	cart add: 2 of: self itemSellByTheStore.
	self assert: (cart occurrencesOf: self itemSellByTheStore) = 2! !

!CartTest methodsFor: 'tests' stamp: 'AC 11/22/2018 10:43:21'!
test09CartSumarizesCorrectly

	| cart |
	
	cart := self createCart.
	
	cart add: 2 of: self itemSellByTheStore.
	self assert: (cart sumarize ) = (2*self itemSellByTheStorePrice).! !

!CartTest methodsFor: 'tests' stamp: 'AC 11/22/2018 10:45:26'!
test10CartInformsAllItems

	| cart |
	
	cart := self createCart.
	
	cart add: 2 of: self itemSellByTheStore.
	self assert: (cart addedItems occurrencesOf: self itemSellByTheStore) = 2.! !


!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:48'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!CartTest methodsFor: 'support' stamp: 'AC 11/22/2018 10:40:05'!
defaultCatalog
	
	| dict |
	dict _ Dictionary new.
	dict at: self itemSellByTheStore put: self itemSellByTheStorePrice.
	^ dict! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:44'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:43'!
itemSellByTheStore
	
	^ 'validBook'! !

!CartTest methodsFor: 'support' stamp: 'AC 11/22/2018 10:37:33'!
itemSellByTheStorePrice
	
	^ 2.5! !


!classDefinition: #CashierTest category: #TusLibros!
TestCase subclass: #CashierTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'tests' stamp: 'AC 11/22/2018 13:28:52'!
test01CashierDoesNotCheckOutEmptyCart

	| cashier carrito aCreditCard paymentGateway |
	
	paymentGateway := self createEmptyPaymentGatewaySimulator.
	cashier := self createCashierWith: paymentGateway.
	carrito := Cart acceptingItemsOf: self defaultProductList.
	aCreditCard := self createCreditCard.
	
	self should: [cashier checkout: carrito with: aCreditCard.] 
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [:anError |
						self assert: anError messageText = Cashier cantCheckOutEmptyCartErrorMessage.
						self assert: cashier soldItemsCount = 0.
						self assert: paymentGateway correctTransactionsMade = 0.
						self assert: paymentGateway transactionErrorCount = 0.
						self assert: cashier soldAmount = 0.
		]. 
	! !

!CashierTest methodsFor: 'tests' stamp: 'AC 11/22/2018 13:28:52'!
test02CantCheckoutWithExpiredCreditCard

	| cashier carrito aCreditCard paymentGateway |
	
	paymentGateway := self createEmptyPaymentGatewaySimulator.
	
	cashier := self createCashierWith: paymentGateway.
	carrito := Cart acceptingItemsOf: self defaultProductList.
	carrito add: self itemSellByTheStore.
	aCreditCard := self createInvalidCreditCard.
	
	self should: [cashier checkout: carrito with: aCreditCard.] 
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [:anError |
						self assert: anError messageText = Cashier cantCheckOutWIthExpiredCardErrorMessage.
						self assert: cashier soldItemsCount  = 0.
						self assert: paymentGateway correctTransactionsMade = 0.
						self assert: paymentGateway transactionErrorCount  = 0.
						self assert: cashier soldAmount = 0.
		]. 
	! !

!CashierTest methodsFor: 'tests' stamp: 'AC 11/22/2018 13:28:52'!
test03CashierCheckoutsCorrectlyWithOneItem

	| cashier carrito ticket paymentGateway creditCard |
	
	creditCard _ self createCreditCard.
	
	paymentGateway := self createEmptyPaymentGatewaySimulator.
	paymentGateway addCreditCard: creditCard withFounds: (10 + self itemSellByTheStorePrice).
	
	cashier := self createCashierWith: paymentGateway.
	carrito := Cart acceptingItemsOf: self defaultProductList.
	carrito add: self itemSellByTheStore.
	
	ticket := cashier checkout: carrito with: creditCard.
	
	self assert: (ticket value) equals: self itemSellByTheStorePrice.
	self assert: cashier soldItemsCount = 1.
	self assert: cashier soldAmount = self itemSellByTheStorePrice.
	self assert: (cashier hasSold: 1 of: self itemSellByTheStore ). 
	self assert: paymentGateway correctTransactionsMade = 1.
	self assert: paymentGateway debitedTotal = (ticket value).
	self assert: (paymentGateway debitedAmountFrom: creditCard ) = self itemSellByTheStorePrice.! !

!CashierTest methodsFor: 'tests' stamp: 'AC 11/22/2018 13:28:52'!
test04CashierCheckoutsCorrectlyWithMultipleEqualsItems

	| cashier carrito ticket paymentGateway creditCard totalPrice |
	
	totalPrice := 2*self itemSellByTheStorePrice.
	creditCard := self createCreditCard .
	
	paymentGateway := self createEmptyPaymentGatewaySimulator.
	paymentGateway addCreditCard: creditCard withFounds: (10 + totalPrice).
	
	cashier := self createCashierWith: paymentGateway.
	carrito := Cart acceptingItemsOf: self defaultProductList.
	carrito add: 2 of: self itemSellByTheStore.
	
	ticket := cashier checkout: carrito with: creditCard.
	
	self assert: (ticket value) equals: totalPrice.
	self assert: cashier soldItemsCount  = 2.
	self assert: cashier soldAmount = totalPrice.
	self assert: (cashier hasSold: 2 of: self itemSellByTheStore ).
	self assert: paymentGateway transactionErrorCount  = 0.
	self assert: paymentGateway correctTransactionsMade  = 1.
	self assert: (paymentGateway debitedAmountFrom: creditCard ) = totalPrice.! !

!CashierTest methodsFor: 'tests' stamp: 'AC 11/22/2018 13:28:52'!
test05CashierCheckoutsCorrectlyWithDifferentItems

	| cashier carrito ticket totalPrice creditCard paymentGateway |
	
	totalPrice := ((2*self itemSellByTheStorePrice) + (3 * self anotherItemSellByTheStorePrice)).
	creditCard := self createCreditCard.
	
	paymentGateway := self createEmptyPaymentGatewaySimulator.
	paymentGateway addCreditCard: creditCard withFounds: (totalPrice +10).
	
	cashier := self createCashierWith: paymentGateway .
	carrito := Cart acceptingItemsOf: self defaultProductList.
	carrito add: 2 of: self itemSellByTheStore.
	carrito add: 3 of: self anotherItemSellByTheStore.
	
	ticket := cashier checkout: carrito with: creditCard.
	
	self assert: (ticket value) equals: totalPrice.
	self assert: cashier soldItemsCount = 5.
	self assert: (cashier  hasSold: 2 of: self itemSellByTheStore ).
	self assert: (cashier  hasSold: 3 of: self anotherItemSellByTheStore ).
	self assert: paymentGateway debitedTotal =  totalPrice .
	self assert: paymentGateway correctTransactionsMade = 1.
	self assert: (paymentGateway debitedAmountFrom: creditCard) = totalPrice.
	! !

!CashierTest methodsFor: 'tests' stamp: 'AC 11/22/2018 13:28:52'!
test06CashierDebitsCorrectAmountFromCorrectCreditCard

	| cashier carrito ticket cartPrice creditCard paymentGateway totalPrice otroCarrito anotherCreditCard anotherTicket |
	
	cartPrice := ((2*self itemSellByTheStorePrice) + (3 * self anotherItemSellByTheStorePrice)).
	creditCard := self createCreditCard.
	anotherCreditCard := self createAnotherCreditCard .
	
	paymentGateway := self createEmptyPaymentGatewaySimulator.
	paymentGateway addCreditCard: creditCard withFounds: (cartPrice +10).
	paymentGateway addCreditCard: anotherCreditCard withFounds: (cartPrice +10).
	
	cashier := self createCashierWith: paymentGateway .
	carrito := Cart acceptingItemsOf: self defaultProductList.
	carrito add: 2 of: self itemSellByTheStore.
	carrito add: 3 of: self anotherItemSellByTheStore.
	
	otroCarrito := carrito copy.
	
	totalPrice  := 2*cartPrice .
	
	ticket := cashier checkout: carrito with: creditCard.
	anotherTicket := cashier checkout: otroCarrito with: anotherCreditCard .
	
	self assert: (ticket value) equals: cartPrice.
	self assert: (anotherTicket value) equals: cartPrice.
	self assert: cashier soldItemsCount = 10.
	self assert: cashier soldAmount = totalPrice .
	self assert: (cashier  hasSold: 4 of: self itemSellByTheStore ).
	self assert: (cashier  hasSold: 6 of: self anotherItemSellByTheStore ).
	self assert: paymentGateway debitedTotal =  totalPrice .
	self assert: paymentGateway correctTransactionsMade = 2.
	self assert: (paymentGateway debitedAmountFrom: creditCard) = cartPrice.
	self assert: (paymentGateway debitedAmountFrom: anotherCreditCard ) = cartPrice.
	! !

!CashierTest methodsFor: 'tests' stamp: 'AC 11/22/2018 13:28:52'!
test07CashierDoesNotCheckoutWhenThereArentEnoughFounds

	| cashier carrito totalPrice creditCard paymentGateway |
	
	totalPrice := ((2*self itemSellByTheStorePrice) + (3 * self anotherItemSellByTheStorePrice)).
	creditCard := self createCreditCard.
	
	paymentGateway := self createEmptyPaymentGatewaySimulator.
	paymentGateway addCreditCard: creditCard withFounds: (totalPrice - 10).
	
	cashier := self createCashierWith: paymentGateway .
	carrito := Cart acceptingItemsOf: self defaultProductList.
	carrito add: 2 of: self itemSellByTheStore.
	carrito add: 3 of: self anotherItemSellByTheStore.
	
	self should: [cashier checkout: carrito with: creditCard.]
	raise:  Error - MessageNotUnderstood
	withExceptionDo: [:anError | 
				self assert: anError messageText = cashier notEnoughFoundsErrorMessage.
				self assert: cashier soldItemsCount  = 0.
				self assert: cashier soldAmount  = 0.
				self assert: (paymentGateway debitedAmountFrom: creditCard)  = 0.
				self assert: (paymentGateway remainingFoundsFor: creditCard) = (totalPrice - 10).
	] ! !


!CashierTest methodsFor: 'support' stamp: 'AC 11/22/2018 09:52:19'!
anotherItemSellByTheStore
	
	^ 'anotherValidBook'! !

!CashierTest methodsFor: 'support' stamp: 'AC 11/22/2018 13:37:43'!
anotherItemSellByTheStorePrice
	
	^ 15.50! !

!CashierTest methodsFor: 'support' stamp: 'AC 11/22/2018 10:07:59'!
createAnotherCreditCard
	
	^CreditCard with: 4712184367762582 owner: 'Nicolas Ariel Perez' expirationMonthOfYear: GregorianMonthOfYear current.! !

!CashierTest methodsFor: 'support' stamp: 'AC 11/22/2018 11:03:27'!
createCashierWith: aPaymentGateway

	^Cashier withPaymentGateway: aPaymentGateway .! !

!CashierTest methodsFor: 'support' stamp: 'AC 11/22/2018 10:07:59'!
createCreditCard
	
	^CreditCard with: 4812184367762574 owner: 'Claudio Matias Perez' expirationMonthOfYear: GregorianMonthOfYear current.! !

!CashierTest methodsFor: 'support' stamp: 'AC 11/22/2018 12:41:48'!
createEmptyPaymentGatewaySimulator
	
	^PaymentGatewaySimulator empty.! !

!CashierTest methodsFor: 'support' stamp: 'AC 11/22/2018 10:07:59'!
createInvalidCreditCard
	
	| currentMonthAndYear |
	currentMonthAndYear _ GregorianMonthOfYear current.
	^CreditCard with: 4812184367762575 owner: 'Don Ramon' expirationMonthOfYear: (currentMonthAndYear previousMonth: (currentMonthAndYear month)).! !

!CashierTest methodsFor: 'support' stamp: 'AC 11/22/2018 13:29:12'!
defaultProductList
	
	| dict |
	dict _ Dictionary new.
	dict at: self itemSellByTheStore put: self itemSellByTheStorePrice.
	dict at: self anotherItemSellByTheStore put: self anotherItemSellByTheStorePrice.
	^ dict! !

!CashierTest methodsFor: 'support' stamp: 'AC 11/15/2018 18:32:07'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!CashierTest methodsFor: 'support' stamp: 'AC 11/15/2018 18:32:16'!
itemSellByTheStore
	
	^ 'validBook'! !

!CashierTest methodsFor: 'support' stamp: 'AC 11/22/2018 13:37:49'!
itemSellByTheStorePrice
	
	^ 10.23652! !


!classDefinition: #PaymentGatewaySimulatorTest category: #TusLibros!
TestCase subclass: #PaymentGatewaySimulatorTest
	instanceVariableNames: 'creditCardValues transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!PaymentGatewaySimulatorTest methodsFor: 'tests support' stamp: 'AC 11/22/2018 11:26:52'!
createCreditCard
	
	^CreditCard with: 4812184367762574 owner: 'Claudio Matias Perez' expirationMonthOfYear: GregorianMonthOfYear current.! !

!PaymentGatewaySimulatorTest methodsFor: 'tests support' stamp: 'AC 11/22/2018 11:33:55'!
createEmptyPaymentGatewaySimulator
	
	^PaymentGatewaySimulator empty.! !

!PaymentGatewaySimulatorTest methodsFor: 'tests support' stamp: 'AC 11/22/2018 11:27:19'!
createInvalidCreditCard
	
	| currentMonthAndYear |
	currentMonthAndYear _ GregorianMonthOfYear current.
	^CreditCard with: 4812184367762575 owner: 'Don Ramon' expirationMonthOfYear: (currentMonthAndYear previousMonth: (currentMonthAndYear month)).! !

!PaymentGatewaySimulatorTest methodsFor: 'tests support' stamp: 'AC 11/22/2018 11:30:12'!
createPaymentGatewaySimulator
	
	| creditCardValues |
	
	creditCardValues := Dictionary new.
		
	creditCardValues at: (self createCreditCard) put: 100.00.
	
	^PaymentGatewaySimulator withCreditCards: (creditCardValues).! !

!PaymentGatewaySimulatorTest methodsFor: 'tests support' stamp: 'AC 11/22/2018 11:30:57'!
createUnregisteredCreditCard
	
	^CreditCard with: 4712184367762582 owner: 'Nicolas Ariel Perez' expirationMonthOfYear: GregorianMonthOfYear current.! !


!PaymentGatewaySimulatorTest methodsFor: 'tests' stamp: 'AC 11/22/2018 13:27:40'!
test01ThereArentAnyTransactionsWhenCreated

	| paymentGateway |
	paymentGateway _ self createEmptyPaymentGatewaySimulator.
	self assert: paymentGateway correctTransactionsMade = 0.
	self assert: paymentGateway transactionErrorCount = 0.
	self assert: paymentGateway debitedTotal = 0.! !

!PaymentGatewaySimulatorTest methodsFor: 'tests' stamp: 'AC 11/22/2018 13:27:55'!
test02CantDebitFromUnregisteredCreditCard

	| paymentGateway unregisteredCreditCard |
	paymentGateway _ self createEmptyPaymentGatewaySimulator.
	unregisteredCreditCard _ self createUnregisteredCreditCard.
	
	
	self should: [paymentGateway debit: 100 from: unregisteredCreditCard ] 
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [:anError | 
						self assert: anError messageText = paymentGateway unregisteredCreditCardErrorMessage.
						self assert: paymentGateway correctTransactionsMade = 0.
						self assert: paymentGateway transactionErrorCount = 1.
						self assert: (paymentGateway debitedAmountFrom: unregisteredCreditCard ) = 0].! !

!PaymentGatewaySimulatorTest methodsFor: 'tests' stamp: 'AC 11/22/2018 12:08:42'!
test03CantDebitFromCreditCardWithInsuficientFounds

	| paymentGateway creditCard |
	creditCard _ self createCreditCard.
	paymentGateway _ self createEmptyPaymentGatewaySimulator.
	paymentGateway addCreditCard: creditCard withFounds: 100.

	self should: [paymentGateway debit: 110 from: creditCard ] 
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [:anError | 
						self assert: anError messageText = paymentGateway notEnoughFoundsErrorMessage.
						self assert: paymentGateway correctTransactionsMade = 0.
						self assert: paymentGateway transactionErrorCount = 1.
						self assert: (paymentGateway debitedAmountFrom: creditCard) = 0.
						].! !

!PaymentGatewaySimulatorTest methodsFor: 'tests' stamp: 'AC 11/22/2018 12:21:09'!
test04CanDebitFromRegisteredCardWithFounds

	| paymentGateway creditCard |
	creditCard _ self createCreditCard.
	paymentGateway _ self createEmptyPaymentGatewaySimulator.
	paymentGateway addCreditCard: creditCard withFounds: 110.

	paymentGateway debit: 50 from: creditCard.
	
	self assert: paymentGateway correctTransactionsMade= 1.
	self assert: paymentGateway transactionErrorCount = 0.
	self assert: paymentGateway debitedTotal = 50.
	self assert: (paymentGateway debitedAmountFrom: creditCard) = 50.
	self assert: (paymentGateway remainingFoundsFor: creditCard) = 60.! !

!PaymentGatewaySimulatorTest methodsFor: 'tests' stamp: 'AC 11/22/2018 12:34:34'!
test05CantDebitFromExpiredDebitCard

	| paymentGateway creditCard |
	creditCard _ self createInvalidCreditCard.
	paymentGateway _ self createEmptyPaymentGatewaySimulator.
	paymentGateway addCreditCard: creditCard withFounds: 110.

	self should: [paymentGateway debit: 50 from: creditCard ] 
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [:anError | 
						self assert: anError messageText = paymentGateway expiredCreditCardErrorMessage.
						self assert: paymentGateway correctTransactionsMade = 0.
						self assert: paymentGateway transactionErrorCount = 1.
						self assert: (paymentGateway debitedAmountFrom: creditCard) = 0.
						].! !


!classDefinition: #Cart category: #TusLibros!
Object subclass: #Cart
	instanceVariableNames: 'items priceList'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidItemErrorMessage
	
	^'Item is not in catalog'! !

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidQuantityErrorMessage
	
	^'Invalid number of items'! !


!Cart methodsFor: 'assertions' stamp: 'AC 11/22/2018 10:36:16'!
assertIsValidItem: anItem

	(priceList includesKey: anItem) ifFalse: [ self error: self invalidItemErrorMessage ]! !

!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 17:51'!
assertIsValidQuantity: aQuantity

	aQuantity strictlyPositive ifFalse: [ self error: self invalidQuantityErrorMessage ]! !


!Cart methodsFor: 'initialization' stamp: 'AC 11/22/2018 10:33:47'!
initializeAcceptingItemsOf: aPriceList

	priceList := aPriceList.
	items := OrderedCollection new.! !


!Cart methodsFor: 'queries' stamp: 'AC 11/22/2018 10:44:40'!
addedItems

	| addedItems |
	addedItems _ Bag new.
	addedItems addAll: items.
	^addedItems.! !

!Cart methodsFor: 'queries' stamp: 'HernanWilkinson 6/17/2013 17:45'!
occurrencesOf: anItem

	^items occurrencesOf: anItem  ! !

!Cart methodsFor: 'queries' stamp: 'AC 11/22/2018 10:42:06'!
sumarize

	| price |
	
	price _ 0.
	items do: [:anItem | price _ price + (priceList at: anItem)].
	
	^price .! !


!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
includes: anItem

	^items includes: anItem ! !

!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
isEmpty
	
	^items isEmpty ! !


!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:44'!
add: anItem

	^ self add: 1 of: anItem ! !

!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:51'!
add: aQuantity of: anItem

	self assertIsValidQuantity: aQuantity.
	self assertIsValidItem: anItem.

	1 to: aQuantity do: [ :aNumber | items add: anItem ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'AC 11/22/2018 10:28:13'!
acceptingItemsOf: aPriceList

	^self new initializeAcceptingItemsOf: aPriceList ! !


!classDefinition: #Cashier category: #TusLibros!
Object subclass: #Cashier
	instanceVariableNames: 'soldItems paymentGateway soldAmount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'initialization' stamp: 'AC 11/22/2018 12:47:24'!
initializeWith: aPaymentGateway

	paymentGateway := aPaymentGateway.
	soldItems := OrderedCollection new.
	soldAmount := 0.! !


!Cashier methodsFor: 'operations' stamp: 'AC 11/22/2018 13:25:33'!
checkout: aCart with: aCreditCard

	| total |
	self assertCartIsNotEmpty: aCart.
	self assertCreditCardIsNotExpired: aCreditCard.
	
	total _ aCart sumarize.

	[paymentGateway debit: total from: aCreditCard] 
	on: Error - MessageNotUnderstood  
	do: [:anError | 
		anError messageText = paymentGateway notEnoughFoundsErrorMessage   "Estos ifs prodrían reemplazarse haciendo una clase de error específica, pero a esta instacia al menos, lo consideramos sobrediseño"
			ifTrue: [self error: self notEnoughFoundsErrorMessage ]
			ifFalse: [self error:  anError messageText ].	
	].
	
	soldItems addAll: aCart addedItems .
	soldAmount _ soldAmount + total.
	^total! !


!Cashier methodsFor: 'assertions' stamp: 'AC 11/22/2018 13:23:06'!
assertCartIsNotEmpty: aCart
	
	aCart isEmpty ifTrue: [self error: self class cantCheckOutEmptyCartErrorMessage].! !

!Cashier methodsFor: 'assertions' stamp: 'AC 11/22/2018 13:24:04'!
assertCreditCardIsNotExpired: aCreditCard

	aCreditCard expiration < GregorianMonthOfYear current ifTrue: [self error: self class cantCheckOutWIthExpiredCardErrorMessage].! !


!Cashier methodsFor: 'evaluating' stamp: 'AC 11/22/2018 13:30:02'!
hasSold: aQuantity of: anItem

	^(soldItems occurrencesOf: anItem ) = aQuantity! !

!Cashier methodsFor: 'evaluating' stamp: 'AC 11/22/2018 12:46:51'!
soldAmount
	
	^soldAmount! !

!Cashier methodsFor: 'evaluating' stamp: 'AC 11/22/2018 10:19:49'!
soldItemsCount
	
	^soldItems size.! !


!Cashier methodsFor: 'error messages' stamp: 'AC 11/22/2018 13:17:25'!
notEnoughFoundsErrorMessage
	
	^'There arent enough founds for checking out this cart'.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #TusLibros!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'errorMessage' stamp: 'AC 11/15/2018 18:35:57'!
cantCheckOutEmptyCartErrorMessage
	
	^'Cant check out of empty cart'! !

!Cashier class methodsFor: 'errorMessage' stamp: 'Lucas 11/19/2018 23:11:35'!
cantCheckOutWIthExceededAmountTransaccionErrorMessage
	
	^'Cant check out with a amount transaccion of over 15 digits for the integer part'! !

!Cashier class methodsFor: 'errorMessage' stamp: 'Lucas 11/19/2018 22:52:20'!
cantCheckOutWIthExceededLengthCreditCardOwnerErrorMessage
	
	^'Cant check out with a name of over 30 characters'! !

!Cashier class methodsFor: 'errorMessage' stamp: 'AC 11/15/2018 18:43:27'!
cantCheckOutWIthExpiredCardErrorMessage
	
	^'Credit card has expired.'! !


!Cashier class methodsFor: 'class initialization' stamp: 'AC 11/22/2018 11:01:54'!
withPaymentGateway: aPaymentGateway

	^self new initializeWith: aPaymentGateway.! !

!Cashier class methodsFor: 'class initialization' stamp: 'AC 11/15/2018 19:14:23'!
withProductList: aProductList

	^self new initializeWith: aProductList.! !


!classDefinition: #CreditCard category: #TusLibros!
Object subclass: #CreditCard
	instanceVariableNames: 'number owner monthAndYear'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'initialization' stamp: 'AC 11/22/2018 10:06:41'!
initializeWith: aCreditCardNumber owner: aName expirationMonthOfYear: aMonthOfYear.

	monthAndYear := aMonthOfYear.
	number:= aCreditCardNumber.
	owner := aName.! !


!CreditCard methodsFor: 'testing' stamp: 'AC 11/22/2018 09:49:12'!
expiration

	^monthAndYear ! !

!CreditCard methodsFor: 'testing' stamp: 'Lucas 11/19/2018 22:32:25'!
number

	^number! !

!CreditCard methodsFor: 'testing' stamp: 'Lucas 11/19/2018 22:31:38'!
owner

	^owner ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: #TusLibros!
CreditCard class
	instanceVariableNames: 'number'!

!CreditCard class methodsFor: 'class initialization' stamp: 'AC 11/22/2018 10:07:59'!
with: aCreditCardNumber owner: aName expirationMonthOfYear: aMonthOfYear

	^self new initializeWith: aCreditCardNumber owner: aName expirationMonthOfYear: aMonthOfYear.! !


!classDefinition: #PaymentGateway category: #TusLibros!
Object subclass: #PaymentGateway
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!PaymentGateway methodsFor: 'error messages' stamp: 'AC 11/22/2018 12:36:46'!
expiredCreditCardErrorMessage

	^'Expired Credit Card'! !

!PaymentGateway methodsFor: 'error messages' stamp: 'AC 11/22/2018 12:33:11'!
notEnoughFoundsErrorMessage

	^'Not enough founds for transaction'! !


!PaymentGateway methodsFor: 'operations' stamp: 'AC 11/22/2018 12:32:55'!
debit: anAmount from: aCreditCard

	^self subclassResponsibility .! !


!classDefinition: #PaymentGatewaySimulator category: #TusLibros!
PaymentGateway subclass: #PaymentGatewaySimulator
	instanceVariableNames: 'creditCardValues transactions transactionErrors debitedTotal correctTransactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!PaymentGatewaySimulator methodsFor: 'initialization' stamp: 'AC 11/22/2018 12:14:10'!
initializeWith: aCreditCardValues

	creditCardValues := aCreditCardValues.
	transactionErrors := 0.
	correctTransactions := 0.
	transactions := Bag new. ! !


!PaymentGatewaySimulator methodsFor: 'configuration' stamp: 'AC 11/22/2018 12:07:44'!
addCreditCard: aCreditCard withFounds: foundsAmount

	creditCardValues at: aCreditCard put: foundsAmount.! !


!PaymentGatewaySimulator methodsFor: 'assertions' stamp: 'AC 11/22/2018 13:34:43'!
assertCreditCard: aCreditCard hasEnoughFoundsFor: anAmount

	((creditCardValues at: aCreditCard ) < anAmount) ifTrue: [transactionErrors  _ transactionErrors + 1. self error: self notEnoughFoundsErrorMessage].! !

!PaymentGatewaySimulator methodsFor: 'assertions' stamp: 'AC 11/22/2018 13:32:35'!
assertCreditCardIsNotExpired: aCreditCard
	
	aCreditCard expiration < GregorianMonthOfYear current ifTrue:[transactionErrors _ transactionErrors + 1. self error: self expiredCreditCardErrorMessage].! !

!PaymentGatewaySimulator methodsFor: 'assertions' stamp: 'AC 11/22/2018 13:33:16'!
assertCreditCardIsRegistered: aCreditCard
	
	(creditCardValues includesKey: aCreditCard) ifFalse: [transactionErrors _ transactionErrors + 1. self error: self unregisteredCreditCardErrorMessage].! !


!PaymentGatewaySimulator methodsFor: 'evaluating' stamp: 'AC 11/22/2018 12:14:19'!
correctTransactionsMade
	
	^correctTransactions ! !

!PaymentGatewaySimulator methodsFor: 'evaluating' stamp: 'AC 11/22/2018 12:14:41'!
debitedAmountFrom: aCreditCard 
	

	^transactions occurrencesOf: aCreditCard.! !

!PaymentGatewaySimulator methodsFor: 'evaluating' stamp: 'AC 11/22/2018 12:30:01'!
debitedTotal

	^transactions size.! !

!PaymentGatewaySimulator methodsFor: 'evaluating' stamp: 'AC 11/22/2018 12:29:33'!
remainingFoundsFor: aCreditCard 
	
	^creditCardValues at: aCreditCard.! !

!PaymentGatewaySimulator methodsFor: 'evaluating' stamp: 'AC 11/22/2018 11:45:45'!
transactionErrorCount
	
	^transactionErrors! !


!PaymentGatewaySimulator methodsFor: 'operations' stamp: 'AC 11/22/2018 13:34:34'!
debit: anAmount from: aCreditCard 
	
	| currentFounds |
	
	self assertCreditCardIsNotExpired: aCreditCard.
	self assertCreditCardIsRegistered: aCreditCard.
	self assertCreditCard: aCreditCard hasEnoughFoundsFor: anAmount.
	
	transactions add: aCreditCard withOccurrences: anAmount.
	correctTransactions _ correctTransactions + 1.
	
	currentFounds _ creditCardValues at: aCreditCard.
	creditCardValues at: aCreditCard put: currentFounds  - anAmount.
	
	^anAmount.! !


!PaymentGatewaySimulator methodsFor: 'error messages' stamp: 'AC 11/22/2018 11:44:47'!
unregisteredCreditCardErrorMessage
	
	^'Credit card not registered'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PaymentGatewaySimulator class' category: #TusLibros!
PaymentGatewaySimulator class
	instanceVariableNames: ''!

!PaymentGatewaySimulator class methodsFor: 'initialization' stamp: 'AC 11/22/2018 11:34:16'!
empty

	^self new initializeWith: (Dictionary new).! !

!PaymentGatewaySimulator class methodsFor: 'initialization' stamp: 'AC 11/22/2018 11:25:22'!
withCreditCards: creditCardsValues

	^self new initializeWith: creditCardsValues.! !
