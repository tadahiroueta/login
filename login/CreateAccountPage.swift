//
//  CreatePage.swift
//  login
//
//  Created by Ueta, Lucas T on 1/26/24.
//

import UIKit

class CreateAccountPage: UIViewController {
    let usernameField = UITextField(), passwordField = UITextField(), passwordAgainField = UITextField(), comment = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Create Account"
        view.backgroundColor = .systemBackground
        
        let (_, inputs, buttons) = addStructure(to: view)
        inputs.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -40).isActive = true
        
        addInput("Choose username", to: inputs, with: usernameField)
        addInput("Choose password", to: inputs, with: passwordField)
        addInput("Retype password", to: inputs, with: passwordAgainField)
        
        comment.text = "Invalid username or password"
        comment.textColor = .systemRed
        comment.isHidden = true
        inputs.addArrangedSubview(comment)
        
        let submitButton = UIButton()
        submitButton.setTitle("Create account", for: .normal)
        submitButton.setTitleColor(.systemBlue, for: .normal)
        submitButton.addTarget(self, action: #selector(createAccount), for: .touchUpInside)
        buttons.addArrangedSubview(submitButton)
    }
    
    @objc func createAccount() {
        guard let username = usernameField.text else {
            comment.isHidden = false
            return
        }
        
        guard let password = passwordField.text else {
            comment.isHidden = false
            return
        }
        
        guard password == passwordAgainField.text else {
            comment.isHidden = false
            return
        }
        
        let account: [String: Any?] = [
            "username": username,
            "password": password,
            "progress": 0,
            "goal": 10
        ]
        UserDefaults.standard.setValue(account, forKey: username)
        navigationController!.popViewController(animated: true)
    }
}
