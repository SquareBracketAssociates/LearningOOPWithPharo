```Object subclass: #ESRIParser
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ESRI'``````ESRIParserTest >> testCutLines

	| lines parser |
	parser := ESRIParser new.
	parser cutLines: 'NCOLS xxx
NROWS xxx
XLLCORNER xxx
YLLCORNER xxx'. 
	self assert: parser lines first equals: 'NCOLS xxx'.
	self assert: parser lines size equals: 4.``````ESRIParserTest >> testCutLines

	| lines parser |
	parser := ESRIParser new.
	parser cutLines: 'NCOLS xxx
NROWS xxx
XLLCORNER xxx
YLLCORNER xxx'. 
	self assert: parser lines first equals: 'NCOLS xxx'.
	self assert: parser lines size equals: 4.``````ESRIParserTest >> testCutLines

	| parser |
	parser := ESRIParser new.
	parser cutLines: 'NCOLS xxx
NROWS xxx
XLLCORNER xxx
YLLCORNER xxx'. 
	self assert: parser lines first equals: 'NCOLS xxx'.
	self assert: parser lines size equals: 4.``````ESRIParser >> cutLines: aString 
	self shouldBeImplemented.``````Object subclass: #ESRIParser
	instanceVariableNames: 'lines'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ESRI'``````ESRIParser >> cutLines: aString 
	| str | 
	lines := OrderedCollection new. 
	str := aString readStream.
	[ str atEnd ] whileFalse: 
		[ lines add: (str upTo: Character cr) ].
	^ lines
	``````ESRIParser >> lines
	^ lines``````Object subclass: #ESRIRaster
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ESRI'``````ESRIParserTest >> testCutLines

	| parser |
	parser := ESRIParser new.
	parser parser handeline: 'NCOLS 2'
	self assert: parser raster numberOfColumns equals: 2``````ESRIParserTest >> testHandleNCols

	| parser |
	parser := ESRIParser new.
	parser parser handeline: 'NCOLS 2'
	self assert: parser raster numberOfColumns equals: 2``````ESRIParserTest >> testCutLines

	| parser |
	parser := ESRIParser new.
	parser cutLines: 'NCOLS xxx
NROWS xxx
XLLCORNER xxx
YLLCORNER xxx'. 
	self assert: parser lines first equals: 'NCOLS xxx'.
	self assert: parser lines size equals: 4.``````ESRIParserTest >> testHandleNCols

	| parser |
	parser := ESRIParser new.
	parser parser handeline: 'NCOLS 2'.
	self assert: parser raster numberOfColumns equals: 2``````ESRIParserTest >> testHandleNCols

	| parser |
	parser := ESRIParser new.
	parser handeline: 'NCOLS 2'.
	self assert: parser raster numberOfColumns equals: 2``````ESRIParser >> handeline: aString 
	self shouldBeImplemented.``````Object subclass: #ESRIParser
	instanceVariableNames: 'lines raster'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ESRI'``````Object subclass: #ESRIParser
	instanceVariableNames: 'lines raster builderMapping'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ESRI'``````ESRIParser >> handeline: aString 
	
	| contents |
	contents := (aString splitOn: Character space).
	raster perform: (builderMapping at: contents first lowercase asSymbol) with: contents second asNumber. 
	``````Object subclass: #ESRIRaster
	instanceVariableNames: 'numberOfColumns numberOfRows xllcenter yllcenter cellSize noData rows'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ESRI'``````ESRIRaster >> numberOfColumns
	^ numberOfColumns``````ESRIRaster >> numberOfColumns: anObject
	numberOfColumns := anObject``````ESRIRaster >> numberOfRows
	^ numberOfRows``````ESRIRaster >> numberOfRows: anObject
	numberOfRows := anObject``````ESRIRaster >> xllcenter
	^ xllcenter``````ESRIRaster >> xllcenter: anObject
	xllcenter := anObject``````ESRIRaster >> yllcenter
	^ yllcenter``````ESRIRaster >> yllcenter: anObject
	yllcenter := anObject``````ESRIRaster >> cellSize
	^ cellSize``````ESRIRaster >> cellSize: anObject
	cellSize := anObject``````ESRIRaster >> noData
	^ noData``````ESRIRaster >> noData: anObject
	noData := anObject``````ESRIRaster >> rows
	^ rows``````ESRIRaster >> rows: anObject
	rows := anObject``````ESRIParser >> initialize 
	super initialize. 
	raster := ESRIRaster new.``````ESRIParser >> initialize 
	super initialize. 
	raster := ESRIRaster new.``````ESRIParser >> handeline: aString 
	
	| contents |
	contents := (aString splitOn: Character space).
	raster 
		perform: (builderMapping at: contents first lowercase asSymbol) 
		with: contents second asNumber. 
	``````ESRIParser >> initialize 
	super initialize. 
	raster := ESRIRaster new.
	self initializeBuilderMapping``````ESRIParser >> initializeBuilderMapping``````ESRIParser >> initializeBuilderMapping

	``````ESRIParser >> initializeBuilderMapping

	builderMapping := Dictionary new. 
	builderMapping at: #ncols put: #numberOfColumns:.
	builderMapping at: #nrows put: #numberOfRows:.
	builderMapping at: #xllcenter put: #xllcenter:.
	builderMapping at: #yllcenter put: #xllcenter:.
	builderMapping at: #cellsize put: #cellSize:.
	builderMapping at: #nodata_value put: #noData:.
	``````ESRIRaster >> initialize

	super initialize. 
	noData := -9999``````ESRIRaster >> initialize

	super initialize. 
	noData := -9999``````ESRIParser >> handeline: aString 
	
	| contents |
	contents := (aString splitOn: Character space).
	raster 
		perform: (builderMapping at: contents first asLowercase asSymbol) 
		with: contents second asNumber. 
	``````ESRIParser >> raster
	^ raster``````ESRIParserTest >> testHandleNRows

	| parser |
	parser := ESRIParser new.
	parser handeline: 'nrows 2'.
	self assert: parser raster numberOfRows equals: 2``````ESRIParserTest >> testHandlexllcorner

	| parser |
	parser := ESRIParser new.
	parser handeline: 'xllcorner 378923'.
	self assert: parser raster numberOfRows equals: 378923``````Object subclass: #ESRIRaster
	instanceVariableNames: 'numberOfColumns numberOfRows xllcenter yllcenter xllcorner yllcorner cellSize noData rows'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ESRI'``````ESRIRaster >> xllcorner
	^ xllcorner``````ESRIRaster >> xllcorner: anObject
	xllcorner := anObject``````ESRIRaster >> yllcorner
	^ yllcorner``````ESRIRaster >> yllcorner: anObject
	yllcorner := anObject``````ESRIParser >> initializeBuilderMapping

	builderMapping := Dictionary new. 
	builderMapping at: #ncols put: #numberOfColumns:.
	builderMapping at: #nrows put: #numberOfRows:.
	builderMapping at: #xllcenter put: #xllcenter:.
	builderMapping at: #yllcenter put: #xllcenter:.
	builderMapping at: #xllcorner put: #xllcorner:.
	builderMapping at: #yllcorner put: #xllcorner:.
	builderMapping at: #cellsize put: #cellSize:.
	builderMapping at: #nodata_value put: #noData:.
	``````ESRIParserTest >> testHandlexllcorner

	| parser |
	parser := ESRIParser new.
	parser handeline: 'xllcorner 378923'.
	self assert: parser raster xllcorner equals: 378923``````ESRIRaster >> initialize

	super initialize. 
	noData := -9999.``````ESRIRaster >> initialize

	super initialize. 
	noData := -9999.
	numberOfColumns := 0.
	numberOfRows := 0. 
	xllcenter := 0. 
	yllcenter := 0. 
	xllcorner := 0. 
	yllcorner := 0. 
	cellSize := 0.
	rows := OrderedCollection new. ``````ESRIParserTest >> testHandleCellSize

	| parser |
	parser := ESRIParser new.
	parser handeline: 'CELLSIZE 30'.
	self assert: parser raster cellSize equals: 30``````ESRIParser >> cutLines: aString 
	| str | 
	str := aString readStream.
	[ str atEnd ] whileFalse: 
		[ self handleline: (str upTo: Character cr) ].

	``````ESRIParser >> handleLine: aString 
	
	| contents |
	contents := (aString splitOn: Character space).
	raster 
		perform: (builderMapping at: contents first asLowercase asSymbol) 
		with: contents second asNumber. 
	``````ESRIParserTest >> testHandleCellSize

	| parser |
	parser := ESRIParser new.
	parser handleLine: 'CELLSIZE 30'.
	self assert: parser raster cellSize equals: 30``````ESRIParserTest >> testHandleNRows

	| parser |
	parser := ESRIParser new.
	parser handleLine: 'nrows 2'.
	self assert: parser raster numberOfRows equals: 2``````ESRIParserTest >> testHandlexllcorner

	| parser |
	parser := ESRIParser new.
	parser handleLine: 'xllcorner 378923'.
	self assert: parser raster xllcorner equals: 378923``````ESRIParserTest >> testHandleNCols

	| parser |
	parser := ESRIParser new.
	parser handleLine: 'NCOLS 2'.
	self assert: parser raster numberOfColumns equals: 2``````ESRIParser >> handeline: aString 
	
	| contents |
	contents := (aString splitOn: Character space).
	raster 
		perform: (builderMapping at: contents first asLowercase asSymbol) 
		with: contents second asNumber. 
	``````ESRIParser >> cutLines: aString 
	| str | 
	str := aString readStream.
	[ str atEnd ] whileFalse: 
		[ self handleLine: (str upTo: Character cr) ].

	``````ESRIParser >> parse: aString 
	| str | 
	str := aString readStream.
	[ str atEnd ] whileFalse: 
		[ self handleLine: (str upTo: Character cr) ].

	``````ESRIParserTest >> testCutLines

	| parser |
	parser := ESRIParser new.
	parser parse: 'NCOLS xxx
NROWS xxx
XLLCORNER xxx
YLLCORNER xxx'. 
	self assert: parser lines first equals: 'NCOLS xxx'.
	self assert: parser lines size equals: 4.``````ESRIParser >> cutLines: aString 
	| str | 
	str := aString readStream.
	[ str atEnd ] whileFalse: 
		[ self handleLine: (str upTo: Character cr) ].

	``````ESRIParser >> parse: aString 
	| str | 
	self initializeRaster.
	str := aString readStream.
	[ str atEnd ] whileFalse: 
		[ self handleLine: (str upTo: Character cr) ].

	``````ESRIParser >> initializeRaster
	raster := ESRIRaster new``````ESRIParser >> initialize
	super initialize.
	self initializeRaster.
	self initializeBuilderMapping``````ESRIParserTest >> testParse

	| parser |
	parser := ESRIParser new.
	parser parse: 'NCOLS 20
NROWS 30
XLLCORNER 2
YLLCORNER 3'. 
	self assert: parser raster numberOfColumns equals: 20.
	self assert: parser lines xllcorner equals: 2.
	self assert: parser lines yllcorner equals: 3.``````ESRIParserTest >> testParse

	| parser |
	parser := ESRIParser new.
	parser parse: 'NCOLS 20
NROWS 30
XLLCORNER 2
YLLCORNER 3'. 
	self assert: parser raster numberOfColumns equals: 20.
	self assert: parser raster xllcorner equals: 2.
	self assert: parser raster yllcorner equals: 3.``````ESRIParserTest >> testParse

	| parser |
	parser := ESRIParser new.
	parser parse: 'NCOLS 20
NROWS 30
XLLCORNER 2
YLLCORNER 3'. 
	self assert: parser raster numberOfColumns equals: 20.
	self assert: parser raster numberOfRows equals: 30.
	self assert: parser raster xllcorner equals: 2.
	self assert: parser raster yllcorner equals: 3.``````ESRIParserTest >> testCutLines

	| parser |
	parser := ESRIParser new.
	parser parse: 'NCOLS xxx
NROWS xxx
XLLCORNER xxx
YLLCORNER xxx'. 
	self assert: parser lines first equals: 'NCOLS xxx'.
	self assert: parser lines size equals: 4.``````ESRIParser >> initializeBuilderMapping

	builderMapping := Dictionary new. 
	builderMapping at: #ncols put: #numberOfColumns:.
	builderMapping at: #nrows put: #numberOfRows:.
	builderMapping at: #xllcenter put: #xllcenter:.
	builderMapping at: #yllcenter put: #yllcenter:.
	builderMapping at: #xllcorner put: #xllcorner:.
	builderMapping at: #yllcorner put: #yllcorner:.
	builderMapping at: #cellsize put: #cellSize:.
	builderMapping at: #nodata_value put: #noData:.
	``````ESRIParserTest >> testHandleNRows

	| parser |
	parser := ESRIParser new.
	parser handleLine: 'nrows 2'.
	self assert: parser raster numberOfRows equals: 2``````ESRIParserTest >> testHandlexllcorner

	| parser |
	parser := ESRIParser new.
	parser handleLine: 'xllcorner 378923'.
	self assert: parser raster xllcorner equals: 378923``````ESRIParserTest >> testHandleCellSize

	| parser |
	parser := ESRIParser new.
	parser handleLine: 'CELLSIZE 30'.
	self assert: parser raster cellSize equals: 30``````ESRIParserTest >> testHandleNCols

	| parser |
	parser := ESRIParser new.
	parser handleLine: 'NCOLS 2'.
	self assert: parser raster numberOfColumns equals: 2``````ESRIParserTest >> testParse

	| parser |
	parser := ESRIParser new.
	parser parse: 'NCOLS 20
NROWS 30
XLLCORNER 2
YLLCORNER 3'. 
	self assert: parser raster numberOfColumns equals: 20.
	self assert: parser raster numberOfRows equals: 30.
	self assert: parser raster xllcorner equals: 2.
	self assert: parser raster yllcorner equals: 3.``````ESRIParserTest >> testHandleNRows

	| parser |
	parser := ESRIParser new.
	parser handleLine: 'nrows 2'.
	self assert: parser raster numberOfRows equals: 2``````ESRIParserTest >> testHandlexllcorner

	| parser |
	parser := ESRIParser new.
	parser handleLine: 'xllcorner 378923'.
	self assert: parser raster xllcorner equals: 378923``````ESRIParserTest >> testHandleCellSize

	| parser |
	parser := ESRIParser new.
	parser handleLine: 'CELLSIZE 30'.
	self assert: parser raster cellSize equals: 30``````ESRIParserTest >> testHandleNCols

	| parser |
	parser := ESRIParser new.
	parser handleLine: 'NCOLS 2'.
	self assert: parser raster numberOfColumns equals: 2``````ESRIParserTest >> testParse

	| parser |
	parser := ESRIParser new.
	parser parse: 'NCOLS 20
NROWS 30
XLLCORNER 2
YLLCORNER 3'. 
	self assert: parser raster numberOfColumns equals: 20.
	self assert: parser raster numberOfRows equals: 30.
	self assert: parser raster xllcorner equals: 2.
	self assert: parser raster yllcorner equals: 3.``````ESRIParserTest >> testData

	``````ESRIParserTest >> testDataOneCell

	| parser |
	parser := ESRIParser new.
	parser handleLine: 'CELLSIZE 30'.
	self assert: parser raster cellSize equals: 30``````ESRIParserTest >> testData

	``````ESRIParserTest >> testDataOneCell

	| parser |
	parser := ESRIParser new.
	parser raster cellSize: 3.
	parser raster numberOfColumns: 4. 
	parser handleLine: '1 1 1 2 2 2 3 3 3 4 4 4 '.
	parser raster rows first equals: #(( 1 1 1) (2 2 2 ) (3 3 3) (4 4 4 ))``````ESRIParser >> handleLine: aString 
	
	| contents isHeader |
	contents := (aString splitOn: Character space).
	isHeader := contents size = 2 and: [ contents first isNumber not ].
	isHeader
		ifTrue: [   
			raster 
				perform: (builderMapping at: contents first asLowercase asSymbol) 
				with: contents second asNumber. ]
			
	``````ESRIParser >> handleHeader: contents
	raster
		perform: (builderMapping at: contents first asLowercase asSymbol)
		with: contents second asNumber``````ESRIParser >> handleLine: aString
	| contents isHeader |
	contents := aString splitOn: Character space.
	isHeader := contents size = 2 and: [ contents first isNumber not ].
	isHeader
		ifTrue:
			[ self handleHeader: contents ]``````ESRIParser >> handleHeader: anArray
	"anArray = #(string number)"
	raster
		perform: (builderMapping at: anArray first asLowercase asSymbol)
		with: anArray second asNumber``````ESRIParser >> handleLine: aString
	| contents isHeader |
	contents := aString splitOn: Character space.
	isHeader := contents size = 2 and: [ contents first isNumber not ].
	isHeader
		ifTrue:
			[ self handleHeader: contents ]
		ifFalse: 
			[ self handleData: contents ]``````ESRIParserTest >> testDataOneCell

	| parser |
	parser := ESRIParser new.
	parser raster cellSize: 3.
	parser raster numberOfColumns: 4. 
	parser handleData: '1 1 1 2 2 2 3 3 3 4 4 4 '.
	parser raster rows first equals: #(( 1 1 1) (2 2 2 ) (3 3 3) (4 4 4 ))``````ESRIParser >> handleData: anArray
	""
	raster
		perform: (builderMapping at: anArray first asLowercase asSymbol)
		with: anArray second asNumber``````ESRIParser >> handleHeader: anArray
	"anArray = #(string numberizedString)"
	raster
		perform: (builderMapping at: anArray first asLowercase asSymbol)
		with: anArray second asNumber``````ESRIParserTest >> testDataOneCell

	| parser |
	parser := ESRIParser new.
	parser raster numberOfColumns: 4. 
	parser handleData: '-9999 -9999 5 2'.
	parser raster rows first equals: #(-9999 -9999 5 2)``````ESRIParser >> handleData: anArray
	
	| row |
	row := Array new: raster numbersOfColumns.
	"doing it this way I cut extra values that would overflow the columns numbers.
	I could have just iterated on the argument and change its contents too."
	1 to: raster numbersOfColumns do: [ :e | row at: e put: (anArray at: e) asNumber].
	raster addRow: row.``````ESRIParser >> handleData: anArray
	
	| row |
	row := Array new: raster numberOfColumns.
	"doing it this way I cut extra values that would overflow the columns numbers.
	I could have just iterated on the argument and change its contents too."
	1 to: raster numberOfColumns do: [ :e | row at: e put: (anArray at: e) asNumber].
	raster addRow: row.``````ESRIRaster >> addRow: aRow

	rows add: aRow``````ESRIParserTest >> testDataOneCell

	| parser |
	parser := ESRIParser new.
	parser raster numberOfColumns: 4. 
	parser handleData: #('-9999' '-9999' '5' '2').
	parser raster rows first equals: #(-9999 -9999 5 2)``````ESRIParserTest >> testDataOneCell

	| parser |
	parser := ESRIParser new.
	parser raster numberOfColumns: 4. 
	parser handleData: #('-9999' '-9999' '5' '2').
	self assert: parser raster rows first equals: #(-9999 -9999 5 2)``````ESRIParser >> lines
	^ lines``````Object subclass: #ESRIParser
	instanceVariableNames: 'raster builderMapping'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ESRI'``````ESRIParserTest >> testDataOneRow

	| parser |
	parser := ESRIParser new.
	parser raster numberOfColumns: 4. 
	parser handleData: #('-9999' '-9999' '5' '2').
	self assert: parser raster rows first equals: #(-9999 -9999 5 2)``````ESRIParserTest >> testDataOneCell

	| parser |
	parser := ESRIParser new.
	parser raster numberOfColumns: 4. 
	parser handleData: #('-9999' '-9999' '5' '2').
	self assert: parser raster rows first equals: #(-9999 -9999 5 2)``````ESRIParserTest >> testFull

	| parser |
	parser := ESRIParser new.
	parser parse: 'ncols         4
nrows         6
xllcorner     0.0
yllcorner     0.0
cellsize      50.0
NODATA_value  -9999
-9999 -9999 5 2
-9999 20 100 36
3 8 35 10
32 42 50 6
88 75 27 9
13 5 1 -9999'.
	self assert: parser raster numberOfRows equals: 6.
	self assert: parser raster rows size equals: 6.
	``````ESRIRaster >> numberOfRows: anObject
	self halt.
	numberOfRows := anObject``````ESRIParserTest >> testFull

	| parser |
	parser := ESRIParser new.
	parser parse: 'ncols 4
nrows 6
xllcorner 0.0
yllcorner 0.0
cellsize 50.0
NODATA_value -9999
-9999 -9999 5 2
-9999 20 100 36
3 8 35 10
32 42 50 6
88 75 27 9
13 5 1 -9999'.
	self assert: parser raster numberOfRows equals: 6.
	self assert: parser raster rows size equals: 6.
	``````ESRIRaster >> numberOfRows: anObject
	numberOfRows := anObject``````ESRIParserTest >> testFull

	| parser |
	parser := ESRIParser new.
	parser parse: 'ncols 4
nrows 6
xllcorner 0.0
yllcorner 0.0
cellsize 50.0
NODATA_value -9999
-9999 -9999 5 2
-9999 20 100 36
3 8 35 10
32 42 50 6
88 75 27 9
13 5 1 -9999'.
	self assert: parser raster numberOfRows equals: 6.
	self assert: parser raster rows size equals: 6.
	self assert: parser raster rows last equals: #(13 5 1 -9999)
	```