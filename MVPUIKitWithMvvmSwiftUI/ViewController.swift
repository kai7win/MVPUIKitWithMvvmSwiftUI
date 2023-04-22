//
//  ViewController.swift
//  MVPUIKitWithMvvmSwiftUI
//
//  Created by Thomas on 2023/4/22.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    //要新增一個textView，內容描述這個範例的目的
    let textView = UITextView()

    //2個UIButton，一個是SwiftUI版本，一個是UIKit版本
    let swiftUIButton = UIButton()
    let uiKitButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        //設定navigationController的title
        navigationItem.title = "共用同個Presenter"

        //設定textView，要寫多行內容
         textView.text = "UIKit架構MVP，SWiftUI架構MVVM\n邏輯共用同個Presenter\n\n輸入框輸入test：\n會模擬打API載入內容到View上\n\n輸入其他文字：\n出現ErrorView"

        textView.font = UIFont.systemFont(ofSize: 15)
        textView.isEditable = false
        view.addSubview(textView)

        //設定textView的constraint
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        textView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        textView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        textView.heightAnchor.constraint(equalToConstant: 400).isActive = true



        //設定uiKitButton
        uiKitButton.setTitle("前往UIKit版本", for: .normal)
        uiKitButton.setTitleColor(.black, for: .normal)
        uiKitButton.backgroundColor = .white
        uiKitButton.layer.cornerRadius = 10
        uiKitButton.layer.borderWidth = 1
        uiKitButton.layer.borderColor = UIColor.black.cgColor
        uiKitButton.addTarget(self, action: #selector(uiKitButtonAction), for: .touchUpInside)
        view.addSubview(uiKitButton)


        //設定uiKitButton的constraint
        uiKitButton.translatesAutoresizingMaskIntoConstraints = false
        uiKitButton.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 20).isActive = true
        uiKitButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        uiKitButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        uiKitButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        uiKitButton.heightAnchor.constraint(equalToConstant: 50).isActive = true


        //設定swiftUIButton
        swiftUIButton.setTitle("前往SwiftUI版本", for: .normal)
        swiftUIButton.setTitleColor(.black, for: .normal)
        swiftUIButton.backgroundColor = .white
        swiftUIButton.layer.cornerRadius = 10
        swiftUIButton.layer.borderWidth = 1
        swiftUIButton.layer.borderColor = UIColor.black.cgColor
        swiftUIButton.addTarget(self, action: #selector(swiftUIButtonAction), for: .touchUpInside)
        view.addSubview(swiftUIButton)

        //設定swiftUIButton的constraint
        swiftUIButton.translatesAutoresizingMaskIntoConstraints = false
        swiftUIButton.topAnchor.constraint(equalTo: uiKitButton.bottomAnchor, constant: 20).isActive = true
        swiftUIButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        swiftUIButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        swiftUIButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        swiftUIButton.heightAnchor.constraint(equalToConstant: 50).isActive = true

   
    }
    
    //swiftUIButton的action
    @objc func swiftUIButtonAction() {
        //在ViewController內，navigationController推出SwiftUI的頁面
        let swiftUIView = MainViewSwiftUI()
        let swiftUIHostingController = UIHostingController(rootView: swiftUIView)
        navigationController?.pushViewController(swiftUIHostingController, animated: true)
    }

    //uiKitButton的action
    @objc func uiKitButtonAction() {
        //在ViewController內，navigationController推出UIKit的頁面
        let mainView = MainViewController()
        navigationController?.pushViewController(mainView, animated: true)
    }

}

