!classDefinition: #NumeroTest category: #'Numero-Exercise'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:46:28'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:11'!
test01isCeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:12'!
test02isCeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:14'!
test05EnteroAddsWithEnteroCorrectly

	self assert: one + one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:18'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: two * two equals: four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:20'!
test07EnteroDividesEnteroCorrectly

	self assert: two / two equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:38'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: oneFifth + oneHalf equals: sevenTenths! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:52'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: oneFifth * twoFifth equals: twoTwentyfifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:56'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: oneHalf / oneFifth equals: fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: one + oneFifth equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test12FraccionAddsEnteroCorrectly

	self assert: oneFifth + one equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:50'!
test13EnteroMultipliesFraccionCorrectly

	self assert: two * oneFifth equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:52'!
test14FraccionMultipliesEnteroCorrectly

	self assert: oneFifth * two equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:57'!
test15EnteroDividesFraccionCorrectly

	self assert: one / twoFifth equals: fiveHalfs  ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:59'!
test16FraccionDividesEnteroCorrectly

	self assert: twoFifth / five equals: twoTwentyfifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:40'!
test19AddingFraccionesCanReturnAnEntero

	self assert: oneHalf + oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: (two/five) * (five/two) equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test21DividingFraccionesCanReturnAnEntero

	self assert: oneHalf / oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:43'!
test22DividingEnterosCanReturnAFraccion

	self assert: two / four equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:47:26'!
test27EnteroSubstractsEnteroCorrectly

	self assert: two - one equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:47:41'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: twoFifth - oneFifth equals: oneFifth.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:00'!
test29EnteroSubstractsFraccionCorrectly

	self assert: one - oneHalf equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:05'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: sixFifth - one equals: oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:08'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: threeHalfs - oneHalf equals: one.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:48'!
test32SubstractingSameEnterosReturnsZero

	self assert: one - one equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:01'!
test33SubstractingSameFraccionesReturnsZero

	self assert: oneHalf - oneHalf equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:14'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: one - fiveHalfs equals: negativeThreeHalfs.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:23'!
test35FibonacciZeroIsOne

	self assert: zero fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:32'!
test36FibonacciOneIsOne

	self assert: one fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:39'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: four fibonacci equals: five.
	self assert: three fibonacci equals: three. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:47'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Entero negativeFibonacciErrorDescription ].! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:55'!
test39NegationOfEnteroIsCorrect

	self assert: two negated equals: negativeTwo.
		! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:03'!
test40NegationOfFraccionIsCorrect

	self assert: oneHalf negated equals: negativeOne / two.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:11'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:17'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !


!classDefinition: #Numero category: #'Numero-Exercise'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 22:21:28'!
- aSubtrahend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 23:37:13'!
negated
	
	^self * (Entero with: -1)! !


!Numero methodsFor: 'testing' stamp: 'NR 9/23/2018 23:36:49'!
isNegative

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isZero

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: #'Numero-Exercise'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2016 22:45'!
canNotDivideByZeroErrorDescription

	^'No se puede dividir por cero'! !

!Numero class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2016 22:47'!
invalidNumberTypeErrorDescription
	^ 'Tipo de numero invalido'! !


!classDefinition: #Entero category: #'Numero-Exercise'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Entero methodsFor: 'arithmetic operations' stamp: 'AC 9/28/2018 10:43:14'!
* aMultiplier 
	
	^aMultiplier multiplyToEntero: self.
	
	"(aMultiplier isKindOf: Entero) ifTrue: [^self class with: value * aMultiplier integerValue].
	(aMultiplier isKindOf: Fraccion) ifTrue: [^self * aMultiplier numerator / aMultiplier denominator].
	
	self invalidNumberType
"
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'AC 9/28/2018 09:10:22'!
+ anAdder 
	
	^anAdder  addToEntero: self.
	"
	anAdder class = Entero ifTrue: [^self class with: value + anAdder integerValue].
	
	(anAdder isKindOf: Fraccion) ifTrue: [^(self* anAdder denominator + anAdder numerator) / anAdder denominator.].
	
	self invalidNumberType
	"! !

!Entero methodsFor: 'arithmetic operations' stamp: 'AC 9/30/2018 21:53:32'!
- aSubtrahend 
	
	^aSubtrahend subtractFromEntero: self.
	
	"
	(aSubtrahend isKindOf: Entero) ifTrue: [^ self class with: value - aSubtrahend integerValue.].
	(aSubtrahend isKindOf:Fraccion) ifTrue: [^ aSubtrahend denominator * self - aSubtrahend numerator / aSubtrahend denominator].
	"! !

!Entero methodsFor: 'arithmetic operations' stamp: 'AC 9/30/2018 21:55:07'!
/ aDivisor 
	
	^aDivisor divideEntero: self.
! !

!Entero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 21:55'!
// aDivisor 
	
	^self class with: value // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations' stamp: 'AC 9/28/2018 09:23:41'!
= anObject

	^(anObject isKindOf: Entero) and: [ value = anObject integerValue ]! !

!Entero methodsFor: 'arithmetic operations' stamp: 'AC 9/29/2018 18:45:42'!
fibonacci

	self subclassResponsibility.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 21:00'!
greatestCommonDivisorWith: anEntero 
	
	^self class with: (value gcd: anEntero integerValue)! !


!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:17'!
hash

	^value hash! !


!Entero methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2016 20:09'!
initalizeWith: aValue 
	
	value := aValue! !


!Entero methodsFor: 'value' stamp: 'HernanWilkinson 5/7/2016 21:02'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !


!Entero methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:53:19'!
printOn: aStream

	aStream print: value ! !


!Entero methodsFor: 'testing' stamp: 'NR 9/23/2018 22:17:55'!
isNegative
	
	^value < 0! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:14'!
isOne
	
	^value = 1! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:12'!
isZero
	
	^value = 0! !


!Entero methodsFor: 'arithmetic operations - private' stamp: 'AC 9/28/2018 09:10:22'!
addToEntero: anAdder 
	
	^self class with: value + anAdder integerValue.
	"
	anAdder class = Entero ifTrue: [^self class with: value + anAdder integerValue].
	
	(anAdder isKindOf: Fraccion) ifTrue: [^(self* anAdder denominator + anAdder numerator) / anAdder denominator.].
	
	self invalidNumberType
	"! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'AC 9/28/2018 09:10:37'!
addToFraccion: anAdder 

	^self + anAdder.! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'AC 9/30/2018 21:52:55'!
divideEntero: aDividend


	^Fraccion with: aDividend over: self

	! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'AC 9/30/2018 21:53:15'!
divideFraccion: aDividend


	^Fraccion with: aDividend numerator over: aDividend denominator * self value

	! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'AC 9/28/2018 10:43:14'!
multiplyToEntero: aMultiplier 
	
	^self class with: value * aMultiplier integerValue.
	! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'AC 9/28/2018 10:43:31'!
multiplyToFraccion: aMultiplier 
	
	^self * aMultiplier numerator / aMultiplier denominator.! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'AC 9/30/2018 21:53:32'!
subtractFromEntero: aMinuendo 	

	^ self class with: aMinuendo integerValue - value! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'AC 9/30/2018 21:53:46'!
subtractFromFraccion: aMinuendo 
	
	^ Fraccion with: aMinuendo numerator - (aMinuendo denominator * self ) over: aMinuendo denominator
	

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: #'Numero-Exercise'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'AC 9/30/2018 21:52:09'!
isFor: aValue

	^self subclassResponsibility
! !

!Entero class methodsFor: 'instance creation' stamp: 'NR 9/23/2018 22:17:16'!
negativeFibonacciErrorDescription
	^ ' Fibonacci no estÃ¡ definido aquÃ­ para enteros negativos'! !

!Entero class methodsFor: 'instance creation' stamp: 'AC 9/30/2018 22:09:27'!
with: aValue 

	| enteroClass |
	
	"Acá recurrimos al 'síndrome Maradoniano' para que las implementaciones de with de las subclases de Entero  funcionen bien."
	enteroClass _ Entero subclasses detect: [:anEnteroClass | anEnteroClass isFor: aValue.] ifNone: [  self error: 'aValue debe ser anInteger valido' ].
	
	^enteroClass new initalizeWith: aValue! !


!classDefinition: #Negative category: #'Numero-Exercise'!
Entero subclass: #Negative
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Negative methodsFor: 'as yet unclassified' stamp: 'AC 9/29/2018 18:44:36'!
fibonacci

	self error: Entero negativeFibonacciErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Negative class' category: #'Numero-Exercise'!
Negative class
	instanceVariableNames: ''!

!Negative class methodsFor: 'instance creation' stamp: 'AC 9/30/2018 21:52:10'!
isFor: aValue

	^aValue isInteger and:[aValue < 0.]! !


!classDefinition: #One category: #'Numero-Exercise'!
Entero subclass: #One
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!One methodsFor: 'as yet unclassified' stamp: 'AC 9/29/2018 18:43:54'!
fibonacci

	^self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'One class' category: #'Numero-Exercise'!
One class
	instanceVariableNames: ''!

!One class methodsFor: 'instance creation' stamp: 'AC 9/30/2018 21:52:10'!
isFor: aValue

	^aValue isInteger and:[aValue = 1.]! !


!classDefinition: #PostiveLargerThanOne category: #'Numero-Exercise'!
Entero subclass: #PostiveLargerThanOne
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!PostiveLargerThanOne methodsFor: 'as yet unclassified' stamp: 'AC 9/29/2018 18:48:58'!
fibonacci

	| one two |
	
	one := Entero with: 1.
	two := Entero with: 2.
	
	^ (self - one) fibonacci + (self - two) fibonacci
		! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PostiveLargerThanOne class' category: #'Numero-Exercise'!
PostiveLargerThanOne class
	instanceVariableNames: ''!

!PostiveLargerThanOne class methodsFor: 'instance creation' stamp: 'AC 9/30/2018 21:52:09'!
isFor: aValue

	^aValue isInteger and:[aValue > 1.]! !


!classDefinition: #Zero category: #'Numero-Exercise'!
Entero subclass: #Zero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Zero methodsFor: 'as yet unclassified' stamp: 'AC 9/29/2018 19:04:52'!
fibonacci

	^Entero with:1! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Zero class' category: #'Numero-Exercise'!
Zero class
	instanceVariableNames: ''!

!Zero class methodsFor: 'instance creation' stamp: 'AC 9/30/2018 21:52:09'!
isFor: aValue

	^aValue isInteger and:[aValue = 0.]! !


!classDefinition: #Fraccion category: #'Numero-Exercise'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Fraccion methodsFor: 'arithmetic operations' stamp: 'AC 9/30/2018 21:38:58'!
* aMultiplier 

	^ aMultiplier multiplyToFraccion: self! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'AC 9/28/2018 09:10:37'!
+ anAdder 
	
	^anAdder  addToFraccion: self.
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'AC 9/30/2018 21:53:46'!
- aSubtrahend 
	
	^aSubtrahend subtractFromFraccion: self.
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'AC 9/30/2018 21:53:15'!
/ aDivisor 

	^aDivisor divideFraccion: self.	
! !


!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:42'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2016 22:54'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	numerator := aNumerator.
	denominator := aDenominator ! !


!Fraccion methodsFor: 'testing' stamp: 'NR 9/23/2018 23:41:38'!
isNegative
	
	^numerator < 0! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !


!Fraccion methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:54:46'!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !


!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'AC 9/28/2018 09:10:22'!
addToEntero: anAdder 
	
	^(anAdder *  denominator + numerator) / denominator.
	! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'AC 9/28/2018 09:10:37'!
addToFraccion: anAdder 
	
	| newNumerator newDenominator |
	
	newNumerator := (numerator * anAdder denominator) + (denominator * anAdder numerator).
	newDenominator := denominator * anAdder denominator.
	^newNumerator / newDenominator.	
	"
	| newNumerator newDenominator |
	
	anAdder class = Fraccion ifTrue: [
	newNumerator := (numerator * anAdder denominator) + (denominator * anAdder numerator).
	newDenominator := denominator * anAdder denominator.
	^newNumerator / newDenominator.	
	].
	^(self denominator * anAdder + self numerator) / self denominator.
	"! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'AC 9/30/2018 21:52:55'!
divideEntero: aDividend

	^Fraccion with: aDividend * denominator over: numerator


	
! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'AC 9/30/2018 21:53:15'!
divideFraccion: aDividend
	
	^(aDividend numerator * denominator) / (aDividend denominator * numerator)

	
! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'AC 9/30/2018 20:19:33'!
multiplyToEntero: aMultiplier

	^self numerator * aMultiplier / self denominator

! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'AC 9/30/2018 20:20:09'!
multiplyToFraccion: aMultiplier

	^(numerator * aMultiplier numerator) / (denominator * aMultiplier denominator)

! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'AC 9/30/2018 21:53:32'!
subtractFromEntero: aMinuendo
	
	^ self denominator * aMinuendo - self numerator / self denominator
! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'AC 9/30/2018 21:53:46'!
subtractFromFraccion: aMinuendo
	
	| newNumerator newDenominator |
	
	newNumerator := (aMinuendo numerator * denominator) - (aMinuendo denominator * numerator).
	newDenominator := aMinuendo denominator * denominator.
	^newNumerator / newDenominator
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: #'Numero-Exercise'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'intance creation' stamp: 'AC 9/30/2018 23:06:57'!
isFor: aDividend over: aDivisor

	^self subclassResponsibility .! !

!Fraccion class methodsFor: 'intance creation' stamp: 'AC 9/30/2018 23:21:54'!
with: aDividend over: aDivisor
"
	| fraccionClass |
	
	fraccionClass _ Fraccion subclasses detect:[:aFraccionClass | aFraccionClass isFor: aDividend over: aDivisor].
	^fraccionClass new initializeWith: aDividend over: aDivisor.
"
	| greatestCommonDivisor numerator denominator |
	
	aDivisor isZero ifTrue: [ self error: self canNotDivideByZeroErrorDescription ].
	aDividend isZero ifTrue: [ ^aDividend ].
	
	aDivisor isNegative ifTrue:[ ^aDividend negated / aDivisor negated].
	
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	denominator isOne ifTrue: [ ^numerator ].

	^self new initializeWith: numerator over: denominator
! !


!classDefinition: #NegativeDivisor category: #'Numero-Exercise'!
Fraccion subclass: #NegativeDivisor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!NegativeDivisor methodsFor: 'initialization' stamp: 'AC 9/30/2018 23:03:11'!
initializeWith: aNumerator over: aDenominator

	^aNumerator negated / aDenominator negated! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NegativeDivisor class' category: #'Numero-Exercise'!
NegativeDivisor class
	instanceVariableNames: ''!

!NegativeDivisor class methodsFor: 'intance creation' stamp: 'AC 9/30/2018 23:08:07'!
isFor: aDividend  over: aDivisor

	^aDivisor isNegative! !


!classDefinition: #PositiveDivisorNonZeroDividend category: #'Numero-Exercise'!
Fraccion subclass: #PositiveDivisorNonZeroDividend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!PositiveDivisorNonZeroDividend methodsFor: 'initialization' stamp: 'AC 9/30/2018 23:29:31'!
initializeWith: aDividend over: aDivisor

	| greatestCommonDivisor |

	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	denominator isOne ifTrue: [ ^numerator ].

	^self. " new initializeWith: numerator over: denominator"! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PositiveDivisorNonZeroDividend class' category: #'Numero-Exercise'!
PositiveDivisorNonZeroDividend class
	instanceVariableNames: ''!

!PositiveDivisorNonZeroDividend class methodsFor: 'intance creation' stamp: 'AC 9/30/2018 23:20:52'!
isFor: aDividend  over: aDivisor

	^(aDivisor isNegative not) and: [aDivisor isZero not]! !


!classDefinition: #ZeroDividend category: #'Numero-Exercise'!
Fraccion subclass: #ZeroDividend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!ZeroDividend methodsFor: 'initialization' stamp: 'AC 9/30/2018 23:13:43'!
initializeWith: aNumerator over: aDenominator

	^Entero with: aNumerator! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ZeroDividend class' category: #'Numero-Exercise'!
ZeroDividend class
	instanceVariableNames: ''!

!ZeroDividend class methodsFor: 'intance creation' stamp: 'AC 9/30/2018 23:08:07'!
isFor: aDividend  over: aDivisor

	^aDividend = 0 and: [aDivisor isZero not]! !


!classDefinition: #ZeroDivisor category: #'Numero-Exercise'!
Fraccion subclass: #ZeroDivisor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!ZeroDivisor methodsFor: 'initialization' stamp: 'AC 9/30/2018 23:11:35'!
initializeWith: aNumerator over: aDenominator

	self error: self class canNotDivideByZeroErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ZeroDivisor class' category: #'Numero-Exercise'!
ZeroDivisor class
	instanceVariableNames: ''!

!ZeroDivisor class methodsFor: 'intance creation' stamp: 'AC 9/30/2018 23:08:07'!
isFor: aDividend  over: aDivisor

	^aDivisor = 0! !
