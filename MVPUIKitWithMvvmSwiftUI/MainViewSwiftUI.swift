//
//  MainViewSwiftUI.swift
//  MVPUIKitWithMvvmSwiftUI
//
//  Created by Thomas on 2023/4/22.
//

import SwiftUI
import Combine

struct MainViewSwiftUI:View{
    @StateObject var viewModel = MainViewModel()

    var body: some View {
        VStack {
            TextField("Enter username", text: $viewModel.username)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button(action: {
                viewModel.fetchUserInfo(username: viewModel.username)
            }) {
                Text("Search")
            }
            .padding()

            if let userList = viewModel.userList {
                List(userList, id: \.self) { user in
                    Text(user)
                }
            }

            if let error = viewModel.error {
                Text(error)
                    .foregroundColor(.red)
            }
        }
        .padding()
    }

   
}

