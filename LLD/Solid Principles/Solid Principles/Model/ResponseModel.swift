//
//  ResponseModel.swift
//  Solid Principles
//
//  Created by Pavan Kumar J on 03/09/23.
//

import Foundation


enum ReseponseType {
    case comments
    case users
    case none
}

struct ResponseCommentModel: Identifiable, Decodable {
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String
}

struct ResponseUsersModel: Identifiable, Decodable {
    var id: Int
    var name: String
    var username: String
    var email: String
    var phone: String
}
