//
//  SecondViewPresenter.swift
//  MyProject
//
//  Created by Michael Novosad on 17.09.2022.
//

import UIKit

protocol SecondView: AnyObject {
    func setNameFromParam(_ text: String)
    func setNameFromPersistence(_ text: String)
    func showError(with message: String)
}

class SecondViewPresenter {
    
    let view: SecondView?
    let service: PersistenceService
    var nameFromParam: String?
    
    init(view: SecondView?, service: PersistenceService, nameFromParam: String? = nil) {
        self.view = view
        self.service = service
        self.nameFromParam = nameFromParam
    }
    
    func load() {
        presentNameFromParam()
        presentNameFromPersistance()
    }
    
    func presentNameFromParam() {
        guard let nameFromParam = nameFromParam, !nameFromParam.isEmpty else {
            view?.showError(with: "Error getting username from parameter!")
            return
        }
        let message = "\(nameFromParam) (name from parameter)"
        view?.setNameFromParam(message)
    }
    
    func presentNameFromPersistance() {
        guard let nameFromPersistence = service.getUserName(), !nameFromPersistence.isEmpty else {
            view?.showError(with: "Error getting user name from persistence")
                     return
        }
        let message = "\(nameFromPersistence) (from persistence)"
                view?.setNameFromPersistence(message)
    }
}
