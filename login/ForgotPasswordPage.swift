//
//  ForgotPasswordPage.swift
//  login
//
//  Created by Ueta, Lucas T on 1/26/24.
//

import UIKit

class ForgotPasswordPage: UIViewController {
    let confirmation = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Forgot Password"
        view.backgroundColor = .systemBackground
        
        let (_, top, bottom) = addStructure(to: view)
        top.alignment = .center
        
        let comment = UILabel()
        comment.text = "Enter your email to reset your password"
        top.addArrangedSubview(comment)
        
        let email = UITextField()
        email.placeholder = "Email"
        email.borderStyle = .roundedRect
        top.addArrangedSubview(email)
        email.widthAnchor.constraint(equalTo: top.widthAnchor).isActive = true
        
        let submit = UIButton()
        submit.setTitle("Send recovery email", for: .normal)
        submit.setTitleColor(.systemBlue, for: .normal)
        submit.addTarget(self, action: #selector(send), for: .touchUpInside)
        bottom.addArrangedSubview(submit)
        
        confirmation.text = "An email has been sent to this address. Read the email for more instruction on resetting your password."
        confirmation.numberOfLines = 0
        confirmation.textAlignment = .center
        confirmation.isHidden = true
        bottom.addArrangedSubview(confirmation)
        confirmation.widthAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.widthAnchor, constant: -40).isActive = true
    }
    
    @objc func send() { confirmation.isHidden = false }
}
