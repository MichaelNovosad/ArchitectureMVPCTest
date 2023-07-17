//
//  FirstViewPresenter.swift
//  MyProject
//
//  Created by Michael Novosad on 17.09.2022.
//

import Foundation

protocol FirstView: AnyObject {
    func setTextFieldHint(_ hint: String)
    func setButtonText(_ text: String)
    func showError(with message: String)
}

protocol FirstViewPresenterDelegate: AnyObject {
    func didEnterName(_ userName: String)
}

class FirstViewPresenter {
    let view: FirstView
    let service: PersistenceService
    weak var delegate: FirstViewPresenterDelegate?
    
    init(view: FirstView, service: PersistenceService, delegate: FirstViewPresenterDelegate? = nil) {
        self.view = view
        self.service = service
        self.delegate = delegate
    }
    
    func load() {
        view.setButtonText("Submit your name")
        view.setTextFieldHint("Enter your name here...")
    }
    
    @objc
    func persist(userName: String?) {
        guard let userName = userName, !userName.isEmpty else {
            view.showError(with: "Enter username field correctly!")
            return
        }
        
        service.persist(userName: userName)
        delegate?.didEnterName(userName)
    }
}
