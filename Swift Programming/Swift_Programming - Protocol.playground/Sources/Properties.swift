import Foundation
/*
 Stored properties
 Computed properties
 Get and Set Properties
 Lazy Stored Properties
 Property Observers
 Property Wrappers
 */


/*
 Stored Properties
 
 “a stored property is a constant or variable that’s stored as part of an instance of a particular class or structure. Stored properties can be either variable stored properties (introduced by the var keyword) or constant stored properties (introduced by the let keyword).”
 
 */

struct Circle {
    var radius: Double
    var numberOfRings: Int
}

// “When an instance of a value type is marked as a constant, so are all of its properties.”

let geometry = Circle(radius: 50.0, numberOfRings: 1)

//geometry.numberOfRings = 3
//geometry.radius = 30.0


/*
 Computed Properties
 
 "In addition to stored properties, classes, structures, and enumerations can define computed properties, which don’t actually store a value.”
 
 - Computed properties are always declared as Var
 - Can't assign value to Computed properties, we can assign code to that property
 
 */

public struct Square {
    public var numberOfSquares: Int
    public var totalNumberOfSquares: Int {
        get {
            return numberOfSquares * numberOfSquares
        } set {
            numberOfSquares = newValue
        }
    }
    public init(numberOfSquares: Int) {
        self.numberOfSquares = numberOfSquares
    }
}

/*
 Lazy Stored Properties
 
 “A lazy stored property is a property whose initial value isn’t calculated until the first time it’s used.”
 
 “You must always declare a lazy property as a variable (with the var keyword), because its initial value might not be retrieved until after instance initialization completes. Constant properties must always have a value before initialization completes, and therefore can’t be declared as lazy.”
 */

public struct Person {
    
    public var firstName: String = "Pavan"
    
    public var lastName: String = "Jain"
    
    // its value not calculated until its used
    public lazy var getFullName = firstName + " " + lastName
    
    public init() {}

}



/*
 Property observers
 
 willset
 didset
 
 */


/*
 
 Property wrappers
 
 Delcared as @PropertyWrapper
 
 */
