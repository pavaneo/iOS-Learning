//
//  Comment+CoreDataProperties.swift
//  Solid Principles
//
//  Created by Pavan Kumar J on 06/09/23.
//
//

import Foundation
import CoreData


extension Comment {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Comment> {
        return NSFetchRequest<Comment>(entityName: "Comment")
    }

    @NSManaged public var postId: Int64
    @NSManaged public var id: Int64
    @NSManaged public var name: String?
    @NSManaged public var email: String?
    @NSManaged public var body: String?

}

extension Comment : Identifiable {

}
