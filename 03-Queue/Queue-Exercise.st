!classDefinition: #QueueTest category: #'Queue-Exercise'!
TestCase subclass: #QueueTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Queue-Exercise'!

!QueueTest methodsFor: 'test' stamp: 'HAW 9/26/2018 23:15:51'!
test01QueueShouldBeEmptyWhenCreated

	| queue |

	queue _ Queue new.

	self assert: queue isEmpty.! !

!QueueTest methodsFor: 'test' stamp: 'HAW 9/26/2018 23:15:51'!
test02EnqueueAddElementsToTheQueue

	| queue |

	queue _ Queue new.
	queue enqueue: 'Something'.

	self deny: queue isEmpty.! !

!QueueTest methodsFor: 'test' stamp: 'HAW 9/26/2018 23:15:51'!
test03DequeueRemovesElementsFromTheQueue

	| queue |

	queue _ Queue new.
	queue enqueue: 'Something'.
	queue dequeue.

	self assert: queue isEmpty.! !

!QueueTest methodsFor: 'test' stamp: 'HAW 9/26/2018 23:15:51'!
test04DequeueReturnsFirstEnqueuedObject

	| queue firstQueued secondQueued |

	queue _ Queue new.
	firstQueued _ 'Something1'.
	secondQueued _ 'Something2'.
	queue enqueue: firstQueued.
	queue enqueue: secondQueued.
	
	self assert: queue dequeue equals: firstQueued.! !

!QueueTest methodsFor: 'test' stamp: 'CGCM 9/27/2018 16:34:58'!
test05QueueBehavesFIFO

	| queue firstQueued secondQueued |

	queue _ Queue new.
	firstQueued _ 'First'.
	secondQueued _ 'Second'.
	queue enqueue: firstQueued.
	queue enqueue: secondQueued.

	self assert: queue dequeue equals: firstQueued.
	self assert: queue dequeue equals: secondQueued.
	self assert: queue isEmpty.! !

!QueueTest methodsFor: 'test' stamp: 'HAW 9/26/2018 23:15:51'!
test06NextReturnsFirstEnqueuedObject

	| queue firstQueued |

	queue _ Queue new.
	firstQueued _ 'Something'.
	queue enqueue: firstQueued.

	self assert: queue next equals: firstQueued.! !

!QueueTest methodsFor: 'test' stamp: 'HAW 9/26/2018 23:15:51'!
test07NextDoesNotRemoveObjectFromQueue

	| queue firstQueued |

	queue _ Queue new.
	firstQueued _ 'Something'.
	queue enqueue: firstQueued.

	queue next.
	self assert: queue size equals: 1.! !

!QueueTest methodsFor: 'test' stamp: 'HAW 9/26/2018 23:15:51'!
test08CanNotDequeueWhenThereAreNoObjectsInTheQueue

	| queue |

	queue _ Queue new.
	
	self
		should: [ queue dequeue ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: Queue queueEmptyErrorDescription ].! !

!QueueTest methodsFor: 'test' stamp: 'HAW 9/26/2018 23:15:51'!
test09CanNotDequeueWhenThereAreNoObjectsInTheQueueAndTheQueueHadObjects

	| queue |

	queue _ Queue new.
	queue enqueue: 'Something'.
	queue dequeue.

	self
		should: [ queue dequeue ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: Queue queueEmptyErrorDescription ].! !

!QueueTest methodsFor: 'test' stamp: 'HAW 9/26/2018 23:15:51'!
test10CanNotNextWhenThereAreNoObjectsInTheQueue

	| queue |

	queue _ Queue new.

	self
		should: [ queue next ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: Queue queueEmptyErrorDescription ].! !


!classDefinition: #Queue category: #'Queue-Exercise'!
Object subclass: #Queue
	instanceVariableNames: 'contents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Queue-Exercise'!

!Queue methodsFor: 'initialization' stamp: 'AC 10/2/2018 23:56:20'!
dequeue

	self isEmpty ifTrue: [^self error: self class queueEmptyErrorDescription ].
	^contents removeFirst
	
	! !

!Queue methodsFor: 'initialization' stamp: 'AC 10/2/2018 23:43:21'!
enqueue: anElement

	^contents add: anElement.! !

!Queue methodsFor: 'initialization' stamp: 'AC 10/2/2018 23:39:10'!
initialize

	contents := OrderedCollection new.! !

!Queue methodsFor: 'initialization' stamp: 'AC 10/2/2018 23:42:09'!
isEmpty

	^contents isEmpty! !

!Queue methodsFor: 'initialization' stamp: 'Lucas 10/4/2018 11:08:36'!
next
	
	| queueClass |
	
	queueClass _ Queue subclasses detect: [:anQueueClass | anQueueClass isFor:contents.].
	
	^queueClass toNext: contents 
	
	"
	self isEmpty ifTrue: [^self error: self class queueEmptyErrorDescription ].
	^contents at:1
	"! !

!Queue methodsFor: 'initialization' stamp: 'AC 10/2/2018 23:53:57'!
size

	^contents size! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Queue class' category: #'Queue-Exercise'!
Queue class
	instanceVariableNames: 'contents'!

!Queue class methodsFor: 'error descriptions' stamp: 'Lucas 10/4/2018 11:01:20'!
isFor: aContents

	^self subclassResponsibility! !

!Queue class methodsFor: 'error descriptions'!
queueEmptyErrorDescription
	^ 'Queue is empty'.! !


!classDefinition: #Empty category: #'Queue-Exercise'!
Queue subclass: #Empty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Queue-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Empty class' category: #'Queue-Exercise'!
Empty class
	instanceVariableNames: ''!

!Empty class methodsFor: 'as yet unclassified' stamp: 'Lucas 10/4/2018 11:03:09'!
isFor: aContents

	^aContents isEmpty! !

!Empty class methodsFor: 'as yet unclassified' stamp: 'Lucas 10/4/2018 11:13:28'!
queueEmptyErrorDescription
	^ 'Queue is empty'.! !

!Empty class methodsFor: 'as yet unclassified' stamp: 'Lucas 10/4/2018 11:14:08'!
toNext: aContents
	
	^self error: self queueEmptyErrorDescription
	
	"
	self isEmpty ifTrue: [^self error: self class queueEmptyErrorDescription ].
	^contents at:1
	"! !


!classDefinition: #NotEmpty category: #'Queue-Exercise'!
Queue subclass: #NotEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Queue-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NotEmpty class' category: #'Queue-Exercise'!
NotEmpty class
	instanceVariableNames: ''!

!NotEmpty class methodsFor: 'as yet unclassified' stamp: 'Lucas 10/4/2018 11:03:33'!
isFor: aContents

	^aContents isEmpty not! !

!NotEmpty class methodsFor: 'as yet unclassified' stamp: 'Lucas 10/4/2018 11:06:36'!
toNext: aContents
	
	^aContents at:1
	
	"
	self isEmpty ifTrue: [^self error: self class queueEmptyErrorDescription ].
	^contents at:1
	"! !
