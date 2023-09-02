import Foundation

/*
 “A class can inherit methods, properties, and other characteristics from another class”
 */


//Base Class
public class Vehicle {
    public var currentSpeed: Double = 0.0
    public var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    
    public init(currentSpeed: Double = 0.0) {
        self.currentSpeed = currentSpeed
    }
    
    public func makeNoise() {
        print("Wroom Wroom!")
    }
}

//// Sub-Class
public class Bicycle: Vehicle {
    public var hasBasket = false
    public override var description: String {
        return "Hello Sub Class"
    }
    public override var currentSpeed: Double 
    
    public init(hasBasket: Bool = false, currentSpeed: Double) {
        super.init(currentSpeed: 50.0)
        self.hasBasket = hasBasket
    }
    
    public override func makeNoise() {
        print("Pooow Pooow")
    }
}
