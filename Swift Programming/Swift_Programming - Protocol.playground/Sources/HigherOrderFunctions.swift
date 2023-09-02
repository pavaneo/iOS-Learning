import Foundation

// Heiger order functions takes functions as parameter and return function as parameter
// Map / FlatMap / CompactMap / Filter / Reduce / Sorted / ForEach

public func multiplyTwoNumber(value: Double) -> Double {
    value * 20.0
}

public func calculateDouble(activity: (Double) -> Double, distance: Double) -> Double {
    activity(distance)
}

// *********** MAP ************* Recursive in nature and its thread safe
// Apply value to each of the values in the array or colletion, and return the value

public struct HigherOrderFunction {
    
    var mappingArray = [1, 2, 3, 4]
    
    public init(){}
    
    public func returnMappedArrayValue() -> [Int] {
        mappingArray.map { $0 * 2 }
    }
    
    public func returnMappedString() -> [String] {
        mappingArray.map { "\($0)"}
    }
    
    public func dictionaryUppercase(items: [String: String]) -> [String] {
        items.map { key, value in
            key.uppercased()
        }
    }
}


// ********** FlatMap and CompactMap *******************
// Compact Map removes nil value from the result where as Map does not remove any nil values from the result.
// Flat Map Works with the collection of collection to get single combination of values

public struct FlatMapFunction {
    
    var flatMapCollection = [["One","Two"], ["Three", "Four"], ["Five", "Six"], ["Seven", "Eight"], ["Nine", "Ten"] ]
    
    public init() {}
    
    public func flatMapCombination() -> [String] {
        flatMapCollection.flatMap { item in
            item
        }
    }
}

public struct CompactMap {
    var content = ["2", "Integer", "Hello", "5", "6", "9"]

    public init() {}
    
    public func compactMapCombination() -> [Int] {
        content.compactMap { item in
            Int(item)
        }
    }
}

// *********** Filter / Reduce / Sorted ******************
// Filter - Filter the elements in the collection based on the condition we have given.

// Difference between Filter and Map is that - Map basically transforms the result into generic type where are Fliter return the type which was earlier.

// Reduce - Return the result of combining the elements of the sequence using the given closure.

// Sorted - Sort the element in the collection based on the condition what we will give, and input count and output count will be equal since this will just sort the elements and not removed any elements from the collection.

public struct FilterCollection {
    var filterCollection = [1, 20, 3, 45, 50, 43, 46, 47, 2, 4, 8]
    public init() {}
    
    public func printEvenNumbersFromCollection() -> [Int] {
        filterCollection.filter { item in
            // filter based on this condition, this condition will check for the even numbers
            item % 2 == 0
        }
    }
}

public struct SortedCollection {
    var sortCollection = [1, 20, 3, 45, 50, 43, 46, 47, 2, 4, 8]
    public init() {}
   
    public func sortGivenCollection() -> [Int] {
        sortCollection.sorted() // [1, 2, 3, 4, 8, 20, 43, 45, 46, 47, 50]
    }
    
    public func sortIncreasingOrder() -> [Int] {
        sortCollection.sorted(by: <) // [1, 2, 3, 4, 8, 20, 43, 45, 46, 47, 50]
    }
    
    public func sortDecreasingOrder() -> [Int] {
        sortCollection.sorted(by: >) // [50, 47, 46, 45, 43, 20, 8, 4, 3, 2, 1]
    }
}

public struct ReduceCollection {
    var reduceCollection = [1, 20, 3, 45, 50, 43, 46, 47, 2, 4, 8]
    public init() {}
    public func sumOfAllTheElement() -> Int {
        reduceCollection.reduce(0) { current, next in
            current + next
        }
    }
    
}

// ************* ForEach *************** Not recursive in nature and its not a thread safe
// loop through all the elements in the collections but does not return anything back, as compared to Map function
