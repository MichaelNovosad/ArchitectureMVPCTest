//
//  FeatureScreenFactory.swift
//  MyProject
//
//  Created by Michael Novosad on 17.09.2022.
//

import UIKit

struct FeatureScreenFactory {
    static func makeFirstScene(delegate: FirstViewPresenterDelegate?) -> UIViewController {
        let viewController = LoginViewController()
        let service = PersistenceService()
        let presenter = FirstViewPresenter(view: viewController, service: service, delegate: delegate)
        viewController.presenter = presenter
        
        return viewController
    }
    
    static func makeSecondScene(userName: String) -> UIViewController {
        let viewController = WelcomeViewController()
        let service = PersistenceService()
        let presenter = SecondViewPresenter(view: viewController, service: service, nameFromParam: userName)
        viewController.presenter = presenter
        
        return viewController
    }
}
