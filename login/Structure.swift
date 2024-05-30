//
//  Structure.swift
//  login
//
//  Created by Ueta, Lucas T on 1/26/24.
//

import UIKit

func addStructure(to view: UIView) -> (UIStackView, UIStackView, UIStackView) {
    let content = UIStackView()
    content.axis = .vertical
    content.spacing = 30
    view.addSubview(content)
    content.translatesAutoresizingMaskIntoConstraints = false
    content.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    content.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    
    let top = UIStackView()
    top.axis = .vertical
    top.spacing = 20
    content.addArrangedSubview(top)
    top.translatesAutoresizingMaskIntoConstraints = false
    
    let bottom = UIStackView()
    bottom.axis = .vertical
    bottom.spacing = 10
    content.addArrangedSubview(bottom)
    bottom.translatesAutoresizingMaskIntoConstraints = false
    
    return (content, top, bottom)
}

func addInput(_ labelText: String, to view: UIStackView, with input: UIView) -> UILabel {
    let stack = UIStackView()
    stack.axis = .horizontal
    stack.spacing = 20
    view.addArrangedSubview(stack)
    stack.translatesAutoresizingMaskIntoConstraints = false
    
    let label = UILabel()
    label.text = labelText
    stack.addArrangedSubview(label)
    label.translatesAutoresizingMaskIntoConstraints = false
    
    if let field = input as? UITextField { field.borderStyle = .roundedRect }
    stack.addArrangedSubview(input)
    input.translatesAutoresizingMaskIntoConstraints = false
    input.widthAnchor.constraint(lessThanOrEqualTo: stack.widthAnchor).isActive = true
    
    return label
}
