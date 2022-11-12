//
//  MyTradeMeCoordenator.swift
//  Trade Me
//
//  Created by Oleksii Aharkov on 10.11.2022.
//

import Foundation
import UIKit
import Combine

class MyTradeMeCoordenator: BaseCoordenator {
    
    var anyCancellables = Set<AnyCancellable>()
    
    var perentCoordinator:MainTabBarCoordinator?
    
    override init(navigationController: UINavigationController) {
        super.init(navigationController: navigationController)
        self.navigationController.tabBarItem = UITabBarItem(title: "My Trade Me", image: UIImage.init(named: "profile-16"), tag: 0)
    }
    
    override func start() {
        let vc = MyTradeMeViewController.loadFromNib()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
        perentCoordinator?.MainTabBarViews.append(navigationController)
    }
    
}
