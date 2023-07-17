//
//  FeatureCoordinator.swift
//  MyProject
//
//  Created by Michael Novosad on 17.09.2022.
//

import UIKit

class FeatureCoordinator: Coordinator {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showFirstScene()
    }
}

extension FeatureCoordinator {
    func showFirstScene() {
        let scene = FeatureScreenFactory.makeFirstScene(delegate: self)
        navigationController.viewControllers = [scene]
    }
    
    func showSecondScene(userName: String) {
        let scene = FeatureScreenFactory.makeSecondScene(userName: userName)
        navigationController.pushViewController(scene, animated: true)
    }
}

extension FeatureCoordinator: FirstViewPresenterDelegate {
    func didEnterName(_ userName: String) {
        showSecondScene(userName: userName)
    }
}
