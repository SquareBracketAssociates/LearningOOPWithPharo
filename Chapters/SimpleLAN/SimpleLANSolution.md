## Network simulator solutions### Packets```language=smalltalkKANetworkPacket class >> from: sourceAddress to: destinationAddress payload: anObject
    ^ self new
        initializeSource: sourceAddress
        destination: destinationAddress
        payload: anObject``````language=smalltalkKANetworkPacket >> initializeSource: source destination: destination payload: anObject
    sourceAddress := source.
    destinationAddress := destination.
    payload := anObject``````language=smalltalkKANetworkPacket >> sourceAddress
    ^ sourceAddress``````language=smalltalkKANetworkPacket >> destinationAddress
    ^ destinationAddress``````language=smalltalkKANetworkPacket >> payload
    ^ payload```### Nodes```language=smalltalkKANetworkNode >> initializeAddress: aNetworkAddress
    address := aNetworkAddress``````language=smalltalkKANetworkNode >> address
    ^ address```### Links```language=smalltalkKANetworkLink >> initializeFrom: sourceNode to: destinationNode
    source := sourceNode.
    destination := destinationNode.``````language=smalltalkKANetworkLink >> source
    ^ source``````language=smalltalkKANetworkLink >> destination
    ^ destination``````language=smalltalkObject subclass: #KANetworkNode
    instanceVariableNames: 'address outgoingLinks'
    classVariableNames: ''
    category: 'NetworkSimulator-Core'``````language=smalltalkKANetworkNode >> hasLinkTo: anotherNode
    ^ outgoingLinks
        anySatisfy: [ :any | any destination == anotherNode ]```### Sending a packet```language=smalltalkKANetworkLink >> isTransmitting: aPacket
    ^ packetsToTransmit includes: aPacket```### Transmitting a packet```language=smalltalkKANetworkLink >> transmit: aPacket
    "Transmit aPacket to the destination node of the receiver link."
    (self isTransmitting: aPacket)
        ifTrue: [
            packetsToTransmit remove: aPacket.
            destination receive: aPacket from: self ]``````language=smalltalkObject subclass: #KANetworkNode
    instanceVariableNames: 'address outgoingLinks arrivedPackets'
    classVariableNames: ''
    category: 'NetworkSimulator-Core'``````language=smalltalkKANetworkNode >> initialize
    outgoingLinks := Set new.
    arrivedPackets := OrderedCollection new``````language=smalltalkKANetworkNode >> hasReceived: aPacket
    ^ arrivedPackets includes: aPacket```### The loopback link```language=smalltalkKANetworkNode >> initialize
    loopback := KANetworkLink from: self to: self.
    outgoingLinks := Set new.
    arrivedPackets := OrderedCollection new``````language=smalltalkKANetworkNode >> linksTowards: anAddress do: aBlock
    "Simple flood algorithm: route via all outgoing links.
    However, just loopback if the receiver node is the routing destination."
    anAddress = address
        ifTrue: [ aBlock value: self loopback ]
        ifFalse: [ outgoingLinks do: aBlock ]```### Modeling the network itself```language=smalltalkKANetworkTest >> buildNetwork
    alone := KANetworkNode withAddress: #alone.

    net := KANetwork new.

    hub := KANetworkNode withAddress: #hub.
    #(mac pc1 pc2 prn) do: [ :addr |
        | node |
        node := KANetworkNode withAddress: addr.
        net connect: node to: hub ].

    net
        connect: (KANetworkNode withAddress: #ping)
        to: (KANetworkNode withAddress: #pong)``````language=smalltalkKANetwork >> initialize
    nodes := Set new.
    links := Set new``````language=smalltalkKANetwork >> connect: aNode to: anotherNode
    self add: aNode.
    self add: anotherNode.
    links add: (self makeLinkFrom: aNode to: anotherNode) attach.
    links add: (self makeLinkFrom: anotherNode to: aNode) attach```### Looking up nodes```language=smalltalkKANetwork >> nodeAt: anAddress ifNone: noneBlock
    ^ nodes
        detect: [ :any | any address = anAddress ]
        ifNone: noneBlock```### Looking up links```language=smalltalkKANetwork >> linkFrom: sourceAddress to: destinationAddress
    ^ links
        detect: [ :anyLink |
            anyLink source address = sourceAddress
                and: [ anyLink destination address = destinationAddress ] ]
        ifNone: [
            NotFound
                signalFor: sourceAddress -> destinationAddress
                in: self ]```### Packet delivery with forwarding```language=smalltalkKANetworkHub >> forward: aPacket from: arrivalLink
    self
        linksTowards: aPacket destinationAddress
        do: [ :link |
            link destination == arrivalLink source
                ifFalse: [ self send: aPacket via: link ] ]```