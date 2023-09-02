import Foundation

//<T: Numeric> -> Type Constraints
public func addTwoNumbers<T: Numeric>(a: T, b: T) -> T {
    a + b
}

// Generic Struct to add or remove element
public struct GenericStack<T> {
    public var items: [T] = []
    
    public init() {}
    
    public mutating func addItem(item: T) -> [T] {
        items.append(item)
        return items
    }
    
    public mutating func removeLastItem() {
        items.removeLast()
    }
}

//Multiple Associated Types
protocol CheckInputAndOutput {
    associatedtype input
    associatedtype output
    init(value: input)
    func addNumberToDecimal() -> output
}

public struct Result: CheckInputAndOutput {
    public typealias input = Int
    typealias output = Double
    public var value: input
    public init(value: input) {
        self.value = value
    }
    public func addNumberToDecimal() -> Double {
        return Double(value) + 10.0
    }
}

// Generic Where Clauses - used to restric the type and enable to define requirements
// Extensions with a Generic Where Clause
