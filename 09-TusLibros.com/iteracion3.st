!classDefinition: #CartTest category: #TusLibros!
TestCase subclass: #CartTest
	instanceVariableNames: 'testObjectsFactory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test01NewCartsAreCreatedEmpty

	self assert: testObjectsFactory createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [ cart add: testObjectsFactory itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: testObjectsFactory itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [cart add: 0 of: testObjectsFactory itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [cart add: 2 of: testObjectsFactory itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test06CartRemembersAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: testObjectsFactory itemSellByTheStore.
	self assert: (cart includes: testObjectsFactory itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self deny: (cart includes: testObjectsFactory itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: 2 of: testObjectsFactory itemSellByTheStore.
	self assert: (cart occurrencesOf: testObjectsFactory itemSellByTheStore) = 2! !


!CartTest methodsFor: 'setup' stamp: 'HernanWilkinson 6/17/2013 18:09'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.! !


!classDefinition: #CashierTest category: #TusLibros!
TestCase subclass: #CashierTest
	instanceVariableNames: 'testObjectsFactory debitBehavior'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:50'!
test01CanNotCheckoutAnEmptyCart

	| salesBook |
	
	salesBook := OrderedCollection new.
	self 
		should: [ Cashier 
			toCheckout: testObjectsFactory createCart 
			charging: testObjectsFactory notExpiredCreditCard 
			throught: self
			on: testObjectsFactory today
			registeringOn:  salesBook ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier cartCanNotBeEmptyErrorMessage.
			self assert: salesBook isEmpty ]! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:51'!
test02CalculatedTotalIsCorrect

	| cart cashier |
	
	cart := testObjectsFactory createCart.
	cart add: 2 of: testObjectsFactory itemSellByTheStore.
	
	cashier :=  Cashier
		toCheckout: cart 
		charging: testObjectsFactory notExpiredCreditCard 
		throught: self
		on: testObjectsFactory today 
		registeringOn: OrderedCollection new.
		
	self assert: cashier checkOut = (testObjectsFactory itemSellByTheStorePrice * 2)! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:51'!
test03CanNotCheckoutWithAnExpiredCreditCart

	| cart salesBook |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	salesBook := OrderedCollection new.
	
	self
		should: [ Cashier 
				toCheckout: cart 
				charging: testObjectsFactory expiredCreditCard 
				throught: self
				on: testObjectsFactory today
				registeringOn: salesBook ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anError messageText = Cashier canNotChargeAnExpiredCreditCardErrorMessage.
			self assert: salesBook isEmpty ]! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 19:04'!
test04CheckoutRegistersASale

	| cart cashier salesBook total |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	salesBook := OrderedCollection new.
 
	cashier:= Cashier 
		toCheckout: cart 
		charging: testObjectsFactory notExpiredCreditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	total := cashier checkOut.
					
	self assert: salesBook size = 1.
	self assert: salesBook first total = total.! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 19:00'!
test05CashierChargesCreditCardUsingMerchantProcessor

	| cart cashier salesBook total creditCard debitedAmout debitedCreditCard  |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	creditCard := testObjectsFactory notExpiredCreditCard.
	salesBook := OrderedCollection new.
 
	cashier:= Cashier 
		toCheckout: cart 
		charging: creditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	debitBehavior := [ :anAmount :aCreditCard | 
		debitedAmout := anAmount.
		debitedCreditCard := aCreditCard ].
	total := cashier checkOut.
					
	self assert: debitedCreditCard = creditCard.
	self assert: debitedAmout = total.! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:59'!
test06CashierDoesNotSaleWhenTheCreditCardHasNoCredit

	| cart cashier salesBook creditCard |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	creditCard := testObjectsFactory notExpiredCreditCard.
	salesBook := OrderedCollection new.
 	debitBehavior := [ :anAmount :aCreditCard | self error: Cashier creditCardHasNoCreditErrorMessage].
	
	cashier:= Cashier 
		toCheckout: cart 
		charging: creditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	self 
		should: [cashier checkOut ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier creditCardHasNoCreditErrorMessage.
			self assert: salesBook isEmpty ]! !


!CashierTest methodsFor: 'setup' stamp: 'HernanWilkinson 6/17/2013 19:03'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.
	debitBehavior := [ :anAmount :aCreditCard | ]! !


!CashierTest methodsFor: 'merchant processor protocol' stamp: 'HernanWilkinson 6/17/2013 19:02'!
debit: anAmount from: aCreditCard 

	^debitBehavior value: anAmount value: aCreditCard ! !


!classDefinition: #RestInterfaceTest category: #TusLibros!
TestCase subclass: #RestInterfaceTest
	instanceVariableNames: 'debitBehavior testObjectsFactory interface id pass cartId validClientsData clock'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!RestInterfaceTest methodsFor: 'tests - cart creation' stamp: 'AC 11/30/2018 14:33:14'!
test01CantCreateCartWithInvalidClientIdOrPassword

	validClientsData := Dictionary new.
	
	self should: [ interface createCartUsingId: self validClientId andPassword: self validPassword.]
	raise: self functionalException
	withExceptionDo: [ :anError | 
		self assert: anError messageText = interface invalidUserOrPasswordErrorMessage.
	].
	
	! !

!RestInterfaceTest methodsFor: 'tests - cart creation' stamp: 'AC 11/27/2018 09:44:19'!
test02CanCreateCartWithValidData

	self assert: (interface listCartWithId: cartId) isEmpty.
	

	! !


!RestInterfaceTest methodsFor: 'tests - adding items to cart' stamp: 'AC 11/30/2018 14:33:02'!
test03CantAddItemsUsingInvalidCartId

	
	self should: [interface addToCart: self invalidCartId theItem: testObjectsFactory itemSellByTheStore withQuantity: 5.] 
		raise: self functionalException 
		withExceptionDo: [ : anError |
			self assert: anError messageText  = interface invalidCartIdErrorMessage.
			self assert: (interface listCartWithId: cartId) isEmpty.
		]

	! !

!RestInterfaceTest methodsFor: 'tests - adding items to cart' stamp: 'AC 11/27/2018 09:50:30'!
test04CantAddItemsUsingInvalidQuantity


	self should: [ interface addToCart: cartId theItem: testObjectsFactory itemSellByTheStore withQuantity: 0] 
		raise: self functionalException 
		withExceptionDo: [ : anError |
			self assert: anError messageText  = interface invalidQuantityErrorMessage.
			self assert: (interface listCartWithId: cartId) isEmpty.
		].
	
	self should: [ interface addToCart: cartId theItem: testObjectsFactory itemSellByTheStore withQuantity: -1] 
		raise: self functionalException 
		withExceptionDo: [ : anError |
			self assert: anError messageText  = interface invalidQuantityErrorMessage.
			self assert: (interface listCartWithId: cartId) isEmpty.
		].
	
	self should: [ interface addToCart: cartId theItem: testObjectsFactory itemSellByTheStore withQuantity: 2.3] 
		raise: self functionalException 
		withExceptionDo: [ : anError |
			self assert: anError messageText  = interface invalidQuantityErrorMessage.
			self assert: (interface listCartWithId: cartId) isEmpty.
		]



	! !

!RestInterfaceTest methodsFor: 'tests - adding items to cart' stamp: 'AC 11/27/2018 09:50:59'!
test05CantAddInvalidItemToCart

	self should: [ interface addToCart: cartId theItem: testObjectsFactory itemNotSellByTheStore withQuantity: 1] 
		raise: self functionalException 
		withExceptionDo: [ : anError |
			self assert: anError messageText  = interface invalidItemErrorMessage.
			self assert: (interface listCartWithId: cartId) isEmpty.
		]

	! !

!RestInterfaceTest methodsFor: 'tests - adding items to cart' stamp: 'AC 11/30/2018 14:17:50'!
test06ItemsCanBeAddedToCartUsingCorrectParameters

	| anotherValidCartId addedItems theItem |

	theItem := testObjectsFactory itemSellByTheStore.
	anotherValidCartId := interface createCartUsingId: self validClientId andPassword: self validPassword.
	
	interface addToCart: cartId theItem: theItem withQuantity: 2.
	addedItems := interface listCartWithId: cartId. 
	
	self assert: (addedItems includes: theItem).
	self assert: (addedItems occurrencesOf: theItem) equals: 2.
	self assert: (interface listCartWithId: anotherValidCartId) isEmpty.
	
	! !

!RestInterfaceTest methodsFor: 'tests - adding items to cart' stamp: 'AC 11/30/2018 21:16:55'!
test18CantAddToCartAfter30Minutes

	interface addToCart: self validCartId theItem: self itemSellByTheStore withQuantity: 1.
	self clock advanceInTime: (Duration minutes: 31).
	
	self should: [interface addToCart: self validCartId theItem: self itemSellByTheStore withQuantity: 1.] 
	raise: self functionalException 
	withExceptionDo: [ :anError |
		self assert: anError messageText = interface cartHasExpiredErrorMessage.
		self clock resetTime.
		self assert: ((interface listCartWithId: self validCartId) occurrencesOf: self itemSellByTheStore) equals: 1.
	].! !

!RestInterfaceTest methodsFor: 'tests - adding items to cart' stamp: 'AC 11/30/2018 21:30:21'!
test19AddingItemsResetsExpirationTimeOfCart

	| itemsInCart |

	3 timesRepeat: [
		interface addToCart: self validCartId theItem: self itemSellByTheStore withQuantity: 1.
		self clock advanceInTime: (Duration minutes: 20).
	].

	itemsInCart := interface listCartWithId: self validCartId .
	self assert: (itemsInCart includes: self itemSellByTheStore).
	self assert: (itemsInCart occurrencesOf: self itemSellByTheStore) equals: 3.! !


!RestInterfaceTest methodsFor: 'tests - checking out' stamp: 'AC 11/28/2018 11:27:19'!
test09CantCheckOutCartWithInvalidCartId

	| expirationDate |

	expirationDate := (Month month: testObjectsFactory today monthIndex year: testObjectsFactory today yearNumber + 1).

	self should: [interface checkoutCartIdentifiedBy: self invalidCartId withCardNumbered: self validCardNumber expiringOn: self validExpirationDate ownedBy: self validOwner.]
		raise: self functionalException 
		withExceptionDo: [ : anError |
			self assert: anError messageText  = interface invalidCartIdErrorMessage.
		]
	
	! !

!RestInterfaceTest methodsFor: 'tests - checking out' stamp: 'AC 11/30/2018 21:31:26'!
test10_01CanCheckOutWithValidData

	| purchases |
	interface addToCart: self validCartId theItem: self itemSellByTheStore withQuantity: 2.
	interface checkoutCartIdentifiedBy: self validCartId withCardNumbered: self validCardNumber expiringOn: self validExpirationDate ownedBy: self validOwner.
	
	purchases := interface listPurchasesOfClient: self validClientId.
	
	self assert: (purchases includes: self itemSellByTheStore ).
	self assert: (purchases occurrencesOf: self itemSellByTheStore) equals: 2.
	self 
		should: [interface listCartWithId: cartId] 
		raise: self functionalException 
		withExceptionDo: [ :anError | 
			self assert: (anError messageText = interface  invalidCartIdErrorMessage).
		].! !

!RestInterfaceTest methodsFor: 'tests - checking out' stamp: 'AC 11/30/2018 21:32:22'!
test10_02CantCheckOutCartAlreadyCheckedOut

	| purchases |
	interface addToCart: self validCartId theItem: self itemSellByTheStore withQuantity: 2.
	interface checkoutCartIdentifiedBy: self validCartId withCardNumbered: self validCardNumber expiringOn: self validExpirationDate ownedBy: self validOwner.
	
	purchases := interface listPurchasesOfClient: self validClientId.
	
	self assert: (purchases includes: self itemSellByTheStore ).
	self assert: (purchases occurrencesOf: self itemSellByTheStore) equals: 2.
	self 
		should: [interface checkoutCartIdentifiedBy: self validCartId withCardNumbered: self validCardNumber expiringOn: self validExpirationDate ownedBy: self validOwner.] 
		raise: self functionalException 
		withExceptionDo: [ :anError | 
			self assert: (anError messageText = interface  invalidCartIdErrorMessage).
		].! !

!RestInterfaceTest methodsFor: 'tests - checking out' stamp: 'AC 11/30/2018 14:21:32'!
test11CheckingOutCartDoesNotAffectOtherCarts

	| purchases otherCartId |
	
	otherCartId := interface createCartUsingId: self anotherClientId andPassword: self anotherValidPassword.
	
	interface addToCart: self validCartId theItem: self itemSellByTheStore withQuantity: 2.
	interface checkoutCartIdentifiedBy: self validCartId withCardNumbered: self validCardNumber expiringOn: self validExpirationDate ownedBy: self validOwner.
	
	purchases := interface listPurchasesOfClient: self validClientId .
	
	self assert: (purchases includes: self itemSellByTheStore ).
	self assert: (purchases occurrencesOf: self itemSellByTheStore) equals: 2.
	self 
		should: [interface listCartWithId: cartId] 
		raise: self functionalException 
		withExceptionDo: [ :anError | 
			self assert: (anError messageText = interface  invalidCartIdErrorMessage).
		].
	self assert: (interface listPurchasesOfClient: self anotherClientId) isEmpty.
	self assert: (interface listCartWithId: otherCartId ) isEmpty .
	! !

!RestInterfaceTest methodsFor: 'tests - checking out' stamp: 'AC 11/28/2018 22:48:22'!
test12CantCheckoutWithExpiredCreditCard

	interface addToCart: self validCartId theItem: self itemSellByTheStore withQuantity: 1.

	self should: [interface checkoutCartIdentifiedBy: self validCartId withCardNumbered: self validCardNumber expiringOn: self expiredDate ownedBy: self validOwner.]
		raise: self functionalException 
		withExceptionDo: [ : anError |
			self assert: anError messageText  = interface canNotChargeAnExpiredCreditCardErrorMessage.
		]
	
	! !

!RestInterfaceTest methodsFor: 'tests - checking out' stamp: 'AC 11/30/2018 11:37:09'!
test13CantCheckoutUsingCreditCardWithNoCredit

	debitBehavior := [ :anAmount :aCreditCard | self error: Cashier creditCardHasNoCreditErrorMessage].

	interface addToCart: self validCartId theItem: self itemSellByTheStore withQuantity: 1.

	self should: [interface checkoutCartIdentifiedBy: self validCartId withCardNumbered: self validCardNumber expiringOn: self validExpirationDate ownedBy: self validOwner.]
		raise: self functionalException 
		withExceptionDo: [ : anError |
			self assert: anError messageText  = interface creditCardHasNoCreditErrorMessage.
		]
	
	! !

!RestInterfaceTest methodsFor: 'tests - checking out' stamp: 'AC 11/30/2018 11:35:32'!
test14CantCheckoutEmptyCart

	self should: [interface checkoutCartIdentifiedBy: self validCartId withCardNumbered: self validCardNumber expiringOn: self validExpirationDate ownedBy: self validOwner.]
		raise: self functionalException 
		withExceptionDo: [ : anError |
			self assert: anError messageText  = interface cartIsEmptyErrorMessage.
		]
	
	! !

!RestInterfaceTest methodsFor: 'tests - checking out' stamp: 'AC 11/30/2018 21:35:45'!
test20CantCheckoutExpiredCart

	interface addToCart: self validCartId theItem: self itemSellByTheStore withQuantity: 1.
	self clock advanceInTime: (Duration minutes: 31).
	
	self should: [interface checkoutCartIdentifiedBy: self validCartId withCardNumbered: self validCardNumber expiringOn: self validExpirationDate ownedBy: self validOwner.] 
	raise: self functionalException 
	withExceptionDo: [ :anError |
		self assert: anError messageText = interface cartHasExpiredErrorMessage.
		self clock resetTime.
		self assert: ((interface listCartWithId: self validCartId) occurrencesOf: self itemSellByTheStore) equals: 1. 
	].! !


!RestInterfaceTest methodsFor: 'tests - listing items' stamp: 'AC 11/27/2018 09:54:50'!
test07CantListCartWithInvalidCartId

	self should: [interface listCartWithId: self invalidCartId.]
		raise: self functionalException 
		withExceptionDo: [ : anError |
			self assert: anError messageText  = interface invalidCartIdErrorMessage.
		]
	! !

!RestInterfaceTest methodsFor: 'tests - listing items' stamp: 'AC 11/30/2018 14:18:46'!
test08ListCartCreatesListWithAllItemsPerCart

	| anotherCartId addedItems addedItemsToSecondCart theItem |
	
	anotherCartId := interface createCartUsingId: self anotherValidClientId andPassword: self anotherValidPassword. 
	theItem := testObjectsFactory itemSellByTheStore.

	interface addToCart: cartId theItem: theItem withQuantity: 2.
	interface addToCart: cartId theItem: theItem withQuantity: 1.
	interface addToCart: anotherCartId theItem: theItem withQuantity: 5.
	
	addedItems := interface listCartWithId: cartId. 
	addedItemsToSecondCart := interface listCartWithId: anotherCartId. 

	self assert: (addedItems includes: theItem).
	self assert: (addedItems occurrencesOf: theItem) equals: 3.
	self assert: (addedItemsToSecondCart includes: theItem).
	self assert: (addedItemsToSecondCart occurrencesOf: theItem) equals: 5.
	
	! !

!RestInterfaceTest methodsFor: 'tests - listing items' stamp: 'AC 11/30/2018 21:37:24'!
test21CantListExpiredCart

	interface addToCart: self validCartId theItem: self itemSellByTheStore withQuantity: 1.
	self clock advanceInTime: (Duration minutes: 31).
	
	self should: [interface listCartWithId: self validCartId] 
	raise: self functionalException 
	withExceptionDo: [ :anError |
		self assert: anError messageText = interface cartHasExpiredErrorMessage.
	].! !

!RestInterfaceTest methodsFor: 'tests - listing items' stamp: 'AC 11/30/2018 21:45:24'!
test22ListingItemsResetsExpirationTimeOfCart

	| itemsList |
	interface addToCart: self validCartId theItem: self itemSellByTheStore withQuantity: 1.

	3 timesRepeat: [
		interface listCartWithId: self validCartId.
		self clock advanceInTime: (Duration minutes: 20).
	].

	itemsList := interface listCartWithId: self validCartId .
	self assert: (itemsList includes: self itemSellByTheStore ).
	self assert: (itemsList occurrencesOf: self itemSellByTheStore ) equals: 1.! !


!RestInterfaceTest methodsFor: 'tests - listing purchases' stamp: 'AC 11/30/2018 14:22:30'!
test15ListPurchasesShowsAllItemsForAllCheckouts

	| purchases |
	3 timesRepeat: 
	[
		| cartId |
		cartId := interface createCartUsingId: self validClientId andPassword: self validPassword.
		interface addToCart: cartId theItem: self itemSellByTheStore withQuantity: 1.
		interface checkoutCartIdentifiedBy: cartId withCardNumbered: self validCardNumber expiringOn: self validExpirationDate ownedBy: self validOwner.
	].

	purchases := interface listPurchasesOfClient: self validClientId .
	self assert: (purchases includes: self itemSellByTheStore ).
	self assert: (purchases occurrencesOf: self itemSellByTheStore ) equals: 3.
	! !

!RestInterfaceTest methodsFor: 'tests - listing purchases' stamp: 'AC 11/30/2018 14:23:23'!
test16ListPurchasesHasCorrectTotal

	| purchases |
	3 timesRepeat: 
	[
		| cartId |
		cartId := interface createCartUsingId: self validClientId andPassword: self validPassword .
		interface addToCart: cartId theItem: self itemSellByTheStore withQuantity: 1.
		interface checkoutCartIdentifiedBy: cartId withCardNumbered: self validCardNumber expiringOn: self validExpirationDate ownedBy: self validOwner.
	].

	purchases := interface listPurchasesOfClient: self validClientId .
	self assert: purchases total equals: (self itemSellByTheStorePrice) * 3	! !

!RestInterfaceTest methodsFor: 'tests - listing purchases' stamp: 'AC 11/30/2018 14:23:52'!
test17CantListPurchasesOfInvalidClient

	validClientsData := Dictionary new.
	
	self should: [interface listPurchasesOfClient: 'anInvalidClientId'.]
	raise: self functionalException 
	withExceptionDo: [:anError | 
		self assert: anError messageText = interface invalidClientIdErrorMessage.
	].! !


!RestInterfaceTest methodsFor: 'support' stamp: 'AC 11/28/2018 22:05:26'!
anotherClientId
	
	^2.! !

!RestInterfaceTest methodsFor: 'support' stamp: 'AC 11/30/2018 14:19:02'!
anotherValidClientId
	
	^2! !

!RestInterfaceTest methodsFor: 'support' stamp: 'AC 11/28/2018 22:05:51'!
anotherValidPassword
	
	^'anotherValidPassword'! !

!RestInterfaceTest methodsFor: 'support' stamp: 'AC 11/30/2018 20:58:08'!
clock
	
	^clock.! !

!RestInterfaceTest methodsFor: 'support' stamp: 'AC 11/30/2018 21:04:49'!
createInterface

	^RestInterface 
		withAuthenticator: self 
		withCatalog: testObjectsFactory defaultCatalog 
		withMerchantProcessor: self 
		withSalesBook: (OrderedCollection new)
		withClock: self clock.
	! !

!RestInterfaceTest methodsFor: 'support' stamp: 'AC 11/28/2018 22:47:19'!
expiredDate
	
	^(Month month: testObjectsFactory today monthIndex year: testObjectsFactory today yearNumber - 1)! !

!RestInterfaceTest methodsFor: 'support' stamp: 'AC 11/22/2018 20:09:35'!
functionalException
	
	^Error - MessageNotUnderstood .! !

!RestInterfaceTest methodsFor: 'support' stamp: 'AC 11/27/2018 09:43:36'!
invalidCartId

	^nil! !

!RestInterfaceTest methodsFor: 'support' stamp: 'AC 11/27/2018 10:45:09'!
itemSellByTheStore
	
	^testObjectsFactory itemSellByTheStore.! !

!RestInterfaceTest methodsFor: 'support' stamp: 'AC 11/30/2018 12:30:26'!
itemSellByTheStorePrice
	
	^testObjectsFactory itemSellByTheStorePrice.! !

!RestInterfaceTest methodsFor: 'support' stamp: 'AC 11/27/2018 10:19:42'!
validCardNumber
	
	^'1234567800113344'! !

!RestInterfaceTest methodsFor: 'support' stamp: 'AC 11/27/2018 10:44:44'!
validCartId

	^cartId! !

!RestInterfaceTest methodsFor: 'support' stamp: 'AC 11/30/2018 14:07:51'!
validClientId
	
	^1! !

!RestInterfaceTest methodsFor: 'support' stamp: 'AC 11/27/2018 10:19:58'!
validExpirationDate
	
	^(Month month: testObjectsFactory today monthIndex year: testObjectsFactory today yearNumber + 1)! !

!RestInterfaceTest methodsFor: 'support' stamp: 'AC 11/27/2018 10:20:13'!
validOwner
	
	^'Juan Perez'! !

!RestInterfaceTest methodsFor: 'support' stamp: 'AC 11/30/2018 14:08:17'!
validPassword
	
	^'validPassword'! !


!RestInterfaceTest methodsFor: 'authentication protocol' stamp: 'AC 11/30/2018 14:20:45'!
idExists: aClientId

	^validClientsData includesKey: aClientId.! !

!RestInterfaceTest methodsFor: 'authentication protocol' stamp: 'AC 11/30/2018 14:17:04'!
isValidId: aClientId andPassword: aPassword

	^(validClientsData includesKey: aClientId) and:[(validClientsData at: aClientId) = aPassword ].

! !


!RestInterfaceTest methodsFor: 'setup' stamp: 'AC 11/30/2018 21:08:37'!
setUp
	
	testObjectsFactory := StoreTestObjectsFactory new.
	
	validClientsData := Dictionary new.
	validClientsData 
		at: (self validClientId) put: (self validPassword);
		at: (self anotherValidClientId) put: (self anotherValidPassword).
	
	clock := ManualClock startingAt: testObjectsFactory today.
	debitBehavior := [ :anAmount :aCreditCard | true].
	
	
	interface _ self createInterface.
	cartId := interface createCartUsingId: self validClientId andPassword: self validPassword .! !


!RestInterfaceTest methodsFor: 'merchant processor protocol' stamp: 'AC 11/28/2018 22:58:18'!
debit: anAmount from: aCreditCard 

	^debitBehavior value: anAmount value: aCreditCard .

! !


!classDefinition: #Cart category: #TusLibros!
Object subclass: #Cart
	instanceVariableNames: 'catalog items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'error messages' stamp: 'AC 11/28/2018 22:40:27'!
invalidItemErrorMessage
	
	^self class invalidItemErrorMessage! !

!Cart methodsFor: 'error messages' stamp: 'AC 11/28/2018 22:39:50'!
invalidQuantityErrorMessage
	
	^self class invalidQuantityErrorMessage! !


!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:06'!
assertIsValidItem: anItem

	(catalog includesKey: anItem) ifFalse: [ self error: self invalidItemErrorMessage ]! !

!Cart methodsFor: 'assertions' stamp: 'AC 11/28/2018 22:43:17'!
assertIsValidQuantity: aQuantity

	(aQuantity strictlyPositive and: [aQuantity isInteger]) ifFalse: [ self error: self invalidQuantityErrorMessage ]! !


!Cart methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 17:48'!
initializeAcceptingItemsOf: aCatalog

	catalog := aCatalog.
	items := OrderedCollection new.! !


!Cart methodsFor: 'queries' stamp: 'AC 11/26/2018 18:34:58'!
listItems

	^Bag new addAll: items .! !

!Cart methodsFor: 'queries' stamp: 'HernanWilkinson 6/17/2013 17:45'!
occurrencesOf: anItem

	^items occurrencesOf: anItem  ! !


!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
includes: anItem

	^items includes: anItem ! !

!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
isEmpty
	
	^items isEmpty ! !


!Cart methodsFor: 'total' stamp: 'HernanWilkinson 6/17/2013 19:09'!
total

	^ items sum: [ :anItem | catalog at: anItem ]! !


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

!Cart class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 17:48'!
acceptingItemsOf: aCatalog

	^self new initializeAcceptingItemsOf: aCatalog ! !


!Cart class methodsFor: 'error messages' stamp: 'AC 11/28/2018 22:40:32'!
invalidItemErrorMessage
	
	^'Item is not in catalog'! !

!Cart class methodsFor: 'error messages' stamp: 'AC 11/28/2018 22:40:05'!
invalidQuantityErrorMessage

	^'Invalid number of items'! !


!classDefinition: #Cashier category: #TusLibros!
Object subclass: #Cashier
	instanceVariableNames: 'cart salesBook merchantProcessor creditCard total'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:08'!
calculateTotal

	total := cart total.
	! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:07'!
createSale

	^ Sale of: total
! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:06'!
debitTotal

	merchantProcessor debit: total from: creditCard.
	! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:06'!
registerSale

	salesBook add: self createSale! !


!Cashier methodsFor: 'checkout' stamp: 'HernanWilkinson 6/17/2013 19:06'!
checkOut

	self calculateTotal.
	self debitTotal.
	self registerSale.

	^ total! !


!Cashier methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:53'!
initializeToCheckout: aCart charging: aCreditCard throught: aMerchantProcessor registeringOn: aSalesBook
	
	cart := aCart.
	creditCard := aCreditCard.
	merchantProcessor := aMerchantProcessor.
	salesBook := aSalesBook! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #TusLibros!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:22'!
assertIsNotEmpty: aCart 
	
	aCart isEmpty ifTrue: [self error: self cartCanNotBeEmptyErrorMessage ]! !

!Cashier class methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:23'!
assertIsNotExpired: aCreditCard on: aDate
	
	(aCreditCard isExpiredOn: aDate) ifTrue: [ self error: self canNotChargeAnExpiredCreditCardErrorMessage ]! !


!Cashier class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 18:51'!
toCheckout: aCart charging: aCreditCard throught: aMerchantProcessor on: aDate registeringOn: aSalesBook
	
	self assertIsNotEmpty: aCart.
	self assertIsNotExpired: aCreditCard on: aDate.
	
	^self new initializeToCheckout: aCart charging: aCreditCard throught: aMerchantProcessor registeringOn: aSalesBook! !


!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 18:21'!
canNotChargeAnExpiredCreditCardErrorMessage
	
	^'Can not charge an expired credit card'! !

!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:56'!
cartCanNotBeEmptyErrorMessage
	
	^'Can not check out an empty cart'! !

!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 19:02'!
creditCardHasNoCreditErrorMessage
	
	^'Credit card has no credit'! !


!classDefinition: #CreditCard category: #TusLibros!
Object subclass: #CreditCard
	instanceVariableNames: 'expiration number ownerName'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 18:39'!
isExpiredOn: aDate 
	
	^expiration start < (Month month: aDate monthIndex year: aDate yearNumber) start ! !


!CreditCard methodsFor: 'initialization' stamp: 'AC 11/28/2018 11:42:37'!
initializeNumbered: aCardNumber expiringOn: aMonth ownedBy: anOwnerName 
	
	expiration := aMonth.
	number := aCardNumber.
	ownerName := anOwnerName .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: #TusLibros!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'instance creation' stamp: 'AC 11/28/2018 11:39:46'!
numbered: aCardNumber expiringOn: aMonth ownedBy: anOwnerName
	
	^self new initializeNumbered: aCardNumber expiringOn: aMonth ownedBy: anOwnerName ! !


!classDefinition: #RestInterface category: #TusLibros!
Object subclass: #RestInterface
	instanceVariableNames: 'authenticator catalog carts nextId salesBook nextTransactionId merchantProcessor clientsId purchases purchasesTotals clock cartTimes'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!RestInterface methodsFor: 'cart creation' stamp: 'AC 11/30/2018 21:11:13'!
createCartUsingId: anId andPassword: aPassword

	| ret |
	(authenticator isValidId: anId andPassword: aPassword) ifFalse: [self error: self invalidUserOrPasswordErrorMessage].
	
	carts at: nextId put: (Cart acceptingItemsOf: catalog).
	cartTimes at: nextId put: (clock now).
	
	ret _ nextId.
	nextId _ nextId + 1.
	
	clientsId at: ret put: anId.
	^ret
	! !


!RestInterface methodsFor: 'error messages' stamp: 'AC 11/28/2018 22:46:36'!
canNotChargeAnExpiredCreditCardErrorMessage
	
	^self class canNotChargeAnExpiredCreditCardErrorMessage! !

!RestInterface methodsFor: 'error messages' stamp: 'AC 11/30/2018 21:14:53'!
cartHasExpiredErrorMessage
	
	^self class cartHasExpiredErrorMessage.! !

!RestInterface methodsFor: 'error messages' stamp: 'AC 11/30/2018 11:33:30'!
cartIsEmptyErrorMessage
	
	^self class cartIsEmptyErrorMessage! !

!RestInterface methodsFor: 'error messages' stamp: 'AC 11/28/2018 22:49:38'!
creditCardHasNoCreditErrorMessage
	
	^self class creditCardHasNoCreditErrorMessage! !

!RestInterface methodsFor: 'error messages' stamp: 'AC 11/22/2018 20:54:12'!
invalidCartIdErrorMessage
	
	^'Invalid cart id'! !

!RestInterface methodsFor: 'error messages' stamp: 'AC 11/30/2018 13:50:01'!
invalidClientIdErrorMessage
	
	^self class invalidClientIdErrorMessage.! !

!RestInterface methodsFor: 'error messages' stamp: 'AC 11/28/2018 22:40:56'!
invalidItemErrorMessage
	
	^self class invalidItemErrorMessage! !

!RestInterface methodsFor: 'error messages' stamp: 'AC 11/28/2018 22:41:50'!
invalidQuantityErrorMessage
	
	^self class invalidQuantityErrorMessage! !

!RestInterface methodsFor: 'error messages' stamp: 'AC 11/22/2018 20:11:50'!
invalidUserOrPasswordErrorMessage
	
	^'Invalid user or password'! !


!RestInterface methodsFor: 'initialization' stamp: 'AC 11/30/2018 21:12:44'!
initialIzeWith: anAuthenticator andCatalog: aCatalog andMerchantProcessor: aMerchantProcessor andSalesBook: aSalesBook withClock: aClock 

	authenticator := anAuthenticator.
	catalog := aCatalog .
	carts := Dictionary new.
	cartTimes := Dictionary new.
	nextId := 1.
	salesBook := aSalesBook.
	nextTransactionId := 1.
	merchantProcessor := aMerchantProcessor.
	clientsId := Dictionary new.
	purchases := Dictionary new.
	purchasesTotals := Dictionary new.
	clock := aClock.! !


!RestInterface methodsFor: 'operations' stamp: 'AC 11/30/2018 21:28:20'!
addToCart: aCartId theItem: anItem withQuantity: aQuantity
	
	(carts includesKey: aCartId) ifFalse: [self error: self invalidCartIdErrorMessage].
	((clock now - (cartTimes at: aCartId)) minutes < 30) ifFalse: [self error: self cartHasExpiredErrorMessage].
	(carts at: aCartId ) add:aQuantity of: anItem .
	cartTimes at: aCartId put: clock now.! !

!RestInterface methodsFor: 'operations' stamp: 'AC 11/30/2018 21:36:30'!
checkoutCartIdentifiedBy: aCartId withCardNumbered: aCardNumber expiringOn: aDate ownedBy: aName 
	
	| today thisMonth cashier ret clientId |
	
	(carts includesKey: aCartId) ifFalse: [self error: self invalidCartIdErrorMessage].
	((clock now - (cartTimes at: aCartId)) minutes < 30) ifFalse: [self error: self cartHasExpiredErrorMessage].
	
	today := Date today .
	thisMonth := (Month month: today monthIndex year: today yearNumber).
	
	cashier := Cashier 
					toCheckout: (carts at: aCartId)
					charging: (CreditCard numbered: aCardNumber expiringOn: aDate ownedBy: aName)
					throught: merchantProcessor
					on: thisMonth
					registeringOn:  salesBook.
		
	
	cashier checkOut.
	
	clientId := (clientsId at: aCartId ).
	(purchases includesKey: clientId) ifTrue:[(purchases at: clientId) addAll: (carts at: aCartId) listItems] ifFalse:[purchases at: clientId put: (carts at: aCartId) listItems ].
	(purchasesTotals includesKey: clientId) ifTrue:[purchasesTotals at: clientId put: (carts at: aCartId) total + (purchasesTotals at: clientId)] ifFalse:[purchasesTotals at: clientId put: (carts at: aCartId) total ].
	carts removeKey: aCartId .
	
	ret := nextTransactionId.
	nextTransactionId _ nextTransactionId + 1.
	^ret.
		
! !

!RestInterface methodsFor: 'operations' stamp: 'AC 11/30/2018 21:40:33'!
listCartWithId: aCartId

	(carts includesKey: aCartId) ifFalse: [self error: self invalidCartIdErrorMessage].
	((clock now - (cartTimes at: aCartId)) minutes < 30) ifFalse: [self error: self cartHasExpiredErrorMessage].
	cartTimes at: aCartId put: clock now.
	^(carts at:aCartId) listItems.
	
	! !

!RestInterface methodsFor: 'operations' stamp: 'AC 11/30/2018 13:57:52'!
listPurchasesOfClient: aClientId

	| items |
	(authenticator idExists: aClientId) ifFalse: [self error: self invalidClientIdErrorMessage].
	items := purchases at: aClientId ifAbsent: [^Ticket empty] copy.
	^Ticket withItems: items summingTotal: (purchasesTotals at: aClientId ).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RestInterface class' category: #TusLibros!
RestInterface class
	instanceVariableNames: ''!

!RestInterface class methodsFor: 'class initialization' stamp: 'AC 11/30/2018 21:05:45'!
withAuthenticator: anAuthenticator withCatalog: aCatalog withMerchantProcessor: aMerchantProcessor withSalesBook: aSalesBook withClock: aClock 

	^self new initialIzeWith: anAuthenticator andCatalog: aCatalog andMerchantProcessor: aMerchantProcessor andSalesBook: aSalesBook withClock: aClock.! !


!RestInterface class methodsFor: 'error messages' stamp: 'AC 11/28/2018 22:46:46'!
canNotChargeAnExpiredCreditCardErrorMessage

	^Cashier canNotChargeAnExpiredCreditCardErrorMessage.! !

!RestInterface class methodsFor: 'error messages' stamp: 'AC 11/30/2018 21:15:31'!
cartHasExpiredErrorMessage
	
	^'This cart has expired due to inactivity. Please create a new cart'.! !

!RestInterface class methodsFor: 'error messages' stamp: 'AC 11/30/2018 11:34:20'!
cartIsEmptyErrorMessage
	
	^Cashier cartCanNotBeEmptyErrorMessage.! !

!RestInterface class methodsFor: 'error messages' stamp: 'AC 11/28/2018 22:49:24'!
creditCardHasNoCreditErrorMessage
	
	^Cashier creditCardHasNoCreditErrorMessage.! !

!RestInterface class methodsFor: 'error messages' stamp: 'AC 11/30/2018 13:55:02'!
invalidClientIdErrorMessage
	
	^'this client id was not found'.! !

!RestInterface class methodsFor: 'error messages' stamp: 'AC 11/28/2018 22:41:15'!
invalidItemErrorMessage

	^Cart invalidItemErrorMessage.! !

!RestInterface class methodsFor: 'error messages' stamp: 'AC 11/28/2018 22:42:00'!
invalidQuantityErrorMessage

	^Cart invalidQuantityErrorMessage.! !


!classDefinition: #Sale category: #TusLibros!
Object subclass: #Sale
	instanceVariableNames: 'total'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Sale methodsFor: 'total' stamp: 'HernanWilkinson 6/17/2013 18:48'!
total
	
	^ total! !


!Sale methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:47'!
initializeTotal: aTotal

	total := aTotal ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sale class' category: #TusLibros!
Sale class
	instanceVariableNames: ''!

!Sale class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 18:47'!
of: aTotal

	"should assert total is not negative or 0!!"
	^self new initializeTotal: aTotal ! !


!classDefinition: #StoreTestObjectsFactory category: #TusLibros!
Object subclass: #StoreTestObjectsFactory
	instanceVariableNames: 'today'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemSellByTheStore
	
	^ 'validBook'! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemSellByTheStorePrice
	
	^10! !


!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'HernanWilkinson 6/17/2013 18:08'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'HernanWilkinson 6/17/2013 18:08'!
defaultCatalog
	
	^ Dictionary new
		at: self itemSellByTheStore put: self itemSellByTheStorePrice;
		yourself ! !


!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'AC 11/28/2018 11:41:30'!
expiredCreditCard
	
	^CreditCard numbered: '1122334455667788' expiringOn: (Month month: today monthIndex year: today yearNumber - 1) ownedBy: 'Juan Perez'! !

!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'AC 11/28/2018 11:42:00'!
notExpiredCreditCard
	
	^CreditCard numbered: '1122334455667788' expiringOn: (Month month: today monthIndex year: today yearNumber + 1) ownedBy: 'Juan Perez'! !


!StoreTestObjectsFactory methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:37'!
initialize

	today := DateAndTime now! !


!StoreTestObjectsFactory methodsFor: 'date' stamp: 'HernanWilkinson 6/17/2013 18:37'!
today
	
	^ today! !


!classDefinition: #Ticket category: #TusLibros!
Object subclass: #Ticket
	instanceVariableNames: 'items total'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Ticket methodsFor: 'initialization' stamp: 'AC 11/30/2018 12:13:58'!
initializeWithItems: anItemCollection summingTotal: totalPrice

	items := anItemCollection.
	total := totalPrice.! !


!Ticket methodsFor: 'queries' stamp: 'AC 11/30/2018 12:15:00'!
includes: anItem

	^items includes: anItem.! !

!Ticket methodsFor: 'queries' stamp: 'AC 11/30/2018 12:28:17'!
isEmpty
	
	^items  isEmpty.! !

!Ticket methodsFor: 'queries' stamp: 'AC 11/30/2018 12:14:46'!
occurrencesOf: anItem

	^items occurrencesOf: anItem.! !

!Ticket methodsFor: 'queries' stamp: 'AC 11/30/2018 12:15:08'!
total

	^total copy.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Ticket class' category: #TusLibros!
Ticket class
	instanceVariableNames: ''!

!Ticket class methodsFor: 'class initialization' stamp: 'AC 11/30/2018 12:18:27'!
empty

	^self new initializeWithItems: Bag new summingTotal: 0.! !

!Ticket class methodsFor: 'class initialization' stamp: 'AC 11/30/2018 12:13:01'!
withItems: anItemCollection summingTotal: total

	^self new initializeWithItems: anItemCollection summingTotal: total. ! !


!classDefinition: #TusLibrosClock category: #TusLibros!
Object subclass: #TusLibrosClock
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TusLibrosClock methodsFor: 'queries' stamp: 'AC 11/30/2018 19:55:01'!
now

	^self subclassResponsibility.! !

!TusLibrosClock methodsFor: 'queries' stamp: 'AC 11/30/2018 19:54:52'!
today
	
	^self subclassResponsibility.! !


!classDefinition: #ManualClock category: #TusLibros!
TusLibrosClock subclass: #ManualClock
	instanceVariableNames: 'startingDateAndTime timeToAdvance'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!ManualClock methodsFor: 'queries' stamp: 'AC 11/30/2018 20:14:15'!
now

	^self currentDateAndTime.! !

!ManualClock methodsFor: 'queries' stamp: 'AC 11/30/2018 20:10:08'!
today
	
	^self currentDateAndTime date.! !


!ManualClock methodsFor: 'setting time' stamp: 'AC 11/30/2018 21:27:38'!
advanceInTime: aTimeDuration

	^timeToAdvance := timeToAdvance + aTimeDuration.! !

!ManualClock methodsFor: 'setting time' stamp: 'AC 11/30/2018 20:57:40'!
resetTime

	^timeToAdvance := Duration zero.! !


!ManualClock methodsFor: 'initialization' stamp: 'AC 11/30/2018 20:13:17'!
initializeStartingAt: initialDateAndTime

	startingDateAndTime := initialDateAndTime .
	timeToAdvance := Duration zero.! !


!ManualClock methodsFor: 'queries - private' stamp: 'AC 11/30/2018 20:10:47'!
currentDateAndTime

	^startingDateAndTime + timeToAdvance! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ManualClock class' category: #TusLibros!
ManualClock class
	instanceVariableNames: ''!

!ManualClock class methodsFor: 'class initialization' stamp: 'AC 11/30/2018 19:56:49'!
startingAt: initialDateAndTime

	^self new initializeStartingAt: initialDateAndTime .! !


!classDefinition: #RealTimeClock category: #TusLibros!
TusLibrosClock subclass: #RealTimeClock
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!RealTimeClock methodsFor: 'queries' stamp: 'AC 11/30/2018 20:14:01'!
now

	^DateAndTime now.! !

!RealTimeClock methodsFor: 'queries' stamp: 'AC 11/30/2018 19:55:55'!
today
	
	^DateAndTime today.! !
