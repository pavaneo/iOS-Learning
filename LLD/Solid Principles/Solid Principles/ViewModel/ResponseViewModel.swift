//
//  ResponseViewModel.swift
//  Solid Principles
//
//  Created by Pavan Kumar J on 03/09/23.
//

import Foundation

protocol ResponseViewModelDelegate {
    func responseBasedOnTypeSelection(type: ReseponseType)
}

class ResponseViewModel: ObservableObject, ResponseViewModelDelegate {
    
    @Published var commentModel: [ResponseCommentModel] = []
    @Published var usersModel: [ResponseUsersModel] = []
    
    func responseBasedOnTypeSelection(type: ReseponseType)  {
        if type == .comments {
            NetworkService().request(type: [ResponseCommentModel].self,
                                     url: URL(string: "https://jsonplaceholder.typicode.com/comments")) { response in
                switch response {
                case .success(let data):
                    self.commentModel = data
                case .failure(let error):
                    print(error)
                }
            }
        } else {
            NetworkService().request(type: [ResponseUsersModel].self,
                                     url: URL(string: "https://jsonplaceholder.typicode.com/users")) { response in
                switch response {
                case .success(let data):
                    self.usersModel = data
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
