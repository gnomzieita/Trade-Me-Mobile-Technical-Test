//
//  MainTabBarCoordinator.swift
//  Trade Me
//
//  Created by Oleksii Aharkov on 10.11.2022.
//

import Foundation
import UIKit
import Combine

class MainTabBarCoordinator: BaseCoordenator {
        
    var MainTabBarViews = [UIViewController]()
    

    
    override func start() {
        let vc = RootTabBarController.loadFromNib()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
        
        LatestListings()
        Watchlist()
        MyTradeMe()
        
        vc.viewControllers = MainTabBarViews
    }
    
    private func LatestListings() {
        let child = LatestListingsCoordenator(navigationController: UINavigationController())
        child.perentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    private func Watchlist() {
        let child = WatchlistCoordenator(navigationController: UINavigationController())
        child.perentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    private func MyTradeMe() {
        let child = MyTradeMeCoordenator(navigationController: UINavigationController())
        child.perentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
}


