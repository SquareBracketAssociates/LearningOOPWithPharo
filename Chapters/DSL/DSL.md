## Crafting a simple embedded DSL with Pharo
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'Dice'
    self assert: Die new faces equals: 6
	... Your solution ...
	... Your solution ...
	^ faces
	... Your solution ...
	| d |
	d := Die new.
	10 timesRepeat: [ self assert: (d roll between: 1 and: 6) ]
	self assert: (Die withFaces: 20) faces equals: 20
	"Create and initialize a new die with aNumber faces."
	| instance |
	instance := self new.
	instance faces: aNumber.
	^ instance
	faces := aNumber
	^ self new faces: aNumber; yourself
	faces := aNumber. 
	^ 33
	addDie: (Die withFaces: 6);
	addDie: (Die withFaces: 10);
	yourself
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'Dice'
	| handle |
	handle := DieHandle new 
			addDie: (Die withFaces: 6);
			addDie: (Die withFaces: 10);
			yourself.
	self assert: handle diceNumber = 2.
	| handle |
	handle := DieHandle new. 
	handle addDie: (Die withFaces: 6).
	self assert: handle diceNumber = 1.
	handle addDie: (Die withFaces: 6).
	self assert: handle diceNumber = 2.
	... Your solution ...
	... Your solution ...
	... Your solution ...
	addDie: (Die withFaces: 6);
	addDie: (Die withFaces: 10);
	yourself
	^ dice size
	addDie: (Die withFaces: 6);
	addDie: (Die withFaces: 10);
	yourself

	super printOn: aStream.
	aStream nextPutAll: ' (', faces printString, ')'
	
	super printOn: aStream.
	aStream 
		nextPutAll: '(';
		print: faces; 
		nextPutAll: ')'
	... Your solution ...
		addDie: (Die withFaces: 6);
		addDie: (Die withFaces: 10);
		yourself.
handle roll
	... Your solution ...
col := OrderedCollection new. 
col add: (Die withFaces: 20).
col add: (DieHandle new addDie: (Die withFaces: 4); yourself).
(col collect: [:each | each roll]) asArray
>>> #(17 3) 
	self assert: 2 D20 diceNumber = 2.
	... Your solution ...
	... Your solution ...
	^ self D: 4
	^ self D: 6
	^ self D: 10
	^ self D: 20
	| handle |
	handle := 2 D20 + 3 D10.
	self assert: handle diceNumber = 5.
	... Your solution ... 