## Expressions solutions@cha:expressionssolutionsHere are the possible solutions of the implementation we asked for the Expression Chapter *@cha:expressions@*.### Evaluate message```EConstant >> evaluate
	^ value``````ENegation >> evaluate
	^ expression evaluate negated``````EAddition >> evaluate
	^ left evaluate + right evaluate``````EMultiplication  >> evaluate
	^ left evaluate + right evaluate```### Negated message```EAddition >>> negated 
	^ ENegation new expression: self``````EMultiplication >>> negated 
	^ ENegation new expression: self```### Better class instance creation interface```ENegation class >> expression: anExpression
	^ self new expression: anExpression``````EMultiplication class >>	left: anExp right: anExp2
	^ self new left: anExp ; right: anExp2```### Printing addition and multiplication```EAddition >> printOn: aStream
	aStream nextPutAll: '( '.
	left printOn: aStream. 
	aStream nextPutAll: ' + '.
	right printOn: aStream.
	aStream nextPutAll: ' )'``````Emultiplication >> printOn: aStream
	aStream nextPutAll: '( '.
	left printOn: aStream. 
	aStream nextPutAll: ' * '.
	right printOn: aStream.
	aStream nextPutAll: ' )'```### Negated negation```ENegation >> negated
	^ expression```### evaluateWith:```EMultiplication >> evaluateWith: anObject
	^ (right evaluateWith: anObject) + (left evaluateWith: anObject)```