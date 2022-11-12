//
//  LatestListingsCoordenator.swift
//  Trade Me
//
//  Created by Oleksii Aharkov on 10.11.2022.
//

import Foundation
import UIKit
import Combine

protocol LoadDataProtocol {
    func update(_ data:[ListModel])
    
}

class LatestListingsCoordenator: BaseCoordenator {
    
    var delegat:LoadDataProtocol?
    var anyCancellables = Set<AnyCancellable>()
    
    var perentCoordinator:MainTabBarCoordinator?
    
    override init(navigationController: UINavigationController) {
        super.init(navigationController: navigationController)
        self.navigationController.tabBarItem = UITabBarItem(title: "Latest listings", image: UIImage.init(named: "search"), tag: 0)
    }
    
    override func start() {
        let vc = LatestListingsViewController.loadFromNib()
        vc.coordinator = self
        
        navigationController.pushViewController(vc, animated: true)
        perentCoordinator?.MainTabBarViews.append(navigationController)
        
        getLatestListings()
    }
    
    func selectCell(name: String) {
        let vc = CardViewController.loadFromNib()
        vc.coordinator = self
        self.navigationController.pushViewController(vc, animated: true)
    }
    
    @objc func searchTap() {
        let vc = SearchViewController.loadFromNib()
        vc.coordinator = self
        self.navigationController.pushViewController(vc, animated: true)
    }
    
    @objc func cartTap() {
        let vc = CartViewController.loadFromNib()
        vc.coordinator = self
        self.navigationController.pushViewController(vc, animated: true)
    }
    
    func getLatestListings() {
        self.errorDelegat?.startActyvity()
        API_Request.shared.GetLatestListings().sink { error in
                // no-op        
        } receiveValue: { (Listings: LatestListingsModel) in
            self.errorDelegat?.stopActyvity()
            if let data = Listings.List, !data.isEmpty {
                DispatchQueue.main.async {
                    self.delegat?.update(data)
                }
            }
        }.store(in: &anyCancellables)
    }
    
    
    
}
