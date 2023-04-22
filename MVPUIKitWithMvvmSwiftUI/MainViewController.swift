//
//  MainViewController.swift
//  MVPUIKitWithMvvmSwiftUI
//
//  Created by Thomas on 2023/4/22.
//

import UIKit

class MainViewController: UIViewController, MainView {
    private var presenter: MainPresenter!
    private let usernameTextField = UITextField()
    private let searchButton = UIButton(type: .system)
    private let userListTextView = UITextView()

    init() {
        super.init(nibName: nil, bundle: nil)
        self.presenter = MainPresenter(view: self)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        usernameTextField.placeholder = "Enter username"
        usernameTextField.borderStyle = .roundedRect
        view.addSubview(usernameTextField)
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false

        searchButton.setTitle("Search", for: .normal)
        searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        view.addSubview(searchButton)
        searchButton.translatesAutoresizingMaskIntoConstraints = false

        userListTextView.isEditable = false
        userListTextView.layer.borderColor = UIColor.gray.cgColor
        userListTextView.layer.borderWidth = 1
        userListTextView.layer.cornerRadius = 5
        view.addSubview(userListTextView)
        userListTextView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            usernameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            usernameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            usernameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),

            searchButton.leadingAnchor.constraint(equalTo: usernameTextField.leadingAnchor),
            searchButton.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 8),

            userListTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            userListTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            userListTextView.topAnchor.constraint(equalTo: searchButton.bottomAnchor, constant: 16),
            userListTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }

    @objc private func searchButtonTapped() {
        guard let username = usernameTextField.text, !username.isEmpty else {
            displayError("Please enter a username")
            return
        }
        presenter.fetchUserInfo(username: username)
    }

    func displayUserList(_ userList: [String]) {
        userListTextView.text = userList.joined(separator: "\n")
    }

    func displayError(_ error: String) {
        let alertController = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        present(alertController, animated: true)
    }
}

