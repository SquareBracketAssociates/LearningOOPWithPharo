## A little expression interpreter
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'Expressions'
	self assert: (EConstant new value: 5) evaluate equals: 5
	instanceVariableNames: 'value'
	classVariableNames: ''
	package: 'Expressions'
	value := anInteger
	... Your code ...
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'Expressions'
	self assert: (ENegation new expression: (EConstant new value: 5)) evaluate equals: -5
	instanceVariableNames: 'expression'
	classVariableNames: ''
	package: 'Expressions'
	expression := anExpression
	... Your code ...
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'Expressions'
	| ep1 ep2 |
	ep1 := (EConstant new value: 5).
	ep2 := (EConstant new value: 3).
	self assert: (EAddition new right: ep1; left: ep2) evaluate equals: 8
	instanceVariableNames: 'left right'
	classVariableNames: ''
	package: 'Expressions'
	... Your code ...
	| ep1 ep2 |
	ep1 := ENegation new expression: (EConstant new value: 5).
	ep2 := (EConstant new value: 3).
	self assert: (EAddition new right: ep1; left: ep2) evaluate equals: -2
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'Expressions'
	| ep1 ep2 |
	ep1 := (EConstant new value: 5).
	ep2 := (EConstant new value: 3).
	self assert: (EMultiplication new right: ep1; left: ep2) evaluate equals: 15
	instanceVariableNames: 'left right'
	classVariableNames: ''
	package: 'Expressions'
	right := anExpression
	left := anExpression
	... Your code ...
	operator = #+ 
		ifTrue: [ left evaluate + right evaluate ] 
		ifFalse: [ left evaluate * right evaluate]
	self assert: (EConstant new value: 6) negated evaluate equals: -6
	^ ENegation new expression: self
	self assert: (EConstant new value: 6) negated negated evaluate equals: 6
	^ ENegation new expression: self
	^ self class new expression: self
	| ep1 ep2 |
	ep1 := EConstant new value: 5.
	ep2 := EConstant new value: 3.
	self assert: (EAddition new right: ep1; left: ep2) negated evaluate equals: -8
	Your code
	| ep1 ep2 |
	ep1 := EConstant new value: 5.
	ep2 := EConstant new value: 3.
	self assert: (EMultiplication new right: ep1; left: ep2) negated evaluate equals: -15
	... Your code ...
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'Expressions'
	instanceVariableNames: 'value'
	classVariableNames: ''
	package: 'Expressions'
	^ self new value: anInteger
	self assert: (EConstant value: 5) evaluate equals: 5
	... Your code ...
	self assert: (ENegation expression: (EConstant value: 5)) evaluate equals: -5
	^ self new left: anInteger ; right: anInteger2 
	| ep1 ep2 |
	ep1 := EConstant constant5.
	ep2 := EConstant constant3.
	self assert: (EAddition left: ep1 right: ep2) evaluate equals: 8
	... Your code ...
	| ep1 ep2 |
	ep1 := EConstant new value: 5.
	ep2 := EConstant new value: 3.
	self assert: (EMultiplication new left: ep1; right: ep2) evaluate equals: 15
	| ep1 ep2 |
	ep1 := EConstant new value: 5.
	ep2 := EConstant new value: 3.
	self assert: (EAddition new right: ep1; left: ep2) negated evaluate equals: -8
	^ self new value: 5
	^ self new value: 3
	| ep1 ep2 |
	ep1 := EConstant constant5.
	ep2 := EConstant constant3.
	self assert: (EAddition new right: ep1; left: ep2) negated evaluate equals: -8
	<sampleInstance>
	^ self new value: 3
	<sampleInstance>
	| ep1 ep2 |
	ep1 := EConstant new value: 5.
	ep2 := EConstant new value: 3.
	^ self new left: ep1 ; right: ep2 
	<sampleInstance>
	| ep1 ep2 |
	ep1 := EConstant constant5.
	ep2 := EConstant constant3.
   ^ EMultiplication new left: ep1 ; right: ep2 
	"Append to the argument, aStream, a sequence of characters that  
	identifies the receiver."
	| title |
	title := self class name.
	aStream
		nextPutAll: (title first isVowel ifTrue: ['an '] ifFalse: ['a ']);
		nextPutAll: title
	self assert: (EConstant value: 5) printString equals: '5'
	aStream nextPutAll: value printString
>>> '6'
	aStream nextPutAll: '- '
	aStream nextPutAll: expression printString
	aStream 
		nextPutAll: '- ';
		nextPutAll: expression printString
	aStream nextPutAll: '- '.
	expression printOn: aStream
	self assert: (EAddition fivePlusThree) printString equals:  '( 5 + 3 )'.
	self assert: (EAddition fivePlusThree) negated printString equals:  '- ( 5 + 3 )'
	... Your code ...
	self assert: (EMultiplication fiveTimesThree) negated printString equals:  '- ( 5 * 3 )'
	... Your code ...
>> '- 11'

(EConstant value: 11) negated negated
>> '- - 11'
	| exp |
	exp := EConstant value: 11.
	self assert: exp negated class = ENegation. 
	self assert: exp negated negated equals: exp.
	... Your code ...
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'Expressions'
	instanceVariableNames: 'left right'
	classVariableNames: ''
	package: 'Expressions'
	instanceVariableNames: 'left right'
	classVariableNames: ''
	package: 'Expressions'
	instanceVariableNames: 'left right'
	classVariableNames: ''
	package: 'Expressions'
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'Expressions'
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'Expressions'
	aStream nextPutAll: '( '.
	left printOn: aStream. 
	aStream nextPutAll: ' + '.
	right printOn: aStream.
	aStream nextPutAll: ' )'
	aStream nextPutAll: '( '.
	left printOn: aStream.
	aStream nextPutAll: self operatorString.
	right printOn: aStream.
	aStream nextPutAll: ' )'
	^ ' + '
	^ ' * '
	^ ' + '
	^ ' * '
	^ ' + '
	^ ' * '
	^ self subclassResponsibility
	self assert: ((EVariable new id: #x) evaluateWith: {#x -> 10} asDictionary) equals: 10.
d := Dictionary new
	at: #x put: 33;
	at: #y put: 52;
	at: #z put: 98.
d at: y
>>> 52 
>>> 52 
>>> ==#(5 4 5)==
p := #x -> 10.
p key 
>>> #x
p value
>>> 10
	instanceVariableNames: 'id'
	classVariableNames: ''
	package: 'Expressions'
	id := aSymbol
	aStream nexPutAll: id asString
	^ aBindingDictionary at: id
	self assert: ((EVariable new id: #x) negated
		evaluateWith: {#x -> 10} asDictionary) equals: -10
	| ep1 ep2 add |
	ep1 := EVariable new id: #x.
	ep2 := EVariable new id: #y.
	add := EAddition left: ep1 right: ep2.
	
	self assert: (add evaluateWith: { #x -> 10 . #y -> 2 } asDictionary) equals: 12.
	self assert: (add evaluateWith: { #x -> 10 . #y -> 12 } asDictionary) equals: 22
	^ self evaluate
	self assert: (EConstant constant5) evaluate equals: 5
	self assert: ((EConstant constant5) evaluateWith: Dictionary new) equals: 5
	^ (right evaluateWith: Dictionary new) + (left evaluateWith: Dictionary new)
	^ (right evaluateWith: anObject) + (left evaluateWith: anObject)
	^ (expression evaluateWith: anObject) negated