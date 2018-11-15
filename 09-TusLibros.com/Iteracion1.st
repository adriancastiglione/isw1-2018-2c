!classDefinition: #CartTest category: #TusLibros!
TestCase subclass: #CartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'AC 11/15/2018 11:30:12'!
test01CartIsEmptyWhenCreated

	| cart collectionBooks |
	
	collectionBooks := OrderedCollection with: 'Caperusita Roja'.
	cart := Cart of: collectionBooks. 
	self assert: cart isEmpty.

	! !

!CartTest methodsFor: 'tests' stamp: 'AC 11/15/2018 11:32:35'!
test02CartIsNotEmptyWhenAddedItem

	| cart collectionBooks |
	
	collectionBooks := OrderedCollection with: 'Caperusita Roja'.
	cart := Cart of: collectionBooks. 
	cart add: 5 of: 'Caperusita Roja'. 
	self deny: cart isEmpty.

	! !

!CartTest methodsFor: 'tests' stamp: 'AC 11/15/2018 11:30:12'!
test03AddingBookWithNonPositiveQuantityRaisesError

	| cart collectionBooks |
	
	collectionBooks := OrderedCollection with: 'Caperusita Roja'.
	cart := Cart of: collectionBooks. 
	
	self should: [cart add: 0 of: 'Caperusita Roja'.] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self
				assert: Cart invalidQuantityErrorMessage
				equals: anError messageText.
			self
				deny: (cart contains: 'Caperusita Roja').
			]. 
	
	self should: [cart add: -1 of: 'Caperusita Roja'.] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self
				assert: Cart invalidQuantityErrorMessage
				equals: anError messageText.
			self
				deny: (cart contains: 'Caperusita Roja').
			]. ! !

!CartTest methodsFor: 'tests' stamp: 'AC 11/15/2018 11:30:12'!
test04AddedBadBookRaiseError

	| cart collectionBooks |
	
	collectionBooks := OrderedCollection with: 'Caperusita Roja'.
	cart := Cart of: collectionBooks. 
	
	self should: [cart add: 6 of: 'Dracula'.] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self
				assert: Cart wrongBookErrorMessage
				equals: anError messageText.
			self
				deny: (cart contains: 'Dracula').
			]. 
	! !

!CartTest methodsFor: 'tests' stamp: 'AC 11/15/2018 11:30:12'!
test05CartContainsAddedItems

	| cart collectionBooks |
	
	collectionBooks := OrderedCollection with: 'Caperusita Roja' with:'Dracula'.
	cart := Cart of: collectionBooks. 
	cart add: 5 of: 'Caperusita Roja'. 
	cart add: 6 of: 'Dracula'.
	
	self assert: (cart contains: 'Caperusita Roja').	
	self assert: (cart contains: 'Dracula').

	! !

!CartTest methodsFor: 'tests' stamp: 'AC 11/15/2018 11:30:12'!
test06CartContainsCorrectQuantityOfAddedItems

	| cart collectionBooks |
	
	collectionBooks := OrderedCollection with: 'Caperusita Roja' with: 'Dracula'.
	cart := Cart of: collectionBooks.
	
	cart add: 5 of: 'Caperusita Roja'. 
	cart add: 6 of: 'Dracula'.
	
	
	self assert: (cart quantityOf: 'Caperusita Roja') equals: 5.	
	self assert: (cart quantityOf: 'Dracula') equals: 6.

	! !


!classDefinition: #Cart category: #TusLibros!
Object subclass: #Cart
	instanceVariableNames: 'items catalogue'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'testing' stamp: 'AC 11/12/2018 20:13:57'!
isEmpty
	
	^items isEmpty.! !

!Cart methodsFor: 'testing' stamp: 'AC 11/12/2018 21:15:07'!
quantityOf: anItem

	^items at:anItem.
	
	! !


!Cart methodsFor: 'operations' stamp: 'AC 11/15/2018 11:32:45'!
add: aQuantity of: anItem 
	
	self isValidQuantity: aQuantity.
	self isValidItem: anItem.
	items at:anItem put: aQuantity.
	! !

!Cart methodsFor: 'operations' stamp: 'AC 11/12/2018 21:15:36'!
contains: anItem 
	
	^items includesKey: anItem.! !


!Cart methodsFor: 'asserting' stamp: 'AC 11/15/2018 11:31:43'!
isValidItem: anItem 
	
	(catalogue includes: anItem) ifFalse: [self error: self class wrongBookErrorMessage]. ! !

!Cart methodsFor: 'asserting' stamp: 'AC 11/15/2018 11:31:32'!
isValidQuantity: aQuantity
	
	(aQuantity < 1) ifTrue: [self error: self class invalidQuantityErrorMessage ].! !


!Cart methodsFor: 'initialization' stamp: 'AC 11/12/2018 21:16:15'!
initializeOf: aCatalogue
	
	catalogue := aCatalogue.
	items := Dictionary new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'error message' stamp: 'AC 11/12/2018 20:56:31'!
invalidQuantityErrorMessage

	^'Book quantity must be positive'! !

!Cart class methodsFor: 'error message' stamp: 'AC 11/12/2018 20:48:08'!
wrongBookErrorMessage

	^'Book not from Editorial'! !


!Cart class methodsFor: 'initialization' stamp: 'AC 11/12/2018 21:16:42'!
of: aCatalogue 
	
	^self new initializeOf: aCatalogue.! !
