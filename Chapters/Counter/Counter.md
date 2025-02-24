## Developing a simple counter


To get started in Pharo, we invite you to implement a simple counter by following the steps given below. In this exercise you will learn how to create packages classes, methods, instances. You will learn how to define tests and more. This simple tutorial covers most of the important actions that we do when developing in Pharo. 

Note that the development flow promoted by this little tutorial is _traditional_ in the sense that you will define a package, a class, _then_ define its instance variable _then_ define its methods _and_ finally execute it \(See the companion video below\). Now in Pharo, developers often follow a _totally_ different style \(that we call live coding\) where they execute an expression that raises errors and they code in the debugger and let the system define some instance variables and methods on the fly for them. Once you will have finished this tutorial, you will feel more confident with Pharo and we strongly suggest you to try the other style \(See the second video showing such different development practices\).

#### Companion videos

You can find at [http://mooc.pharo.org/](http://mooc.pharo.org/), the mooc videos with french and english voice over and subtitles in different languages \(japanese, spanish, french, english\).
Among such videos, two videos are related to the counter exercises. They are called "Redo" because this is left to the reader to follow and redo the 
videos. 
- Coding the traditional way: [http://rmod-pharo-mooc.lille.inria.fr/MOOC/Videos/W1/](http://rmod-pharo-mooc.lille.inria.fr/MOOC/Videos/W1/) and [http://rmod-pharo-mooc.lille.inria.fr/MOOC/Videos-EN/W2/](http://rmod-pharo-mooc.lille.inria.fr/MOOC/Videos-EN/W2/)
- Coding in the debugger: [http://rmod-pharo-mooc.lille.inria.fr/MOOC/Videos/W2/](http://rmod-pharo-mooc.lille.inria.fr/MOOC/Videos/W2/) and [http://rmod-pharo-mooc.lille.inria.fr/MOOC/Videos-EN/W2/](http://rmod-pharo-mooc.lille.inria.fr/MOOC/Videos-EN/W2/)


### Our use case


Here is our use case: we want to be able to create a counter, increment it twice, decrement it and check that its value is correct. It looks like this little use case will fit perfectly a unit test - you will define one later. 

```
| counter |
counter := Counter new.
counter increment; increment.
counter decrement.
counter count = 1
```



Now we will develop all the mandatory class and methods to support this scenario.

![Package created and class creation template. % anchor=figpackageCreated](figures/CounterPackageCreated.png)

### Create your own class


In this part, you will create your first class. In Pharo, a class is defined in a package. You will create a package then a class. The steps we will do are the same ones every time you create a class, so memorize them well. 


#### Create a package

Using the Browser create a package. The system will ask you a name, write `MyCounter`. This new package is then created and added to the list. Figure *@figpackageCreated@* shows the result of creating such a package.

#### Create a class

Creating a class requires four steps. They consist basically in editing the class definition template to specify the class you want to create.

- By default, the system helps you to define a subclass of the class `Object`. This is why it is written `Object subclass: #NameOfSubclass`.


- **Class Name.** You should fill in the name of your class by replacing the word `NameOfSubclass` with the word `Counter`. Take care that the name of the class starts with a capital letter and that you do not remove the #sign in front of `NameOfClass`. This is because the class we want to create does not exist yet, so we have to give its name, and we use a Symbol \(a unique string in Pharo\) to do so. 


- **Instance variable definition.** Then, you should fill in the names of the instance variables of this class. We need one instance variable called `count`. Take care that you leave the string quotes!


- **Class variable definition**. As we do not need any class variable make sure that the argument  for the class instance variables is an empty string `classInstanceVariableNames: ''`.


You should get the following class definition.

```
Object << #Counter
   slots: { #count }; 
   package: 'MyCounter'
```


Now we should compile it. We now have a filled-in class definition for the class `Counter`. To define it, we still have to _compile_ it. Therefore, select the accept menu item. The class `Counter` is now compiled and immediately added to the system.



Figure *@figclassCreated@* illustrates the resulting situation that the browser should show.

![Class created. % anchor=figclassCreated](figures/CounterClassCreated.png)

The tool runs automatically some code critic and some of them are just inaccurate, so do not care for now. 

As we are disciplined developers, we add a comment to `Counter` class by clicking Comment button. You can write the following comment:

```
Counter is a simple concrete class that supports incrementing and decrementing a counter.
Its API is 
- decrement, increment
- count
Its creation API is message withValue: 
```


Select menu item 'accept' to store this class comment in the class.


### Define protocols and methods

In this part you will use the browser to learn how to add protocols and methods.

The class we have defined has one instance variable named `count`. You should remember that in Pharo, \(1\) everything is an object, \(2\)  instance variables are private to the object, and \(3\) the only way to interact with an object is by sending messages to it.

Therefore, there is no other mechanism to access the instance variable values from outside an object than sending a message to the object. What you can do is to define messages that return the value of the instance variable. Such methods are called _accessors_, and it is a common practice to always define and use them. We start to create an accessor method for our instance variable `count`.

A method is usually sorted into a protocol. These protocols are just a group of methods without any language semantics, but convey important navigation information for the reader of your class. You get protocol named: `'testing'` for method performing tests, `'printing'` for methods displaying the object, `'accessing'` for simple accessor methods and so on. 

Although protocols can have any name, Pharo programmers follow certain conventions for naming these protocols. But don't be stressed if you do not name well your protocols. 

#### Create a method


Now let us create the accessor methods for the instance variable `count`. Start by selecting the class `Counter` in a browser, and make sure that you are editing the instance side of the class \(i.e., we define methods that will be sent to instances\) by deselecting the Class side radio button.

Create a new protocol by bringing the menu of methods protocol list: click on the third list from the left. Select the newly created protocol. Then in the bottom pane, the edit field displays a method template laying out the default structure of a method. As a general hint, double click at the end of or beginning of the text and start typing your method.
Replace the template with the following method definition:

```
count
   "Return the current value of the receiver"
   ^ count
```


This defines a method called `count`, taking no arguments, having a method comment and returning the instance variable `count`. Then choose _accept_ in the menu to compile the method. You can now test your new method by typing and evaluating the next expression in a Playground, or any text editor.


```
Counter new count
>>> nil
```


This expression first creates a new instance of `Counter`, and then sends the message `count` to it. It retrieves the current value of the counter. This should return `nil` \(the default value for non-initialized instance variables\). Afterwards, we will create instances with a reasonable default initialisation value.


#### Adding a setter method

Another method that is normally used besides the accessor method is a so-called setter method. Such a method is used to change the value of an instance variable from a client. For example, the expression `Counter new count: 7` first creates a new `Counter` instance and then sets its value to 7:

The snippets shows that the counter effectively contains its value.

```
| c |
c := Counter new count: 7.
c count
>>> 7
```



This setter method does not currently exist, so as an exercise write the method `count:` such that, when invoked on an instance of `Counter`,  instance variable is set to the argument given to the message. Test your method by typing and evaluating the expression above.

### Define a Test Class


Writing tests is an important activity that will support the evolution of your application. Remember that a test is written _once and executed million_ times. For example if we have turned the expression above into a test we could have checked automatically that our new method is correctly working. 

To define a test case we will define a class that inherits from `TestCase`. Therefore define a class named `CounterTest` as follows:

```
TestCase << #CounterTest
   package: 'MyCounter'
```


Now we can write a first test by defining one method. Test methods should start with _test_ to be automatically executed by the TestRunner or when you press on the icon of the method. Now to make sure that you understand in which class we define the method we prefix the method body with the class name and `>>`.
`CounterTest>>` means that the method is defined in the class `CounterTest`.

Define the following method. It first creates an instance, sets its value, and verifies that the value is correct. The message `assert:equals:` is a special message verifying if the test passed or not.

```
CounterTest >> testCountIsSetAndRead
   | c |
   c := Counter new.
   c count: 7.
   self assert: c count equals: 7
```


Verify that the test passes by executing either pressing the icon in front of the method or using the TestRunner available in the Tools menu \(selecting your package\).
Since you have a first green test. This is a good moment to save your work. 


![Selecting a new kind of repository to the list of possible places to commit the package.](figures/CounterAddingRepo.png anchor=figSelectingARepo)

![Editing the repository information. % anchor=figAddingARepo](figures/CounterEditingProject.png)

### Saving your work


Several ways to save your work exist. 

- _Using plain files_. You can save the class or a method by clicking on it and selecting the fileout menu item. You will get a file containing the source code on your hard-disk - This is not the favorite way to save your code. 
- _Using a version control system_. It is better to use a version control system. In Pharo you can use Monticello and Git \(even if it is more for advanced users\).



In this chapter, we explain the simplest way to get you done. Note that the complete set of Pharo packages is managed via Monticello \(which is a distributed versioning control system - there are chapters in **Pharo by Example** and **Deep into Pharo** books [http://books.pharo.org](http://books.pharo.org)\).

Use the **Monticello Browser** \(available in Tools\) to save your work. You can save a package locally on your hard-disk or on a remote server on the web such as [http://www.smalltalkhub.com](http://www.smalltalkhub.com)

#### Saving using Monticello


Using Monticello you can save your work:
- _Locally_. You can store your packages in a folder on your disk \(use directory as a kind of repository below\).
- _Remotely_. Using an account on a free server such [http://www.smalltalkhub.com/](http://www.smalltalkhub.com/). You can save your work and share it with others.

Note each time you load or save a package, this package is also be stored in the folder named 'package-cache' on your hard-disk.


##### Add a repository

Go to [http://www.smalltalkhub.com/](http://www.smalltalkhub.com/) and create a member account then register a new project. You get an HTTP entry that refers to your project. Define a new HTTP repository using the Monticello Browser as shown by Figures *@figSelectingARepo@* and *@figAddingARepo@*.

Figure *@figSelectingARepo@* shows that your package is dirty: this is indicated with the little '*' in front of the packages.

**Example.** As authors we  are saving the examples for this chapter as a special team named PharoMooc in the Counter project so our information is the following:  

```
MCHttpRepository
	location: 'http://smalltalkhub.com/mc/PharoMooc/Counter/main'
	user: ''
	password: ''
```


Now for you, you should adapt the following template to use your own information: 

```
MCHttpRepository
	location: 'http://smalltalkhub.com/mc/YourAccount/YourProject/main'
	user: 'YourAccountID'
	password: 'YourAccountPassword'
```



##### Saving your package


To save your work, simply select your package and the repository you want to save it to and save it using the Save button. This will open a dialog where you can give a comment, version numbers and blessing. From then on, other people can load it from there, in the same way that you would use cvs or other multi-user versioning systems. Saving the image is also a way to save your working environment, but not a way to version and publish it in a way that can be easily shared.

You can of course both publish your package \(so that other people can load it, and that you can compare it with other versions, etc.\) and save your image \(so that next time that you start your image you are in the same working environment\).

### Adding more messages

Before implementing the following messages we define first a test.
We define one test for the method `increment` as follows:

```
CounterTest >> testIncrement
   | c |
   c := Counter new.
   c count: 0 ; increment; increment.
   self assert: c count equals: 2
```

Here we create a counter, set its value to 0, send it the message increment two times and verify that we get a counter of value 2. 

Now you should implement some more methods. 
- Propose a definition for the method `increment` and implement it. 
- Implement also a new test method for the method `decrement`.
- Define the method `decrement` place it together with `increment` in the protocol `'operation'`.


Here are the possible definitions for such methods. 

```
Counter >> increment
   count := count + 1
```


```
Counter >> decrement
   count := count - 1
```


![Class with green tests.](figures/CounterClassTestCreated.png anchor=figclassTestCreated)

Run your tests they should pass \(as shown in Figure *@figclassTestCreated@*\). Again this is a good moment to save your work. Saving at point where tests are green
is always a good process. 

### Instance initialization method

Right now the initial value of our counter is not set as the following expression shows it.

```
Counter new count
>>> nil
```


Let us write a test checking that a newly created instance has 0 as a default value.

```
CounterTest >> testValueAtCreationTimeIsZero
   self assert: Counter new count equals: 0
```


If you run it, it will turn yellow indicating a failure \(a situation that you anticipated but that is not correct\) - by opposition to an error which is an anticipated situation leading to failed assertion. 




#### Define an initialize method


Now we have to write an initialization method that sets a default value of the `count` instance variable. However, as we mentioned the `initialize` message is sent to the newly created instance. This means that the `initialize` method should be defined at the instance side as any method that is sent to an instance of `Counter` (like `increment`) and `decrement`. The `initialize` method is responsible to set up the default value of instance variables.

Therefore at the instance side, you should create a protocol `initialization`, and create the following method \(the body of this method is left blank. Fill it in!\).

```
Counter >> initialize
  "set the initial value of the value to 0"
  
  count := 0
```



Now create a new instance of class `Counter`. Is it initialized by default? The following code should now work without problem:

```
Counter new increment
```


and the following one should return 2

```
Counter new increment; increment; count
>>> 2
```



But better write a test since we will execute it all the time. 

```
TestCounter >> testCounterWellInitialized
	self 
		assert: Counter new increment; increment; count 
		equals: 2
```




Again save your work


### Better object description


When you select the expression `Counter new` and print its result \(using the Print it menu of the editor\) you obtain a simple string `'a Counter'`.

```
Counter new
>>> a Counter
```


We would like to get a much richer information for example knowing the counter value. Implement the following methods in the protocol `printing`

```
Counter >> printOn: aStream
   super printOn: aStream.
   aStream nextPutAll: ' with value: ', self count printString.
```


Note that the method `printOn:` is used when you print an object using print it \(See Figure *@figBetterDescription@*\). In addition this method is invoked when you click on `self` in an inspector. An inspector is an object to interact and modify objects. It is really powerful during development.

![Better description doing a Print It \(cmd + P\).](figures/CounterBetterDescription.png anchor=figBetterDescription)



### Conclusion


In this chapter you learned how to define packages, classes, methods, and define tests.
The flow of programming that we chose for this first tutorial is similar to most of programming languages.
In Pharo you can use a different flow that is based on defining a test first, executing it and when the execution raises error to define the corresponding classes, methods, and instance variables often from inside the debugger. We suggest you now to redo the exercise following the second companion video.
