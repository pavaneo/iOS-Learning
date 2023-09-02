import Foundation

// ********* Equatable Protocol ****************
// A Type that can be compared with the value or equality


// Struct dont need to implement == equatable function because these are the value types.
public struct Employee: Equatable {
    let name: String
    let bankId: String
    public init(name: String, bankId: String) {
        self.name = name
        self.bankId = bankId
    }
}

public class EmployeeClass: Equatable {
    
    public static func == (lhs: EmployeeClass, rhs: EmployeeClass) -> Bool {
        lhs.name == rhs.name
    }
    
    let name: String
    let bankId: String
    
    public init(name: String, bankId: String) {
        self.name = name
        self.bankId = bankId
    }
}

// Hashable - Provider unique hash integer value to custom type.

public class PersonClass {
    let id: String = "1"
    let address: String = "California, USA"
}
