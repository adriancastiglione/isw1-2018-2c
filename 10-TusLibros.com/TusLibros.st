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


!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:48'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:43'!
defaultCatalog
	
	^ Array with: self itemSellByTheStore! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:44'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:43'!
itemSellByTheStore
	
	^ 'validBook'! !


!classDefinition: #CashierTest category: #TusLibros!
TestCase subclass: #CashierTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'tests' stamp: 'AC 11/15/2018 19:16:45'!
test01CashierDoesNotCheckOutEmptyCart

	| cashier carrito aCreditCard |
	cashier := self createCashier.
	carrito := Cart acceptingItemsOf: self defaultCatalog.
	aCreditCard := self createCreditCard.
	
	self should: [cashier checkOut: carrito with: aCreditCard.] 
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [:anError |
						self assert: anError messageText = Cashier cantCheckOutEmptyCartErrorMessage.
		]. 
	! !

!CashierTest methodsFor: 'tests' stamp: 'AC 11/15/2018 19:16:52'!
test02CantCheckoutWithExpiredCreditCard

	| cashier carrito aCreditCard |
	cashier := self createCashier.
	carrito := Cart acceptingItemsOf: self defaultCatalog.
	carrito add: self itemSellByTheStore.
	aCreditCard := self createCreditCardInvalid.
	
	self should: [cashier checkOut: carrito with: aCreditCard.] 
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [:anError |
						self assert: anError messageText = Cashier cantCheckOutWIthExpiredCardErrorMessage.
		]. 
	! !

!CashierTest methodsFor: 'tests' stamp: 'AC 11/15/2018 19:17:02'!
test03CashierCheckoutsCorrectlyWithOneItem

	| cashier carrito aCreditCard ticket |
	cashier := self createCashier.
	carrito := Cart acceptingItemsOf: self defaultCatalog.
	carrito add: self itemSellByTheStore.
	aCreditCard := self createCreditCard.
	ticket := cashier checkOut: carrito with: aCreditCard.
	
	
	self assert: ticket equals: self itemSellByTheStorePrice.
	! !

!CashierTest methodsFor: 'tests' stamp: 'AC 11/15/2018 19:38:30'!
test04CashierCheckoutsCorrectlyWithMultipleEqualsItems

	| cashier carrito aCreditCard ticket |
	cashier := self createCashier.
	carrito := Cart acceptingItemsOf: self defaultCatalog.
	carrito add: 2 of: self itemSellByTheStore.
	aCreditCard := self createCreditCard.
	
	ticket := cashier checkOut: carrito with: aCreditCard.
	
	self assert: ticket equals: 2*self itemSellByTheStorePrice.
	! !

!CashierTest methodsFor: 'tests' stamp: 'Lucas 11/22/2018 12:09:08'!
test05CashierCheckoutsCorrectlyWithDifferentItems

	| cashier carrito aCreditCard ticket |
	cashier := self createCashier.
	carrito := Cart acceptingItemsOf: self defaultCatalog.
	carrito add: 2 of: self itemSellByTheStore.
	carrito add: 2 of: self itemSellByTheStore2.
	aCreditCard := self createCreditCard.
	
	ticket := cashier checkOut: carrito with: aCreditCard.
	
	self assert: (ticket value) equals: ((2*self itemSellByTheStorePrice) + (2 * self itemSellByTheStore2Price)).
	! !

!CashierTest methodsFor: 'tests' stamp: 'Lucas 11/19/2018 22:55:48'!
test06CantCheckoutsWithExceededLengthOfNameCreditCardOwner

	| cashier carrito aCreditCard |
	cashier := self createCashier.
	carrito := Cart acceptingItemsOf: self defaultCatalog.
	carrito add: 2 of: self itemSellByTheStore.
	aCreditCard := self createCreditCard2.
	
	self should: [cashier checkOut: carrito with: aCreditCard.]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [:anError |
						self assert: anError messageText = Cashier cantCheckOutWIthExceededLengthCreditCardOwnerErrorMessage.
		]. 
	! !

!CashierTest methodsFor: 'tests' stamp: 'Lucas 11/19/2018 23:24:44'!
test07CantCheckoutsWithExceededAmountTransaccion

	| cashier carrito aCreditCard |
	cashier := self createCashier.
	carrito := Cart acceptingItemsOf: self defaultCatalog.
	carrito add: 1 of: self itemSellByTheStore3.
	aCreditCard := self createCreditCard.
	
	self should: [cashier checkOut: carrito with: aCreditCard.]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [:anError |
						self assert: anError messageText = Cashier cantCheckOutWIthExceededAmountTransaccionErrorMessage.
		]. 
	! !

!CashierTest methodsFor: 'tests' stamp: 'Lucas 11/19/2018 23:51:41'!
test08MerchantProcessorCantDebitsWithExceededAmountTransaccion

	| aCreditCard merchantProcessor |
	
	merchantProcessor := self createMerchantProcessorSimulator.	
	aCreditCard := self createCreditCard.
	
	
	self should: [merchantProcessor creditCardNumber: aCreditCard name creditCardExpiration: aCreditCard expiration creditCardOwner: aCreditCard owner transactionAmout: 5000000000000000.]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [:anError |
						self assert: anError messageText = MerchantProcessorSimulator http400.
	]. 

	! !

!CashierTest methodsFor: 'tests' stamp: 'Lucas 11/19/2018 23:53:49'!
test09MerchantProcessorCantDebitsWithExceededLengthOfNameCreditCardOwner

	| aCreditCard merchantProcessor |
	
	merchantProcessor := self createMerchantProcessorSimulator.	
	aCreditCard := self createCreditCard2.
	
	
	self should: [merchantProcessor creditCardNumber: aCreditCard name creditCardExpiration: aCreditCard expiration creditCardOwner: aCreditCard owner transactionAmout: 5000.]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [:anError |
						self assert: anError messageText = MerchantProcessorSimulator http400.
	]. 
	! !

!CashierTest methodsFor: 'tests' stamp: 'Lucas 11/19/2018 23:57:19'!
test10MerchantProcessorCantDebitsWithExpiredCreditCard

	| aCreditCard merchantProcessor |
	
	merchantProcessor := self createMerchantProcessorSimulator.	
	aCreditCard := self createCreditCardInvalid.
	
	self assert: (merchantProcessor creditCardNumber: aCreditCard name creditCardExpiration: aCreditCard expiration creditCardOwner: aCreditCard owner transactionAmout: 50) equals: '1|Credit_Card_Expired'.
! !

!CashierTest methodsFor: 'tests' stamp: 'Lucas 11/22/2018 11:47:55'!
test11MerchantProcessorCantDebitsWhenTransaccionExceededCreditCardValue

	| aCreditCard merchantProcessor |
	
	merchantProcessor := self createMerchantProcessorSimulator.	
	aCreditCard := self createCreditCard.
	
	self assert: (merchantProcessor creditCardNumber: aCreditCard number creditCardExpiration: aCreditCard expiration creditCardOwner: aCreditCard owner transactionAmout: 150.00) equals: '1|Insufficient_Credit_Card_Value'.
! !

!CashierTest methodsFor: 'tests' stamp: 'Lucas 11/22/2018 12:09:35'!
test12CashierCantDebitsWhenTransaccionExceededCreditCardValue

	| cashier carrito aCreditCard |
	cashier := self createCashier.
	carrito := Cart acceptingItemsOf: self defaultCatalog.	

	carrito add: 2 of: self itemSellByTheStore.
	carrito add: 3 of: self itemSellByTheStore2.
	aCreditCard := self createCreditCard.
	
	self should: [cashier checkOut: carrito with: aCreditCard]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [:anError |
						self assert: anError messageText = Cashier cantCheckOutWIthInsufficientCreditCardValueErrorMessage.
		]. 
	! !

!CashierTest methodsFor: 'tests' stamp: 'Lucas 11/22/2018 12:09:57'!
test13CashierDebitsCorrectWithCreditCard

	| cashier carrito aCreditCard ticket |
	cashier := self createCashier.
	carrito := Cart acceptingItemsOf: self defaultCatalog.	

	carrito add: 2 of: self itemSellByTheStore.
	aCreditCard := self createCreditCard.
	ticket := cashier checkOut: carrito with: aCreditCard.
	
	self assert: ticket equals: 40.00
	
	! !


!CashierTest methodsFor: 'support' stamp: 'Lucas 11/22/2018 12:05:01'!
createCashier
	
	| sales merchantProcessor |
	sales := self defaultSalesList.
	merchantProcessor := self createMerchantProcessorSimulator.
	^Cashier withProductList: (self defaultProductList) andSaleslList: sales andMerchantProcessor: merchantProcessor.! !

!CashierTest methodsFor: 'support' stamp: 'Lucas 11/22/2018 11:45:39'!
createCreditCard
	
	^CreditCard with: 4812184367762574 owner: 'Claudio Matias Perez' expirationDate: Date today.
	
	! !

!CashierTest methodsFor: 'support' stamp: 'Lucas 11/19/2018 22:40:40'!
createCreditCard2
	
	^CreditCard with: 4712184367762582 owner: 'Brhadaranyakopanishadvivekachudamani Erreh Muñoz Castillo' expirationDate: Date today.! !

!CashierTest methodsFor: 'support' stamp: 'Lucas 11/19/2018 22:29:37'!
createCreditCardInvalid
	
	^CreditCard with: 4812184367762575 owner: 'Nicolas Ariel Perez' expirationDate: (Date today previous: #Monday).! !

!CashierTest methodsFor: 'support' stamp: 'Lucas 11/19/2018 22:04:18'!
createMerchantProcessorSimulator
	
	^MerchantProcessorSimulator with: (self defaultCreditCardValues).! !

!CashierTest methodsFor: 'support' stamp: 'Lucas 11/19/2018 23:17:22'!
defaultCatalog
	
	^ Array with: self itemSellByTheStore with: self itemSellByTheStore2 with: self itemSellByTheStore3! !

!CashierTest methodsFor: 'support' stamp: 'Lucas 11/22/2018 11:31:51'!
defaultCreditCardValues
	
	| aCreditCardValues |
	
	aCreditCardValues := Dictionary new.
		
	aCreditCardValues at: 4812184367762574 put: 100.00.
	aCreditCardValues at: 4712184367762582 put: 250.00.
	aCreditCardValues at: 4912184367762564 put: 20.00.
	
	^aCreditCardValues! !

!CashierTest methodsFor: 'support' stamp: 'Lucas 11/19/2018 23:17:40'!
defaultProductList

	| dict |
	dict := Dictionary new.
	dict at: (self itemSellByTheStore) put: (self itemSellByTheStorePrice).
	dict at: (self itemSellByTheStore2) put: (self itemSellByTheStore2Price).
	dict at: (self itemSellByTheStore3) put: (self itemSellByTheStore3Price).
	^dict.! !

!CashierTest methodsFor: 'support' stamp: 'Lucas 11/22/2018 11:19:10'!
defaultSalesList
	
	^ OrderedCollection new.! !

!CashierTest methodsFor: 'support' stamp: 'AC 11/15/2018 18:32:07'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!CashierTest methodsFor: 'support' stamp: 'AC 11/15/2018 18:32:16'!
itemSellByTheStore
	
	^ 'validBook'! !

!CashierTest methodsFor: 'support' stamp: 'AC 11/15/2018 19:32:26'!
itemSellByTheStore2
	
	^ 'validBook2'! !

!CashierTest methodsFor: 'support' stamp: 'Lucas 11/22/2018 11:26:13'!
itemSellByTheStore2Price
	
	^ 30.00! !

!CashierTest methodsFor: 'support' stamp: 'Lucas 11/19/2018 23:16:45'!
itemSellByTheStore3
	
	^ 'validBook3'! !

!CashierTest methodsFor: 'support' stamp: 'Lucas 11/22/2018 11:30:39'!
itemSellByTheStore3Price
	
	^ 10000000000000000.00! !

!CashierTest methodsFor: 'support' stamp: 'Lucas 11/22/2018 11:26:24'!
itemSellByTheStorePrice
	
	^ 20.00! !


!classDefinition: #Cart category: #TusLibros!
Object subclass: #Cart
	instanceVariableNames: 'catalog items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidItemErrorMessage
	
	^'Item is not in catalog'! !

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidQuantityErrorMessage
	
	^'Invalid number of items'! !


!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 17:51'!
assertIsValidItem: anItem

	(catalog includes: anItem) ifFalse: [ self error: self invalidItemErrorMessage ]! !

!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 17:51'!
assertIsValidQuantity: aQuantity

	aQuantity strictlyPositive ifFalse: [ self error: self invalidQuantityErrorMessage ]! !


!Cart methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 17:48'!
initializeAcceptingItemsOf: aCatalog

	catalog := aCatalog.
	items := OrderedCollection new.! !


!Cart methodsFor: 'queries' stamp: 'HernanWilkinson 6/17/2013 17:45'!
occurrencesOf: anItem

	^items occurrencesOf: anItem  ! !


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

!Cart class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 17:48'!
acceptingItemsOf: aCatalog

	^self new initializeAcceptingItemsOf: aCatalog ! !


!classDefinition: #Cashier category: #TusLibros!
Object subclass: #Cashier
	instanceVariableNames: 'productList salesList merchantProcessor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'operations' stamp: 'Lucas 11/22/2018 12:16:51'!
checkOut: aCart with: aCreditCard
	
	| price |
	aCart isEmpty ifTrue: [self error: self class cantCheckOutEmptyCartErrorMessage].
	aCreditCard hasExpired ifTrue: [self error: self class cantCheckOutWIthExpiredCardErrorMessage].
	(aCreditCard owner size > 30) ifTrue: [self error: self class cantCheckOutWIthExceededLengthCreditCardOwnerErrorMessage].
	
	price := 0.
	productList keysAndValuesDo: [:anItem :aPrice  | (aCart includes: anItem) ifTrue:[price := price + ((aCart occurrencesOf: anItem)*aPrice)] ].
	
	(price > 999999999999999.99) ifTrue: [self error: self class cantCheckOutWIthExceededAmountTransaccionErrorMessage].
	
	((merchantProcessor creditCardNumber: aCreditCard number creditCardExpiration: aCreditCard expiration creditCardOwner: aCreditCard owner transactionAmout: price) = '1|Insufficient_Credit_Card_Value') ifTrue: [self error: self class cantCheckOutWIthInsufficientCreditCardValueErrorMessage].
	
	productList keysAndValuesDo: [:anItem :aPrice  | (aCart includes: anItem) ifTrue:[salesList add: (anItem->(aCart occurrencesOf: anItem))] ].
	
	"
	(price isKindOf: Float) ifTrue: [(price integerPart asString size > 17) ifTrue: [self error: self class cantCheckOutWIthExceededAmountTransaccionErrorMessage]].
	(price isKindOf: Integer) ifTrue: [(price asString size > 15) ifTrue: [self error: self class cantCheckOutWIthExceededAmountTransaccionErrorMessage]].
	"

	^price.! !


!Cashier methodsFor: 'initialization' stamp: 'Lucas 11/22/2018 12:06:28'!
initializeWith: aProductList and: aSalesList and: aMerchantProcessor

	productList := aProductList.
	salesList := aSalesList.
	merchantProcessor := aMerchantProcessor! !

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

!Cashier class methodsFor: 'errorMessage' stamp: 'Lucas 11/22/2018 11:36:05'!
cantCheckOutWIthInsufficientCreditCardValueErrorMessage
	
	^'Cant check out with insufficient credit card value'! !


!Cashier class methodsFor: 'class initialization' stamp: 'Lucas 11/22/2018 12:07:04'!
withProductList: aProductList andSaleslList: aSalesList andMerchantProcessor: aMerchantProcessor

	^self new initializeWith: aProductList and: aSalesList and: aMerchantProcessor.! !


!classDefinition: #CreditCard category: #TusLibros!
Object subclass: #CreditCard
	instanceVariableNames: 'date number owner'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'initialization' stamp: 'Lucas 11/19/2018 22:28:49'!
initializeWith: aNumber owner: aName expirationDate: aDate.

	date := aDate.
	number:= aNumber.
	owner := aName.! !


!CreditCard methodsFor: 'testing' stamp: 'AC 11/15/2018 19:00:05'!
hasExpired
	
	^(date < Date today)! !


!CreditCard methodsFor: 'as yet unclassified' stamp: 'Lucas 11/19/2018 22:32:00'!
expiration

	^date ! !

!CreditCard methodsFor: 'as yet unclassified' stamp: 'Lucas 11/19/2018 22:32:25'!
number

	^number! !

!CreditCard methodsFor: 'as yet unclassified' stamp: 'Lucas 11/19/2018 22:31:38'!
owner

	^owner ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: #TusLibros!
CreditCard class
	instanceVariableNames: 'number'!

!CreditCard class methodsFor: 'class initialization' stamp: 'Lucas 11/19/2018 22:28:06'!
with: aNumber owner: aName expirationDate: aDate

	^self new initializeWith: aNumber owner: aName expirationDate: aDate.! !


!classDefinition: #MerchantProcessorSimulator category: #TusLibros!
Object subclass: #MerchantProcessorSimulator
	instanceVariableNames: 'creditCardValues'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!MerchantProcessorSimulator methodsFor: 'initialization' stamp: 'Lucas 11/19/2018 22:15:50'!
initializeWith: aCreditCardValues

	creditCardValues := aCreditCardValues.! !


!MerchantProcessorSimulator methodsFor: 'operations' stamp: 'Lucas 11/22/2018 12:03:12'!
creditCardNumber: aNumber creditCardExpiration: aExpiration creditCardOwner: aName transactionAmout: aTransactionAmout

	(aName size > 30) ifTrue: [self error: self class http400].
	(aTransactionAmout > 999999999999999.99) ifTrue: [self error: self class http400].

	(aExpiration < Date today) ifTrue: [^'1|Credit_Card_Expired'].
	
	(aTransactionAmout > (creditCardValues at: aNumber)) ifTrue: [^'1|Insufficient_Credit_Card_Value'].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MerchantProcessorSimulator class' category: #TusLibros!
MerchantProcessorSimulator class
	instanceVariableNames: ''!

!MerchantProcessorSimulator class methodsFor: 'initialization' stamp: 'Lucas 11/19/2018 22:15:06'!
with: aCreditCardValues

	^self new initializeWith: aCreditCardValues.! !


!MerchantProcessorSimulator class methodsFor: 'error message' stamp: 'Lucas 11/19/2018 23:41:24'!
http400

	^'HTTP 400'! !
