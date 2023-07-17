//
//  AppCoordinator.swift
//  MyProject
//
//  Created by Michael Novosad on 17.09.2022.
//

import Foundation
import UIKit

protocol Coordinator {
    func start()
}

class AppCoordinator: Coordinator {
    var window: UIWindow
    private let navigationController: UINavigationController
    
    var starterCoordinator: Coordinator?
    
    init(window: UIWindow, navigationController: UINavigationController = UINavigationController()) {
        self.window = window
        self.navigationController = navigationController
        setupWindow()
        setupStarterCoordinator()
    }
    
    func setupWindow() {
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
    }
    
    func setupStarterCoordinator() {
        starterCoordinator = FeatureCoordinator(navigationController: navigationController)
    }
    
    func start() {
        starterCoordinator?.start()
    }
}
