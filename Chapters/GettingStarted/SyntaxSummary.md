## Syntax summary

#### Six reserved words only

| `nil` | the undefined object |
| `true`, `false` | boolean objects |
| `self` | the receiver of the current message |
| `super` | the receiver, in the superclass context |
| `thisContext` | the current invocation on the call stack |

#### Reserved syntactic constructs


| `"comment"` | comment |
| `'string'` | string |
| `#symbol` | unique string |
| `$a`, Character space | the character a and a space |
| 12 2r1100 16rC | twelve \(decimal, binary, hexadecimal\) |
| 3.14 1.2e3 | floating-point numbers |
| `#(abc 123)` | literal array with the symbol `#abc` and the number 123 |
| `{foo . 3 + 2}` | dynamic array built from 2 expressions |
| `#[123 21 255]` | byte array |
| _exp1_. _exp2_ | expression separator \(period\) |
| `;` | message cascade \(semicolon\) |
| var := _expr_ | assignment |
| `^` _expr_ | return a result from a method \(caret\) |
| `[ :e | expr ]` | code block with a parameter |
| `| var1 var2 |` | declaration of two temporary variables |



#### Message Sending

When we send a message to an object, the message
_receiver_, the method is selected and executed; the message returns an object. Messages syntax mimics natural languages, with a subject, a verb, and complements. 

		

| **Java** | **Pharo** |
| `aColor.setRGB(0.2,0.3,0)` | `aColor r: 0.2 g: 0.3 b: 0 ` |
| `d.put("1", "Chocolate"); ` | `d at: '1' put: 'Chocolate'` |

#### Three Types of Messages: Unary, Binary, and Keyword



A **unary** message is one with no arguments.

```
Array new
>>> anArray
```

```
#(4 2 1) size
>>> 3
```


`new` is an unary message sent to classes \(classes are objects\). 

A **binary** message takes only one argument and is named by one or more symbol characters from `+`, `-`, `*`, `= `, `<`, `>`, ...


```
3 + 4
>>> 7 
```

```
'Hello' , ' World'
>>>'Hello World'
```


The `+` message is sent to the object 3 with 4 as
 argument. The string 'Hello'receives the message `,`
\(comma\) with `' World'` as the argument.

A **keyword** message can take one or more
arguments that are inserted in the message name.

```
'Pharo' allButFirst: 2
>>> 'aro'
```

```
3 to: 10 by: 2
>>> (3 to: 10 by: 2)
```


The second example sends
`to:by:` to 3, with arguments 10 and 2; this
returns an interval containing 3, 5, 7, and 9.

#### Message Precedence


Parentheses `>` unary `>` binary `>` keyword, and finally from
left to right.

```
(15 between: 1 and: 2 + 4 * 3) not
>>> false
```


Messages `+` and `*` are sent first, then `between:and:` is sent, and `not`.
The rule suffers no exception: operators are just binary messages with _no notion of mathematical precedence_. 2 + 4 * 3 reads left-to-right and gives 18, not 14!

#### Cascade: Sending Multiple Messages to the Same Object

Multiple messages can be sent to the same receiver with ;.
```
OrderedCollection new
  add: #abc;
  add: #def;
  add: #ghi.
```


The message `new` is sent to `OrderedCollection` which 
returns a new collection to which three
add: messages are sent. The value of the whole message cascade
is the value of the last message sent \(here, the symbol
`#ghi`\). To return the receiver of the
message cascade instead \(i.e. the collection\), make sure to send
`yourself` as the last message of the cascade.

#### Blocks

Blocks are objects containing code that is executed on demand. They are the basis for control structures like conditionals and loops.

```
2 = 2
  ifTrue: [ Error signal: 'Help' ]
```


```
#('Hello World')
  do: [ :e | Transcript show: e ]
```


The first example sends the message `ifTrue:` to the boolean `true` \(computed from
2 = 2\) with a block as argument. Because the boolean is true,
the block is executed and an exception is signaled. The next example
sends the message `do:` to an array. This evaluates the block
once for each element, passing it via the e parameter. As a
result, `Hello World` is printed.

#### Common Constructs: Conditionals


In Java
```
if (condition)
	{ action(); }
	else { anotherAction();} 
```


In Pharo
```
condition
	ifTrue: [ action ]
	ifFalse: [ anotherAction ]
```


In Java
```
while (condition) { action(); 
     anotherAction(); }
```


In Pharo
```
[ condition ] whileTrue: [ action. anotherAction ]
```


#### Common Constructs: Loops/Iterators


In Java
```
for(int i=1; i<11; i++){
    System.out.println(i); } 
```


In Pharo
```
1 to: 11 do: [ :i | Transcript show: i ; cr ] 
```


In Java
```
String [] names ={"A", "B", "C"};
for( String name : names ) { 
     System.out.print( name );  
     System.out.print(","); }  
```


In Pharo
```
| names | 
names := #('A' 'B' 'C').
names do: [ :each | Transcript show: each, ' , ' ]
```


Collections start at 1. Messages `at: index` gives element at index and `at: index put: value` sets element at index to value.

```
#(4 2 1) at: 3
>>> 1 
```

```
#(4 2 1) at: 3 put: 6
>>>#(4 2 6) 
```

```
Set new add: 4; add: 4; yourself
>>> aSet 
```


#### Files and Streams

```
work := FileSystem disk workingDirectory. 
stream := (work / 'foo.txt') writeStream. 
stream nextPutAll: 'Hello World'. 
stream close. 
stream := (work / 'foo.txt') readStream. 
stream contents. 
>>> 'Hello World' 
stream close.
```


