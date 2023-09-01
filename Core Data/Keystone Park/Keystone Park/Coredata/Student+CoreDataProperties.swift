//
//  Student+CoreDataProperties.swift
//  Keystone Park
//
//  Created by Pavan Kumar J on 27/08/23.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var name: String?
    @NSManaged public var lesson: Lesson?

}

extension Student : Identifiable {

}
