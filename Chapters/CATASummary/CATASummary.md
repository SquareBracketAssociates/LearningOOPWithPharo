## CATAs and Learning Points Summary

@cha:catasummary

This chapter provides an overview of all the coding exercises (CATAs - Coding And Testing Activities) included in this book, along with the key learning points from each exercise.

### What is a CATA?

A CATA is a hands-on coding exercise designed to teach object-oriented programming concepts through practical implementation. Each CATA guides you through building a small project while reinforcing fundamental OOP principles and test-driven development practices.

### Overview of CATAs

| CATA | Chapter | Key Concepts |
|------|---------|--------------|
| Counter | NewCounterMaterial | Classes, instance variables, methods, TDD basics |
| Collection Katas | Katas | Collections, iterators, Sets, String manipulation |
| Temperature Converter | Converter | TDD workflow, float comparison, basic OOP |
| Wallet | Wallet | Collections, aggregation, test-driven design |
| Dice DSL | DSL | Embedded DSL, class extensions, polymorphism |
| Expression Interpreter | Expressions | Inheritance, expression trees, recursive evaluation |
| Simple LAN | SimpleLan | Inheritance, polymorphism, network simulation |
| Snakes and Ladders | SnakesAndLadders | Game design, responsibility-driven design, state |
| TinyChat | TinyChat | REST APIs, client-server architecture, GUI |

---

### CATA 1: Counter

**Location:** `Chapters/NewCounterMaterial/Exo-Counter.md`

**Description:** Build a simple counter class that can be incremented, decremented, and queried for its current value.

**Learning Points:**
- Creating packages and classes in Pharo
- Defining instance variables
- Writing getter and setter methods
- Understanding message passing
- Introduction to unit testing with SUnit
- The TDD (Test-Driven Development) workflow

**Key Skills:**
```
Counter new count.          "Query the count"
Counter new increment.      "Increase by 1"
Counter new decrement.      "Decrease by 1"
```

---

### CATA 2: Collection Katas (Isograms, Pangrams, Palindromes)

**Location:** `Chapters/Katas/GramKatas.md`

**Description:** A series of word-based challenges that explore Pharo's collection classes.

#### Isogram Challenge
Determine if a word contains no repeating letters.

**Learning Points:**
- Using Sets to detect unique elements
- The `asSet` message for collection conversion
- Comparing collection sizes
- Extending the String class with new methods

#### Pangram Challenge
Identify sentences that use every letter of the alphabet.

**Learning Points:**
- Iterating over collections with `do:`
- Early return using `^ expression`
- The `includes:` message
- Parameterizing methods (custom alphabets)

#### Palindrome Challenge
Check if a word/sentence reads the same forwards and backwards.

**Learning Points:**
- The `reverse` message
- Character-by-character comparison
- The `with:do:` iterator for parallel iteration

**Key Concepts Reinforced:**
- Collection iterators (`do:`, `select:`, `collect:`)
- Test-driven development
- Writing tests for positive and negative cases
- Class extensions (adding methods to existing classes)

---

### CATA 3: Temperature Converter

**Location:** `Chapters/Converter/Converter.md`

**Description:** Build a temperature converter that transforms Celsius to Fahrenheit, with extensions for logging temperatures by location.

**Learning Points:**
- Basic class design
- Float comparison issues in testing
- The formula: `F = (C * 1.8) + 32`
- Building a temperature logger with timestamps
- Computing averages from collections
- The `sum` and `average` messages

**Extended Features:**
- Recording temperatures with location
- Retrieving latest records
- Calculating average temperatures

---

### CATA 4: Electronic Wallet

**Location:** `Chapters/Wallet/Wallet.md`

**Description:** Create a wallet that can hold coins of different denominations and calculate totals.

**Learning Points:**
- Object composition (wallet contains coins)
- Using collections to store objects
- Implementing `add:` for adding elements
- Computing totals with `sum:` or iteration
- Test-first development approach

---

### CATA 5: Dice Rolling DSL

**Location:** `Chapters/DSL/DSL.md`

**Description:** Create an embedded domain-specific language for rolling dice, similar to what's used in role-playing games like Dungeons & Dragons.

**Example Usage:**
```
2 D20 + 1 D6    "Roll two 20-sided dice plus one 6-sided die"
```

**Learning Points:**
- Creating domain classes (Die, DieHandle)
- Class methods vs. instance methods
- The `withFaces:` class creation pattern
- Class extensions (adding `D20`, `D6` methods to Integer)
- Overloading operators (`+` for combining handles)
- Polymorphic APIs (both Die and DieHandle respond to `roll`)
- The "Don't ask, tell" principle
- Improving programmer experience with `printOn:`

**Design Insight:**
The polymorphic `roll` API allows clients to treat single dice and dice handles uniformly - a key OOP principle.

---

### CATA 6: Expression Interpreter

**Location:** `Chapters/Expressions/Expressions.md`

**Description:** Build a mathematical expression interpreter that can evaluate expressions like `(3 + 4) * 5`.

**Expression Types:**
- `EConstant` - Holds a numeric value
- `ENegation` - Negates an expression
- `EAddition` - Adds two expressions
- `EMultiplication` - Multiplies two expressions

**Learning Points:**
- Building expression trees (composite pattern)
- Inheritance hierarchies
- Recursive evaluation
- Factory methods for cleaner object creation
- Abstract classes and template methods
- Extending behavior through inheritance

**Design Pattern Preview:**
This CATA sets the foundation for learning the Visitor pattern in advanced chapters.

---

### CATA 7: Simple LAN Simulator

**Location:** `Chapters/SimpleLan/Simple-LAN-Definition.md`

**Description:** Simulate a Local Area Network with nodes that can send and receive packets.

**Classes:**
- `LNNode` - Base class for all network entities
- `LNPacket` - Represents data packets with sender/receiver
- `LNWorkstation` - Computer nodes that originate packets
- `LNPrintServer` - Nodes that print received packets

**Learning Points:**
- Inheritance for shared behavior
- Polymorphism (different node types handle packets differently)
- Linked structures (nodes linked in a ring)
- Responsibility-driven design
- Encapsulation of behavior

**Network Topology:**
Nodes are connected in a ring, and packets travel until they find their destination.

---

### CATA 8: Snakes and Ladders

**Location:** `Chapters/SnakesAndLadders/SnakesAndLadders.md`

**Description:** Implement the classic board game with tiles, players, snakes, and ladders.

**Classes:**
- `SLGame` - Manages the board and gameplay
- `SLPlayer` - Tracks player position and moves
- `SLTile` - Regular board spaces
- `SLLadderTile` - Tiles that move players up
- `SLSnakeTile` - Tiles that move players down

**Learning Points:**
- Responsibility-driven design
- Scenario-based development
- Object discovery from requirements
- Turn-based game logic
- State management
- Win condition detection

**Design Approach:**
The chapter teaches how to identify objects by analyzing scenarios and grouping related behaviors.

---

### CATA 9: TinyChat

**Location:** `Chapters/TinyChat/TinyChat.md`

**Description:** Build a REST-based chat application with both server and client components.

**Components:**
- `TCServer` - HTTP server using Teapot framework
- `TinyChat` - GUI client application
- `TCMessage` - Message representation
- `TCMessageQueue` - Server-side message storage
- `TCConsole` - Graphical chat interface

**Learning Points:**
- Client-server architecture
- REST API design
- HTTP communication
- GUI development with Morphic
- Real-time messaging patterns

---

### Key Learning Themes Across All CATAs

#### 1. Test-Driven Development (TDD)
Every CATA emphasizes writing tests first:
- Define expected behavior with tests
- Implement code to make tests pass
- Refactor while keeping tests green

#### 2. Message Passing
Pharo's pure object-oriented nature means everything is accomplished through messages:
- Unary messages: `counter increment`
- Binary messages: `3 + 4`
- Keyword messages: `die withFaces: 20`

#### 3. Polymorphism
Objects with different implementations can respond to the same messages:
- Die and DieHandle both respond to `roll`
- Different tile types respond to `landOn:`
- Various expression types respond to `evaluate`

#### 4. Inheritance
Building class hierarchies to share and specialize behavior:
- Expression classes inherit from a common superclass
- Network nodes extend LNNode
- Game tiles specialize from a base Tile class

#### 5. Collection Power
Pharo's rich collection library simplifies many tasks:
- `do:` for iteration
- `select:` for filtering
- `collect:` for transformation
- `sum:` for aggregation
- Sets for uniqueness

#### 6. Clean API Design
- Polymorphic interfaces
- Factory methods for object creation
- Meaningful method names
- Proper encapsulation

### Progression Path

We recommend working through the CATAs in this order:

1. **Counter** - Start here to learn basic class creation
2. **Collection Katas** - Master Pharo's powerful collections
3. **Converter** - Practice TDD workflow
4. **Wallet** - Combine collections with domain objects
5. **Dice DSL** - Learn class extensions and DSL creation
6. **Expression Interpreter** - Understand inheritance and trees
7. **Simple LAN** - Apply inheritance to a larger system
8. **Snakes and Ladders** - Design a complete application
9. **TinyChat** - Build a networked application

### Conclusion

These CATAs provide a progressive journey through object-oriented programming concepts. Each exercise builds upon previous knowledge while introducing new concepts. By completing all exercises, you will have a solid foundation in:

- Object-oriented design
- Test-driven development
- Pharo syntax and idioms
- Clean code practices
- Design patterns fundamentals

The key to learning is practice - work through each CATA, experiment with variations, and don't hesitate to extend the exercises with your own ideas.
