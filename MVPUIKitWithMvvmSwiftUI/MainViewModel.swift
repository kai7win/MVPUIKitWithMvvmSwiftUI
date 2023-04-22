//
//  MainViewModel.swift
//  MVPUIKitWithMvvmSwiftUI
//
//  Created by Thomas on 2023/4/22.
//

import SwiftUI

class MainViewModel: ObservableObject, MainView {
   
    private var presenter: MainPresenter!
    @Published var username: String = ""
    @Published var userList: [String]?
    @Published var error: String?

    init() {
        self.presenter = MainPresenter(view: self)
    }

    func fetchUserInfo(username: String) {
        print("Debug - MainViewModel - fetch function username: \(username)")
        guard !username.isEmpty else {
            error = "Please enter a username"
            return
        }
        presenter.fetchUserInfo(username: username)
    }
    
    func displayUserList(_ userList: [String]) {
        print("Debug - MainViewModel - displayUserList")
        self.userList = userList
    }
    
    func displayError(_ error: String) {
        print("Debug - MainViewModel - displayError")
        self.error = error
    }
    
}
