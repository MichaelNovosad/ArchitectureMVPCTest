//
//  LoginViewController.swift
//  MyProject
//
//  Created by Michael Novosad on 17.09.2022.
//

import UIKit

class LoginViewController: UIViewController {

    weak var presenter: FirstViewPresenter?
    
    lazy var textField: UITextField = {
       let textField = UITextField()
        textField.placeholder = "Enter text..."
        textField.backgroundColor = .lightGray
        textField.textColor = .black
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var button: UIButton = {
        let button = UIButton(type: .custom)
        button.titleLabel?.text = "Submit"
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.backgroundColor = UIColor.link
        button.isUserInteractionEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupSubviews()
        setupConstraints()
        presenter?.load()
        setupActions()
    }

    func setupSubviews() {
        view.addSubview(textField)
        view.addSubview(button)
    }
    
    func setupActions() {
        button.addTarget(self, action: #selector(doAction), for: .touchUpInside)
    }
    
    @objc
    private func doAction() {
        guard let textField = textField.text, !textField.isEmpty else {
            return
        }
            presenter?.persist(userName: textField)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
        
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textField.widthAnchor.constraint(equalToConstant: 200),
            
            button.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 10),
            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 30),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        
        ])
    }
}

extension LoginViewController: FirstView {
    func setTextFieldHint(_ hint: String) {

    }
    func setButtonText(_ text: String) {

    }
}
