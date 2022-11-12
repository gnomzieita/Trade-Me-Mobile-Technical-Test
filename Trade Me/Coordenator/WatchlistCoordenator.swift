//
//  WatchlistCoordenator.swift
//  Trade Me
//
//  Created by Oleksii Aharkov on 10.11.2022.
//

import Foundation
import UIKit
import Combine

class WatchlistCoordenator: BaseCoordenator {
    
    var anyCancellables = Set<AnyCancellable>()
    
    var perentCoordinator:MainTabBarCoordinator?
    
    override init(navigationController: UINavigationController) {
        super.init(navigationController: navigationController)
        self.navigationController.tabBarItem = UITabBarItem(title: "Watchlist", image: UIImage.init(named: "watchlist"), tag: 0)
    }
    
    override func start() {
        let vc = WatchlistViewController.loadFromNib()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
        perentCoordinator?.MainTabBarViews.append(navigationController)
    }
    
}
