## Stone Paper Scissors
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'StonePaperScissors'
	self assert: (Stone new play: Paper new) = #paper
	self assert: (Scissors new play: Paper new) = #scissors
	self assert: (Stone new play: Stone new) = #draw
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'StonePaperScissors'
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'StonePaperScissors'
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'StonePaperScissors'
	self assert: (Stone new play: Paper new) = #paper
	^ anotherTool playAgainstStone: self
	^ #paper
	^ #stone
	^ #draw
	self assert: (Scissors new play: Paper new) = #scissors
	^ anotherTool playAgainstScissors: self
	^ #draw
	^ #scissors
	^ #stone
	^ anotherTool playAgainstPaper: self
	^ #scissors
	^ #draw
	^ #paper
	ifTrue: [ do something for aGameElement]
	(aGameElement play: anotherGameElement) = -1 
	onDraw: [ Game incrementDraw ]
	onReceiverWin: [ ]
	onReceiverLose: [ ]
	onDraw: [ ]
	onReceiverWin: [ Game incrementPaper ]
	onReceiverLose: [ ]
	^ anElement
		playAgainstPaper: self
		onDraw: aDrawBlock
		onReceiverWin: aWinBlock
		onReceiverLose: aLoseBlock
	^ aDrawBlock value