## Die DSL 
	instanceVariableNames: 'faces'
	classVariableNames: ''
	package: 'Dice'
	super initialize.
	faces := 6
    ^ faces atRandom
	instanceVariableNames: 'dice'
	classVariableNames: ''
	package: 'Dice'
	super initialize.
	dice := OrderedCollection new.
	dice add: aDie
	| handle |
	handle := DieHandle new
		addDie: (Die withFaces: 6);
		addDie: (Die withFaces: 10);
		yourself.
	1000 timesRepeat: [ handle roll between: 2 and: 16 ]
	
	| res |
	res := 0.
	dice do: [ :each | res := res + each roll ].
	^ res
	| handle |
	handle := DieHandle new.
	self timesRepeat: [ handle addDie: (Die withFaces: 20)].
	^ handle
	
	| handle |
	handle := DieHandle new.
	self timesRepeat: [ handle addDie: (Die withFaces: anInteger)].
	^ handle
	"Returns a new handle that represents the addition of the receiver and the argument."
	| handle |
	handle := self class new.
	self dice do: [ :each | handle addDie: each ].
	aDieHandle dice do: [ :each | handle addDie: each ].
	^ handle
	^ dice 