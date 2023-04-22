//
//  MainPresenter.swift
//  MVPUIKitWithMvvmSwiftUI
//
//  Created by Thomas on 2023/4/22.
//

import Foundation

protocol MainView: AnyObject {
    func displayUserList(_ userList: [String])
    func displayError(_ error: String)
}


class MainPresenter {
    weak var view: MainView?
    private var userList: [String] = []

    init(view: MainView) {
        self.view = view
    }

    func fetchUserInfo(username: String) {
        // 模擬API請求
        DispatchQueue.global().async {
            // 模擬網絡延遲
            sleep(2)

            DispatchQueue.main.async {
                if username == "test" {
                    print("Debug - presenter - fetch function username: \(username)")
                    let userInfo = "User info: \(username)"
                    self.userList.append(userInfo)
                    print("Debug - presenter - fetch function 準備去ViewModel DisPlayUserList")
                    self.view?.displayUserList(self.userList)
                } else {
                    print("Debug - presenter - fetch function 準備去ViewModel displayError")
                    self.view?.displayError("User not found")
                }
            }
        }
    }
}
