# W05D1 Building Better Apps with Value Types (Stretch)
### What is the NSCopying protocol, what problem is it solving?
* protocol that objects adopt to provide functional copies of themselves. It prevents sharing in reference semantics
### What is "defensive copying" and what is "defensive" about it? What problems do we encounter if we blindly apply defensive copying everywhere?
*  copy everytime a new object with reference type is made.


### In Cocoa and Objective-C, why do NSString, NSArray, NSURLRequest, NSDate, UIImage, NSNumber and others conform to NSCopying?
* to make defensive copying possible without boilerplate code

### What is immutable state vs mutable state?
* immutable state is an object that can’t change its variables after being initiated.

### Can you think of some recent code you've written that would have benefited from immutable state?

### In the discussion around the "Sieve of Eratosthenes", why is the immutable version of the algorithm less performant?
* the immutable version has to go through the rest of the array each time.

### In the example around creating an NSURL object element by element starting from the user's home directory, what is the difference between the immutable algorithm (using NSArray) vs the mutable algorithm (using NSMutableArray)?
* in an mutable algorithm only one object is needed. The immutable algorithm creates a new object each time it adds an element


###  In Swift, tuples, structs and enums are value types (similar to the fundamental types integers, doubles, strings, characters, etc.). What does this mean?
* all value of tuples, structs, and enums are copied when it gets a new reference

### What does it mean when two value types are equivalent? Why would it need to satisfy the following three properties: reflexive, symmetric and transitive?
* the value stored in the two types are equal. If reflexive, symmetric, and transitive properties are the same they can’t be considered equal.

### What is the distinction between equivalence (i.e. Equatable protocol) and identity? Why is it important?
* equivalence is when the value is the same and identity is when the memory address and value is the same.

### How do value types help prevent race conditions in a multithreaded environment?
* because value types are copied when they are accessed two threads will never reference the same memory address

### What is "copy on write"? What advantages does it give to value semantics?
* it decreases the overhead of copying done in value type systems.
### In the example for a Diagram, what does the Drawable protocol provide us over just using the individual Circle and Polygon structs?
* we can put Circles and Polygons  into one collection type

### In the struct Diagram, why is the method addItem marked mutating?
* the object is mutated from a Drawable protocol to a Circle object or polygon object.
### If Diagram conformed to the protocol Drawable, and we were using reference semantics, why would there be an infinite recursion?
* in the example if we put a document into the array it would call itself over and over.

### In the Image example, why do we need to use the .isEqual() operator instead of the identity === operator to compare the UIImage properties?
* we have to compare the data of UIImage instead of the memory address

### In the BezierPath struct, what problem is highlighted with the fact that the addToLineToPoint() method is not marked as mutating? Why is Swift not flagging this?


### How does using value types make it easy to implement the "Undo" or "History" feature using an undoStack?
* each object in the undoStack can be accessed.  without figuring out  how each object was made.