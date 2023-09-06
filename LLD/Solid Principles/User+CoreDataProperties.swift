//
//  User+CoreDataProperties.swift
//  Solid Principles
//
//  Created by Pavan Kumar J on 06/09/23.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var id: Int64
    @NSManaged public var name: String?
    @NSManaged public var username: String?
    @NSManaged public var email: String?
    @NSManaged public var phone: String?

}

extension User : Identifiable {

}
