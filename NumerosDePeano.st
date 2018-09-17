!classDefinition: #I category: #NumerosDePeano!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosDePeano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: #NumerosDePeano!
I class
	instanceVariableNames: ''!

!I class methodsFor: 'as yet unclassified' stamp: 'AC 9/16/2018 18:13:57'!
- unSustraendo

	self error: self descripcionDeErrorDeNumerosNegativosNoSoportados! !

!I class methodsFor: 'as yet unclassified' stamp: 'Name 9/16/2018 22:05:37'!
-- unSustraendo

	^false! !

!I class methodsFor: 'as yet unclassified' stamp: 'Name 9/16/2018 22:05:57'!
/ unDivisor
	
	unDivisor = I ifTrue: [^I].
	self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor! !

!I class methodsFor: 'as yet unclassified' stamp: 'Name 9/16/2018 22:06:15'!
< unNumeroDePeano
	
	unNumeroDePeano = I ifTrue: [^false].
	^true! !

!I class methodsFor: 'as yet unclassified' stamp: 'AC 9/16/2018 18:26:36'!
SubtractTo: unMinuendo

	^unMinuendo previous! !

!I class methodsFor: 'as yet unclassified' stamp: 'Name 9/16/2018 22:06:27'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^'Solo se admite divisiones con resultado natural'! !

!I class methodsFor: 'as yet unclassified' stamp: 'AC 9/16/2018 18:34:31'!
descripcionDeErrorDeNumerosNegativosNoSoportados
	^'No se admiten numeros negativos ni el cero. Solo se admiten numeros naturales'! !

!I class methodsFor: 'as yet unclassified' stamp: 'AC 9/15/2018 12:07:05'!
next

	^II! !

!I class methodsFor: 'as yet unclassified' stamp: 'AC 9/15/2018 12:38:18'!
previous

	self error: 'El I no tiene previo'! !


!I class methodsFor: 'Operadores' stamp: 'AC 9/15/2018 12:49:10'!
* unFactor
	^unFactor! !

!I class methodsFor: 'Operadores' stamp: 'AC 9/15/2018 12:12:07'!
+ unSumando
	^unSumando next! !


!classDefinition: #II category: #NumerosDePeano!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosDePeano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: #NumerosDePeano!
II class
	instanceVariableNames: 'next prev'!

!II class methodsFor: 'Operadores' stamp: 'AC 9/15/2018 12:55:33'!
* unFactor
	^self previous * unFactor + unFactor! !

!II class methodsFor: 'Operadores' stamp: 'AC 9/15/2018 12:36:43'!
+ unSumando
	^self previous + unSumando next! !

!II class methodsFor: 'Operadores' stamp: 'AC 9/16/2018 18:26:36'!
- unSustraendo
	
	^unSustraendo SubtractTo: self! !

!II class methodsFor: 'Operadores' stamp: 'Name 9/16/2018 22:07:49'!
-- unSustraendo
	
	unSustraendo = I ifTrue: [^true].
	^self previous -- unSustraendo previous.! !

!II class methodsFor: 'Operadores' stamp: 'Name 9/16/2018 22:08:05'!
/ unDivisor
	self < unDivisor ifTrue:[self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor].	
	unDivisor = I ifTrue: [^self].
	self = unDivisor ifTrue: [^I].
	^((self - unDivisor) / unDivisor) next! !

!II class methodsFor: 'Operadores' stamp: 'Name 9/16/2018 22:08:20'!
< unNumeroDePeano
	
	unNumeroDePeano -- self ifFalse: [^false].
	^true! !


!II class methodsFor: 'ParaImplementacion' stamp: 'AC 9/16/2018 18:31:20'!
SubtractTo: unMinuendo

	"este objeto es el sustraendo de una resta. Realizar la operacion unMinuendo - self"
	^unMinuendo previous - self previous! !

!II class methodsFor: 'ParaImplementacion' stamp: 'AC 9/15/2018 12:36:23'!
next

	next ifNil: [
		next _ self cloneNamed: self name, 'I'.
		next previous: self.
	].

	^next! !

!II class methodsFor: 'ParaImplementacion' stamp: 'AC 9/15/2018 12:36:43'!
previous
	^prev! !

!II class methodsFor: 'ParaImplementacion' stamp: 'AC 9/15/2018 12:36:23'!
previous: unNumeroDePeano

	prev _ unNumeroDePeano! !


!II class methodsFor: 'as yet unclassified' stamp: 'Name 9/16/2018 22:07:17'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^'Solo se admite divisiones con resultado natural'! !

!II class methodsFor: 'as yet unclassified' stamp: 'AC 9/16/2018 18:50:37'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := III.
	prev := I.! !

II instVarNamed: 'next' put: III!
II instVarNamed: 'prev' put: I!

!classDefinition: #III category: #NumerosDePeano!
DenotativeObject subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosDePeano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'III class' category: #NumerosDePeano!
III class
	instanceVariableNames: 'next prev'!

!III class methodsFor: 'Operadores' stamp: 'Name 9/16/2018 22:10:04'!
* unFactor
	^self previous * unFactor + unFactor! !

!III class methodsFor: 'Operadores' stamp: 'Name 9/16/2018 22:10:04'!
+ unSumando
	^self previous + unSumando next! !

!III class methodsFor: 'Operadores' stamp: 'Name 9/16/2018 22:10:04'!
- unSustraendo
	
	^unSustraendo SubtractTo: self! !

!III class methodsFor: 'Operadores' stamp: 'Name 9/16/2018 22:10:04'!
-- unSustraendo
	
	unSustraendo = I ifTrue: [^true].
	^self previous -- unSustraendo previous.! !

!III class methodsFor: 'Operadores' stamp: 'Name 9/16/2018 22:10:04'!
/ unDivisor
	self < unDivisor ifTrue:[self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor].	
	unDivisor = I ifTrue: [^self].
	self = unDivisor ifTrue: [^I].
	^((self - unDivisor) / unDivisor) next! !

!III class methodsFor: 'Operadores' stamp: 'Name 9/16/2018 22:10:04'!
< unNumeroDePeano
	
	unNumeroDePeano -- self ifFalse: [^false].
	^true! !


!III class methodsFor: 'ParaImplementacion' stamp: 'Name 9/16/2018 22:10:04'!
SubtractTo: unMinuendo

	"este objeto es el sustraendo de una resta. Realizar la operacion unMinuendo - self"
	^unMinuendo previous - self previous! !

!III class methodsFor: 'ParaImplementacion' stamp: 'Name 9/16/2018 22:10:04'!
next

	next ifNil: [
		next _ self cloneNamed: self name, 'I'.
		next previous: self.
	].

	^next! !

!III class methodsFor: 'ParaImplementacion' stamp: 'Name 9/16/2018 22:10:04'!
previous
	^prev! !

!III class methodsFor: 'ParaImplementacion' stamp: 'Name 9/16/2018 22:10:04'!
previous: unNumeroDePeano

	prev _ unNumeroDePeano! !


!III class methodsFor: 'as yet unclassified' stamp: 'Name 9/16/2018 22:10:04'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^'Solo se admite divisiones con resultado natural'! !

!III class methodsFor: 'as yet unclassified' stamp: 'Name 9/16/2018 22:10:04'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := III.
	prev := I.! !

III instVarNamed: 'next' put: IIII!
III instVarNamed: 'prev' put: II!

!classDefinition: #IIII category: #NumerosDePeano!
DenotativeObject subclass: #IIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosDePeano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIII class' category: #NumerosDePeano!
IIII class
	instanceVariableNames: 'next prev'!

!IIII class methodsFor: 'Operadores' stamp: 'Name 9/16/2018 22:10:13'!
* unFactor
	^self previous * unFactor + unFactor! !

!IIII class methodsFor: 'Operadores' stamp: 'Name 9/16/2018 22:10:13'!
+ unSumando
	^self previous + unSumando next! !

!IIII class methodsFor: 'Operadores' stamp: 'Name 9/16/2018 22:10:13'!
- unSustraendo
	
	^unSustraendo SubtractTo: self! !

!IIII class methodsFor: 'Operadores' stamp: 'Name 9/16/2018 22:10:13'!
-- unSustraendo
	
	unSustraendo = I ifTrue: [^true].
	^self previous -- unSustraendo previous.! !

!IIII class methodsFor: 'Operadores' stamp: 'Name 9/16/2018 22:10:13'!
/ unDivisor
	self < unDivisor ifTrue:[self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor].	
	unDivisor = I ifTrue: [^self].
	self = unDivisor ifTrue: [^I].
	^((self - unDivisor) / unDivisor) next! !

!IIII class methodsFor: 'Operadores' stamp: 'Name 9/16/2018 22:10:13'!
< unNumeroDePeano
	
	unNumeroDePeano -- self ifFalse: [^false].
	^true! !


!IIII class methodsFor: 'ParaImplementacion' stamp: 'Name 9/16/2018 22:10:13'!
SubtractTo: unMinuendo

	"este objeto es el sustraendo de una resta. Realizar la operacion unMinuendo - self"
	^unMinuendo previous - self previous! !

!IIII class methodsFor: 'ParaImplementacion' stamp: 'Name 9/16/2018 22:10:13'!
next

	next ifNil: [
		next _ self cloneNamed: self name, 'I'.
		next previous: self.
	].

	^next! !

!IIII class methodsFor: 'ParaImplementacion' stamp: 'Name 9/16/2018 22:10:13'!
previous
	^prev! !

!IIII class methodsFor: 'ParaImplementacion' stamp: 'Name 9/16/2018 22:10:13'!
previous: unNumeroDePeano

	prev _ unNumeroDePeano! !


!IIII class methodsFor: 'as yet unclassified' stamp: 'Name 9/16/2018 22:10:13'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^'Solo se admite divisiones con resultado natural'! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'Name 9/16/2018 22:10:13'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := III.
	prev := I.! !

IIII instVarNamed: 'next' put: nil!
IIII instVarNamed: 'prev' put: III!
