## Inheritance: Incremental definition and behavior reuse
	smalltalkhubUser: 'StephaneDucasse' project: 'Loop'; 
	version: 'MyFS2-StephaneDucasse.4';
	load
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'MyFS2'
	instanceVariableNames: 'parent name contents'
	classVariableNames: ''
	package: 'MyFS2'
	instanceVariableNames: 'parent name files'
	classVariableNames: ''
	package: 'MyFS2'
	instanceVariableNames: 'parent contents'
	classVariableNames: ''
	package: 'MyFS2'
	instanceVariableNames: 'parent files'
	classVariableNames: ''
	package: 'MyFS2'
	instanceVariableNames: 'name'
	classVariableNames: ''
	package: 'MyFS2'
p := MFDirectory new name: 'comics'.
el1 := MFFile new name: 'babar'; contents: 'Babar et Celeste'.
p addElement: el1.
el2 := MFFile new name: 'astroboy'; contents: 'super cool robot'.
p addElement: el2.
p describe
>>> 'I m a directory named comics'
el1 describe
>>> 'I m a file named babar'
	^ 'I m a ', self kind, 'named ', name  
	^ 'element'
	^ 'directory'
	^ 'file'
el1 := (MFFile new name: 'astroboy').
el1 describe
>>> 'I m a file named astroboy'
>>> ... 
B new foo
>>> ...
>>> ...
B new bar
>>> ...
>>> 10

B new foo
>>> 50

A new bar
>>> 10

B new bar
>>> 50
	^ 'I m a ', self kind, 'named ', name  
	^ 'I m a ', self kind, 'named ', self name  
	^ name