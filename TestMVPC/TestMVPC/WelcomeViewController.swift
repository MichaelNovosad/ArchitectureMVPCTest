//
//  WelcomeViewController.swift
//  MyProject
//
//  Created by Michael Novosad on 17.09.2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    weak var presenter: SecondViewPresenter?
    
    lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var nameLabel2: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        
        setupSubviews()
        setupConstraints()
        presenter?.load()
    }

    func setupSubviews() {
        view.addSubview(welcomeLabel)
        view.addSubview(nameLabel)
        view.addSubview(nameLabel2)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
        
            welcomeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 10),

            nameLabel2.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10)
        ])
    }
}

extension WelcomeViewController: SecondView {
    func setNameFromParam(_ text: String) {
        nameLabel.text = text
    }
    func setNameFromPersistence(_ text: String) {
        nameLabel2.text = text
    }
}
