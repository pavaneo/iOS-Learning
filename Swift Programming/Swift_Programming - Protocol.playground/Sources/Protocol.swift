import Foundation
import UIKit


/*
 Protocol Delegates
 Protocol Method Type
 Protocol Extension/Optional protocol/ Defalut implementaion of protocol
 Protocol Composition
 Protocol Associated type
 
 
 1. Delegates are one to one communications where as Notification is one to many, its better to use Delegate since its one to one communication and we can easily handle this compared to Notification

 */

//************ Mark: Protocol Extension/Optional protocol/ Defalut implementaion of protocol *************

/*
 Protocol Definition
 
 - Protocol is blueprint of methods, properties, and other requirements that suit a particular task or piece of functionality.
 */


// Protocol
public protocol ColorDelegate {
    var first: UIColor { get }
    var second: UIColor { get }
    var third: UIColor { get }
}

/* Protocol Extension or Defalut implementaion

    If extesnsions are not handled then we need to add required functions in conforming class/struct/enum
 
 */

public extension ColorDelegate {
    var first: UIColor {
        return .blue
    }
    
    var second: UIColor {
        return .red
    }
    
    var third: UIColor {
        return .brown
    }
}


/* Optional Protocol
    
    To make protocol optional we are marking by 'Optional' and calling protocol function itself as @objc, this is not a ideal way to call the protocol because under the hood we are making call of Objective - c API's
 
 */

@objc protocol OptionalProtocol {
    func requiredFunctionToCall()
    @objc optional func optionalFunctionToCall()
}


//************ Mark: Protocol Composition *************

/*
  Combining multiple protocol into one single protocol can be a protocol composition
 */

protocol Bird {
    var birdName: String { get }
}

protocol Human {
    var humanName: String { get }
}

protocol Plants {
    var treeName: String { get }
}

protocol Earth: Bird, Human, Plants {}

class World: Earth {
    
    var birdName: String {
        return "HummingBird"
    }
    
    var humanName: String {
        return "Josh"
    }
    
    var treeName: String {
        return "Mango"
    }
}


//************ Mark: Protocol Associated Type *************

/*
 associatedtype: can be any type once we declared by this keyword, protocol will be more generic, class that conforms to this protocol can also define the datatype of this so that we can avoid more strict datatype while defining the protocol
 */

protocol Calculator {
    associatedtype Value
    func doCalculations(_ first: Value, _ second: Value) -> Value
}

struct Calci: Calculator {
    
    typealias Value = Double
    
    func doCalculations(_ first: Double, _ second: Double) -> Double {
        first + second
    }
}
