## Beacons and Satellites 
@ch:beacon

In this chapter you will build a simulator for beacons and satellites. Beacons are in the sea and collect data and from time to time they should synchronise with satelittes to send data. 

In reality, satelittes broadcast signals and beacons are polling at regular interval for signals, then once they know that they are in range based on the first signal, a communication is established and data is exchanged.

In the simulator, we will present how we can implement communication between loosely coupled objects. You will build step by step different variations around the observer/observable idiom. This idiom is important since it is used in Model-View-Controller and Self-addressed stamped envelope (S.A.S.E) patterns. Beacons will register to satellites and when the satellites are in range they will notify the beacons interested in the notification. 


### Description


![Beacons and Satelittes. % width=70&anchor=fig:Beacon ](figures/Beacons.png)

A beacon is inside the sea and it collects data. It is fully autonomous. After a certain period of time it migrates to the surface waiting to send the data it collected.
To communicate with satellites, a satellite should be available, i.e., within the zone where the beacon is.

A satellite is moving around the earth at a certain speed and ranging a portion of the sea. 
It can only communicate with beacons within such range.

The system is fully dynamic in the sense that new beacons may be added or removed.
Satellites may be present or not.

### A simple model

```
Object subclass: #Satelitte
	instanceVariableNames: 'observers'
	classVariableNames: ''
	package: 'SatelitteAndBeacon'
```

```
Satelitte >> initialize
	observers := OrderedCollection new
```


```
Object subclass: #Beacon
	instanceVariableNames: 'data'
	classVariableNames: ''
	package: 'SatelitteAndBeacon'
```




### V1: Simple observer / observable

We start with a simple schema where beacons 
- register to satellites and
- when the satellites are in range they notify the beacons that are registered.



#### Registration

A beacon registers to a satellite as follows:

```
Satelitte >> register: aBeacon
	self addObserver: aBeacon
```


#### Notification


```
Satelitte >> position: aPoint
	position := aPoint. 
	self notify
```


```
Satelitte >> notify
	observers do: [ :aBeacon | aBeacon salelittePositionChanged: self ]
```


### V1 Implementation


???



### V2: Analysis


This first implementation has several drawbacks.
- One of the problem is that the message is hardcoded. 
- Second Imagine that the satellite should emit different notification for its position, protocol to be used, frequency.... and each kind of beacon can register for the notification kinds that fits it. We must have a list of each kind of observed property.



### V2: Introducing events


```
Satelitte >> register: aBeacon forEvent: aEventClass
	aSatelitte1 addObserver: aBeacon1 with: aEventClass
```


```
Satelitte >> addObserver: anObserver with: anEventClass
	observerDict at: anEventClass iAbsentPut: [OrderedCollection new].
	(observerDict at: anEventClass) add: anObserver
```


```
Satelitte >> position: aPoint
	position := aPoint. 
	self notify: (PositionChanged with: self)
```


```
Satelitte >> notify: anEvent
	(observersDict at: anEvent class) ifPresent: [ :aBeaconList | 
		aBeaconList do: [:aBeacon| anEvent fireOn: aBeacon ]
```


#### Implementation


```
Object subclass: #SBEvent
	instanceVariableNames: 'observable'
	classVariableNames: ''
	package: 'SatelitteAndBeacon'
```


```
SBEvent subclass: #SBPositionChanged
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'SatelitteAndBeacon'
```


```
SBEvent subclass: #SBProtocolChanged
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'SatelitteAndBeacon'
```


```
SBPositionChanged >> fireOn: anObserver
	anObserver salelittePositionChanged: observable
```


```
SBProtocolChanged >> fireOn: anObserver
	anObserver salelitteProtocolChanged: observable
```



#### V2 analysis


Advantages
- we reuse the same mechanism for different kind of observable properties.


Drawbacks
- One event means that the message is also hardcoded. There is tight dependencies between  the event type and the kind of behavior that is available on the observer side. 


### V3 Specifying the message


Now the observer can specify the message that it wants to receive. 

```
aSatelitte1 when: SBPositionChanged send: #readyForHandShakeWith: to: aBeacon1
```


```
aSatelitte1 when: SBProtocolChanged send: #useProtocol: to: aBeacon1
```


```
Satellite >> when: anEventClass send: aSelector to: anObserver
	observerDict at: anEventClass iAbsentPut: [OrderedCollection new].
	(observerDict at: anEventClass) add: (aSelector -> anObserver)
```


```
Satellite >> position: aPoint
	position := aPoint. 
	self notify: (PositionChanged with: self)
```


```
Satellite >> notify: anEvent
	(observersDict at: anEvent class) ifPresent: [ :aBeaconList | 
		aBeaconList do: [ :aBeaconAssoc | 
			aBeaconAssoc value perform: aBeaconAssoc key with: anEvent) ]
```




### V5 Factoring out the announcer


The notification and management at notification should be packaged as a separate class so that we can reuse it by just delegating to it. 

```
Object subclass: #BSAnnouncement
	instanceVariableNames: 'selector observer'
```


```
Object subclass: #BSAnnouncer
	instanceVariableNames: 'observerDict'
```


```
BSAnnouncer >> when: anEventClass send: aSelector to: anObserver
	observerDict at: anEventClass iAbsentPut: [ OrderedCollection new] .
	(observerDict at: anEventClass) add: 
		(BSAnnouncement send: aSelector to: anObserver)
```


```
BSAnnouncer >> notify: anEvent
	(observersDict at: anEvent class) ifPresent: [ :aBeaconList | 
		aBeaconList do: [ :anAnnouncement | 
			anAnnouncement observer
				perform: anAnnouncement selector 
				with: anEvent) ]
```


```
Satellite >> notify: anEvent
	self announcer notify: anEvent
```


```
Satellite >> when: anEventClass send: aSelector to: anObserver
	self announcer when: anEventClass send: aSelector to: anObserver
```



### Discussion about lookup of events



