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

!Queue methodsFor: 'initialization' stamp: 'AC 10/2/2018 23:39:10'!
initialize

	contents := OrderedCollection new.! !


!Queue methodsFor: 'testing' stamp: 'AC 10/2/2018 23:42:09'!
isEmpty

	^contents isEmpty! !


!Queue methodsFor: 'content manipulation' stamp: 'AC 10/4/2018 11:54:58'!
dequeue

	| queueStateClass |
	
	queueStateClass _ QueueState subclasses detect: [:anQueueClass | anQueueClass isFor:self.].	
	^queueStateClass dequeueFrom: self.! !

!Queue methodsFor: 'content manipulation' stamp: 'AC 10/2/2018 23:43:21'!
enqueue: anElement

	^contents add: anElement.! !


!Queue methodsFor: 'content manipulation - private' stamp: 'AC 10/4/2018 11:41:06'!
dequeueWhenEmpty

	^self error: self class queueEmptyErrorDescription.
! !

!Queue methodsFor: 'content manipulation - private' stamp: 'AC 10/4/2018 11:48:26'!
dequeueWhenNotEmpty

	^contents removeFirst
	
	! !


!Queue methodsFor: 'information' stamp: 'AC 10/4/2018 11:55:04'!
next
	
	| queueStateClass |
	
	queueStateClass _ QueueState subclasses detect: [:anQueueClass | anQueueClass isFor:self.].
	^queueStateClass nextFrom: self.! !

!Queue methodsFor: 'information' stamp: 'AC 10/2/2018 23:53:57'!
size

	^contents size! !


!Queue methodsFor: 'information - private' stamp: 'AC 10/4/2018 11:42:45'!
nextWhenEmpty
	
	^self error: self class queueEmptyErrorDescription.
	! !

!Queue methodsFor: 'information - private' stamp: 'AC 10/4/2018 11:49:01'!
nextWhenNotEmpty
	
	^contents at:1
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Queue class' category: #'Queue-Exercise'!
Queue class
	instanceVariableNames: 'contents'!

!Queue class methodsFor: 'error descriptions'!
queueEmptyErrorDescription
	^ 'Queue is empty'.! !


!classDefinition: #QueueState category: #'Queue-Exercise'!
Object subclass: #QueueState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Queue-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'QueueState class' category: #'Queue-Exercise'!
QueueState class
	instanceVariableNames: ''!

!QueueState class methodsFor: 'testing' stamp: 'AC 10/4/2018 11:36:45'!
isFor: aQueue

	^self subclassResponsibility .! !


!QueueState class methodsFor: 'queue state manipulation' stamp: 'AC 10/4/2018 11:38:45'!
dequeueFrom: aQueue

	^self subclassResponsibility .! !

!QueueState class methodsFor: 'queue state manipulation' stamp: 'AC 10/4/2018 11:39:03'!
nextFrom: aQueue

	^self subclassResponsibility .! !


!classDefinition: #EmptyQueue category: #'Queue-Exercise'!
QueueState subclass: #EmptyQueue
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Queue-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EmptyQueue class' category: #'Queue-Exercise'!
EmptyQueue class
	instanceVariableNames: ''!

!EmptyQueue class methodsFor: 'testing' stamp: 'AC 10/4/2018 11:39:57'!
isFor: aQueue

	^aQueue isEmpty.! !


!EmptyQueue class methodsFor: 'queue state manipulation' stamp: 'AC 10/4/2018 11:40:35'!
dequeueFrom: aQueue

	^aQueue dequeueWhenEmpty.! !

!EmptyQueue class methodsFor: 'queue state manipulation' stamp: 'AC 10/4/2018 11:42:07'!
nextFrom: aQueue

	^aQueue nextWhenEmpty.! !


!classDefinition: #NotEmptyQueue category: #'Queue-Exercise'!
QueueState subclass: #NotEmptyQueue
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Queue-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NotEmptyQueue class' category: #'Queue-Exercise'!
NotEmptyQueue class
	instanceVariableNames: ''!

!NotEmptyQueue class methodsFor: 'testing' stamp: 'AC 10/4/2018 11:46:45'!
isFor: aQueue

	^aQueue isEmpty not.! !


!NotEmptyQueue class methodsFor: 'queue state manipulation' stamp: 'AC 10/4/2018 11:47:43'!
dequeueFrom: aQueue

	^aQueue dequeueWhenNotEmpty.! !

!NotEmptyQueue class methodsFor: 'queue state manipulation' stamp: 'AC 10/4/2018 11:47:26'!
nextFrom: aQueue

	^aQueue nextWhenNotEmpty.! !
