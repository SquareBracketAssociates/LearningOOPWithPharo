## A Digital Animal: A gluttonous Tamagotchi
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'Tamagoshi'
t := Tamagotchi new.
t openInHand
	"Print some information on the output"
	self logCr: 'hello'
	"Return the time interval between two outputs"
	^ 500
t := Tamagotchi new.
t openInHand.
t inspect
	instanceVariableNames: 'name'
	classVariableNames: ''
	category: 'Tamagoshi'
	super initialize. 
	name := 'pika'
	name := UIManager default request: 'Give a name please!'
	self logCr: 'hello, my name is ', name

	| newName |
	newName := UIManager default request: 'Give a name please'.
	newName isNil 
		ifTrue: [ ]
		ifFalse: [ name := newName ]

	| newName |
	newName := UIManager default request: 'Give a name please'.
	newName isNotNil 
		ifTrue: [ name := newName ]
	"Freeze the behavior of the receiver until it receives the message unfreeze."
	self stopStepping
	"Get the receiver acting again."
	self startStepping

	super drawOn: aCanvas.
	aCanvas fillOval: self bounds
			fillStyle: self fillStyle 
			borderWidth: 3
			borderColor: Color white.

	| b m y |
	b := self bounds.
	m := b width / 2.
	y := b width / 4.
	aCanvas 
			fillOval: ((b origin   + (m - 20 @ y)) extent: 10@10)
			fillStyle: self fillStyle 
			borderWidth: 3
			borderColor: Color white.
	aCanvas 
			fillOval: ((b origin   + (m + 15 @ y)) extent: 10@10)
			fillStyle: self fillStyle 
			borderWidth: 3
			borderColor: Color white.

	super drawOn: aCanvas.
	self eyesOn: aCanvas

	| b m y middlePoint |
	b := self bounds.
	m := b width / 2.
	y := b width / 1.8.
	middlePoint := b origin +  ( m@y ).
	aCanvas 
		line: b origin + ((m-15) @ (y -5)) to:  middlePoint width: 3 color: Color black.
	aCanvas 
		line: b origin + ((m+15) @ (y -5)) to: middlePoint width: 3 color: Color black.

	super drawOn: aCanvas.
	self eyesOn: aCanvas.
	self mouthOn: aCanvas.
	instanceVariableNames: 'name tummy'
	classVariableNames: ''
	category: 'Tamagoshi'

	super initialize. 
	self useRoundedCorners.
	self extent: 100@80.
	name := 'pika'.
	tummy := 5.

	self logCr: 'hello, my name is ', name, ' and my tummy is: ', tummy printString.
	aCanvas
		drawString: tummy printString
		at: self bounds corner - (20 @ 20)
		font: nil
		color: Color yellow

	super drawOn: aCanvas.
	self eyesOn: aCanvas.
	self mouthOn: aCanvas.
	self tummyOn: aCanvas. 

	tummy := tummy + 1

	tummy := tummy + 1.
	self changed.
	"Returning true means that the morph can react to mouse click"

	^ true
	
	self eat.	

	tummy < 55
		ifTrue: [ tummy := tummy + 1
				  self changed]. 

	self logCr: 'hello, my name is ', name, ' and my tummy is: ', tummy printString.

	self talk.

	tummy := tummy - 1.
	self changed.

	tummy := aNumber.
	self changed.

	self tummy: tummy - 1.

	tummy < 55
		ifTrue: [ self tummy: tummy + 1 ]. 

	self talk.
	self digest.
	tummy = 0 
		ifFalse: [ self tummy: tummy - 1]
	instanceVariableNames: 'name tummy hours'
	classVariableNames: ''
	category: 'Tamagoshi'

	super initialize. 
	self useRoundedCorners.
	self extent: 100@80.
	name := 'pika'.
	tummy := 5.
	hours := 0.
	
	hours := hours + 1

	self talk.
	self nextHour.
	self digest

	self talk.
	self nextHour.
	(hours isDivisibleBy: 3)
		ifTrue: [self digest ]

	^ tummy isZero
	self isHungry
		ifFalse: [ self tummy: tummy - 1]

	| b m y middlePoint |
	b := self bounds.
	m := b width / 2.
	y := b width / 1.8.
	middlePoint := b origin +  ( m@y ).
	aCanvas 
		line: b origin + ((m-15) @ (y + 5)) to:  middlePoint width: 3 color: Color black.
	aCanvas 
		line: b origin + ((m+15) @ (y + 5)) to: middlePoint width: 3 color: Color black.

	self isHungry
		ifTrue: [ self logCr: 'Please feed me' ]
		ifFalse: [ self logCr: 'hello, my name is ', name, ' and I''m ok'].
	instanceVariableNames: 'name tummy hours isNight'
	classVariableNames: ''
	category: 'Tamagoshi'

	super initialize. 
	self useRoundedCorners.
	self extent: 100@80.
	name := 'pika'.
	tummy := 5.
	hours := 0.
	isNight := false

	^ isNight
	"Switch from night to day and day to night"
	isNight := isNight not.
	"Switch from night to day and day to night when necessary" 

	(hours isDivisibleBy: 12)
		ifTrue: [ self switchDayPeriod ]
	self isNight
		ifTrue: [ self logCr: 'ZZZzzzzzzz' ]
		ifFalse: [ 
			self isHungry
				ifTrue: [ self logCr: 'Please feed me' ]
				ifFalse: [ self logCr: 'hello, my name is ' , name , ' and I''m ok' ] ]

	| b m y |
	b := self bounds.
	m := b width / 2.
	y := b width / 4.
	aCanvas 
			fillOval: ((b origin   + (m - 20 @ y)) extent: 11@5)
			fillStyle: self fillStyle 
			borderWidth: 3
			borderColor: Color white.
	aCanvas 
			fillOval: ((b origin   + (m + 15 @ y)) extent: 11@5)
			fillStyle: self fillStyle 
			borderWidth: 3
			borderColor: Color white.
	super drawOn: aCanvas.
	self isNight
		ifTrue: [ 
				self sleepyEyesOn: aCanvas.
				self color: Color darkGray ]
		ifFalse: [ 
			self eyesOn: aCanvas.
			self isHungry
				ifTrue: [ 
					self color: Color red.
					self hungryMouthOn: aCanvas ]
				ifFalse: [ 
					self color: Color blue.
					self mouthOn: aCanvas ] ].
	self bellyOn: aCanvas.
	self changed.