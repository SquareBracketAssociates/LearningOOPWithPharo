## Revisiting the Die DSL: a Case for Double Dispatch
	| handle |
	handle := DieHandle new
		addDice: (Dice faces: 6);
		addDice: (Dice faces: 10);
		yourself.
	self assert: handle diceNumber = 2
	| handle |
	handle := 2 D20 + 3 D10.
	self assert: handle diceNumber = 5
	"Returns a new handle that represents the addition of the receiver and the argument."
	| handle |
	handle := self class new.
	self dice do: [ :each | handle addDie: each ].
	aDieHandle dice do: [ :each | handle addDie: each ].
	^ handle
	| hd |
	hd := (Die withFaces: 6) + (Die withFaces: 6).
	self assert: hd dice size = 2.
	| hd |
	hd := (Die faces: 6)
		+
		(DieHandle new
			addDie: 6;
			yourself).
	self assert: hd dice size equals: 2
	| handle res |
	handle := DieHandle new
		addDie: (Die faces: 6);
		addDie: (Die faces: 10);
		yourself.
	res := handle + (Die faces: 20).
	self assert: res diceNumber equals: 3

	^ (aDieOrADieHandle class = DieHandle) 
		ifTrue: [ | handle |
					handle := self class new.
					self dice do: [ :each | handle addDie: each ].
					aDieOrADieHandle dice do: [ :each | handle addDie: each ].
					handle ]
		ifFalse: [ | handle |
					handle := self class new.
					self dice do: [ :each | handle addDie: each ].
					handle addDie: aDie.
					handle  ]
	| selfAsDieHandle |
	selfAsDieHandle := DieHandle new addDie: self.
	^ selfAsDieHandle + aDieOrADieHandle
	
	^ DieHandle new 
		addDie: self; 
		addDie: aDie; yourself
	| hd |
	hd := (Die faces: 6)
		+
		(DieHandle new
			addDie: 6;
			yourself).
	self assert: hd dice size equals: 2

	^ DieHandle new
		addDie: self;
		addDie: aDie; yourself
	^ aDicable sumWithDie: self
	| handle |
	handle := self class new.
	self dice do: [ :each | handle addDie: each ].
	handle addDie: aDie.
	^ handle
	| handle |
	handle := self class new.
	self dice do: [ :each | handle addDie: each ].
	aDieHandle dice do: [ :each | handle addDie: each ].
	^ handle
	^ aDicable sumWithHandle: self
	| handle |
	handle := DieHandle new.
	aDieHandle dice do: [ :each | handle addDie: each ].
	handle addDie: self
	^ handle
	| handle res |
	handle := DieHandle new
		addDie: (Die faces: 6);
		addDie: (Die faces: 10);
		yourself.
	res := handle + (Die faces: 20).
	self assert: res diceNumber equals: 3