//
//  ContentView.swift
//  Solid Principles
//
//  Created by Pavan Kumar J on 03/09/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: ResponseViewModel
    @State var isCommentsSelected = false
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.commentModel.count == 0 && viewModel.usersModel.count == 0 {
                    VStack {
                        Text("Please Select any of the response type on top above")
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                    }
                } else {
                    if isCommentsSelected {
                        List(viewModel.commentModel) { content in
                            VStack(alignment: .leading, spacing: 15.0) {
                                HStack {
                                    Text("Post Id:")
                                    Text("\(content.postId)").foregroundColor(.gray)
                                }
                                HStack {
                                    Text("Id:")
                                    Text("\(content.id)")
                                        .foregroundColor(.gray)
                                }
                                HStack {
                                    Text("Name:")
                                    Text(content.name)
                                        .foregroundColor(.gray)
                                }
                                HStack {
                                    Text("Email:")
                                    Text(content.email)
                                        .foregroundColor(.gray)
                                }
                                HStack {
                                    Text("body:")
                                    Text(content.body)
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                    } else {
                        List(viewModel.usersModel) { content in
                            VStack(alignment: .leading, spacing: 15.0) {
                                HStack {
                                    Text("Id:")
                                    Text("\(content.id)")
                                        .foregroundColor(.gray)
                                }
                                HStack {
                                    Text("name:")
                                    Text(content.name)
                                        .foregroundColor(.gray)
                                }
                                HStack {
                                    Text("UserName:")
                                    Text(content.username).foregroundColor(.gray)
                                }
                                HStack {
                                    Text("Email:")
                                    Text(content.email)
                                        .foregroundColor(.gray)
                                }
                                HStack {
                                    Text("Phone:")
                                    Text(content.phone)
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Response Data")
            .navigationBarItems(leading:
                                    Button("Comments Response") {
                isCommentsSelected = true
                viewModel.responseBasedOnTypeSelection(type: .comments)
            },
                                trailing:
                                    Button("Users Response") {
                isCommentsSelected = false
                viewModel.responseBasedOnTypeSelection(type: .users)
            }).navigationBarBackButtonHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ResponseViewModel())
    }
}


extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

class DeveloperPreview {
    static let instance = DeveloperPreview()
    private init() {}
    let homevm = ResponseViewModel()
}
