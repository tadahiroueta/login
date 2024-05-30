//
//  ViewController.swift
//  login
//
//  Created by Ueta, Lucas T on 1/24/24.
//

import UIKit

class LoginPage: UIViewController {
    let usernameField = UITextField(), passwordField = UITextField(), incorrectLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Voluntracker"
        view.backgroundColor = .systemBackground
        
        let (_, top, bottom) = addStructure(to: view)
        
        usernameField.placeholder = "Username"
        usernameField.borderStyle = .roundedRect
        top.addArrangedSubview(usernameField)
        usernameField.translatesAutoresizingMaskIntoConstraints = false
        
        passwordField.placeholder = "Password"
        passwordField.borderStyle = .roundedRect
        top.addArrangedSubview(passwordField)
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        
        incorrectLabel.text = "Incorrect username or password"
        incorrectLabel.textColor = .systemRed
        incorrectLabel.isHidden = true
        top.addArrangedSubview(incorrectLabel)
        
        let submitButton = UIButton()
        submitButton.setTitle("Log In", for: .normal)
        submitButton.setTitleColor(.systemBlue, for: .normal)
        submitButton.addTarget(self, action: #selector(submit), for: .touchUpInside)
        bottom.addArrangedSubview(submitButton)
        
        let horizontalButtons = UIStackView()
        horizontalButtons.axis = .horizontal
        horizontalButtons.spacing = 30
        bottom.addArrangedSubview(horizontalButtons)
        
        let createAccountButton = UIButton()
        createAccountButton.setTitle("Create account", for: .normal)
        createAccountButton.setTitleColor(.systemBlue, for: .normal)
        createAccountButton.addTarget(self, action: #selector(createAccount), for: .touchUpInside)
        horizontalButtons.addArrangedSubview(createAccountButton)
        
        let forgotPasswordButton = UIButton()
        forgotPasswordButton.setTitle("Forgot password", for: .normal)
        forgotPasswordButton.setTitleColor(.systemBlue, for: .normal)
        forgotPasswordButton.addTarget(self, action: #selector(forgotPassword), for: .touchUpInside)
        horizontalButtons.addArrangedSubview(forgotPasswordButton)
    }
    
    @objc func submit() {
        guard let account = UserDefaults.standard.dictionary(forKey: usernameField.text!) else {
            incorrectLabel.isHidden = false
            return
        }
        guard account["password"] as? String == passwordField.text else {
            incorrectLabel.isHidden = false
            return
        }

        UserDefaults.standard.setValue(account["username"] as! String, forKey: "current")
        navigationController!.pushViewController(TrackerPage(), animated: true)
        navigationController!.topViewController!.title = "Hey, \(usernameField.text!)"
    }
    
    @objc func createAccount() { navigationController!.pushViewController(CreateAccountPage(), animated: true) }
    
    @objc func forgotPassword() {
        navigationController!.pushViewController(ForgotPasswordPage(), animated: true)
        
    }
}

