import UIKit

// Lazy Stored Properties
var xyz = Person()
xyz.firstName
xyz.lastName
xyz.getFullName

// Computed properties
var squares = Square(numberOfSquares: 2)

squares.numberOfSquares

// Calculates and return values
squares.totalNumberOfSquares

// Assign value to total number of squares
squares.totalNumberOfSquares
squares.totalNumberOfSquares = 10
squares.totalNumberOfSquares

// Generics
addTwoNumbers(a: 3, b: 4)

var genericStructInt = GenericStack<Int>()
genericStructInt.addItem(item: 4)
genericStructInt.removeLastItem()

var genericStructDouble = GenericStack<Double>()
genericStructDouble.addItem(item: 3.5)
genericStructDouble.removeLastItem()

var resultGenerics = Result(value: 16)
resultGenerics.addNumberToDecimal()

//Heigher order function

let higherOrderFunctionResult = calculateDouble(activity: multiplyTwoNumber, distance: 30.0)
let mappedValues = HigherOrderFunction().returnMappedArrayValue()
let mappedString = HigherOrderFunction().returnMappedString()
let mappedDict = HigherOrderFunction().dictionaryUppercase(items: ["one": "first", "two": "second", "three": "third"])

let flatMapCollection = FlatMapFunction().flatMapCombination()
let compactMapCollection = CompactMap().compactMapCombination()

let filterCollection = FilterCollection().printEvenNumbersFromCollection()
let sortedCollection = SortedCollection().sortGivenCollection()
let sortedCollectionIncreasingOrder = SortedCollection().sortIncreasingOrder()
let sortedCollectionDecreasingOrder = SortedCollection().sortDecreasingOrder()

let reduceCollection = ReduceCollection().sumOfAllTheElement()

// Equatable and hashable

let string1 = "Hello"
let string2 = "World"

if string1 == string2 {
    print("Same")
} else {
    print("Not Same")
}

// Enum

Direction.east.rawValue
Steps.two.rawValue

let stepsCount = Steps(rawValue: 4)
stepsCount

SocialMedia().socialMediaDetails(media: .linkedin(numberOfPosts: 10))

IndoorGames.allCases.count
print("\n")
for cases in IndoorGames.allCases {
    print(cases.rawValue)
}

let tail = LinkedList.tail(value: 60, node: nil)

let node = LinkedList.head(
    value: 20,
    node: LinkedList.node(
        value: 30,
        node: LinkedList.node(
            value: 40,
            node: LinkedList.node(
                value: 50, node: tail))))

let head = LinkedList.head(value: 10, node: node)

print("\n")
print(head)


// Ingeritance

let vehicle = Vehicle()
//let bicycle = Bicycle()
vehicle.makeNoise()
//bicycle.makeNoise()

