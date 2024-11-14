## Snake and ladder solutions


### A first real test

```
SLGame >> tileNumber: aNumber

	tiles := Array new: aNumber.
	1 to: aNumber do: [ :i |
		tiles at: i put: (SLTile new position: i) ]
```

```
SLGame >> tileNumber
	
	^ tiles size
```

### Accessing on tile

```
SLGame >> tileAt: aNumber

	^ tiles at: aNumber
```

### Adding players

```
SLPlayer >> name: aString 
	name := aString
```


```
Object << #SLTile
	slots: { #position . #players};
	package: 'SnakesAndLadders'
```


```
SLGame >> initialize
	players := OrderedCollection new. 
```


```
SLTile >> addPlayer: aPlayer	
	players add: aPlayer
```


```
SLTile >> players 
	^ players
```


### Displaying players


```
SLPlayer >> printOn: aStream
	aStream << '<' << name << '>'
```


### Avoid leaking implementation information


```
SLTile >> includesPlayer: aPlayer
	^ players includes: aPlayer
```

### Preparing to move players

```
SLPlayer >> position
	^ position
```


```
SLPlayer >> position: anInteger 
	position := anInteger
```


```
Object << #SLPlayer
	slots: { #name . #position} ;
	package: 'SnakesAndLadders'
```


```
SLGame >> addPlayer: aPlayer
	aPlayer position: 1.
	(tiles at: 1) addPlayer: aPlayer
```


```
SLGame >> tileFor: aPlayer atDistance: aNumber
	
	^ self tileAt: (aPlayer position + aNumber)
```



### Finding the tile of a player


```
SLGame >> tileOfPlayer: aSLPlayer 
	^ tiles at: aSLPlayer position
```



### Moving a player


```
SLTile >> removePlayer: aPlayer
	players remove: aPlayer
```


```
SLGame >> movePlayer: aPlayer distance: anInteger 
	| targetTile | 
	targetTile := self tileFor: aPlayer atDistance: anInteger.
	(self tileOfPlayer: aPlayer) removePlayer: aPlayer.
	targetTile addPlayer: aPlayer. 
	aPlayer position: targetTile position. 
```



### New printing hook


```
SLAbstractTile >> printOn: aStream

	aStream << '['.
	self printInsideOn: aStream.
	aStream << ']'	
```



```
SLLadderTile >> printInsideOn: aStream

	super printInsideOn: aStream.
	aStream << '->'.
	targetTile position printOn: aStream
```



### Snake and ladder declaration


```
SLGame >> setSnakeFrom: aSourcePosition to: aTargetPosition

	tiles 
		at: aSourcePosition 
		put: (SLSnakeTile new 
				position: aSourcePosition; 
				to: (tiles at: aTargetPosition) ; yourself)
```


```
SLGame >> setLadderFrom: aSourcePosition to: aTargetPosition

	tiles 
		at: aSourcePosition 
		put: (SLLadderTile new 
				position: aSourcePosition ; 
				to: (tiles at: aTargetPosition) ; yourself)
```


### Active tile actions


```
SLActiveTile >> acceptPlayer: aPlayer
	targetTile acceptPlayer: aPlayer
```



### Player turns and current player



```
Object << #SLGame
	slots: { #tiles . #players . #turn };
	package: 'SnakesAndLadders'
```


```
SLGame >> initialize
	players := OrderedCollection new. 
	turn := 0
```


### Game end


```
SLGame >> isOver

	^ players anySatisfy: [ :each | each position = tiles size ]
```


### Playing one move

```
SLGame >> canMoveToPosition: aNumber
	"We can only move if we stay within the game.
	This implies that the player should draw an exact number to land on the finish tile."
	
	^ aNumber <= tiles size
```

