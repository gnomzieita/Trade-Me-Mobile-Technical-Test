//
//  BaseCoordenator.swift
//  Trade Me
//
//  Created by Oleksii Aharkov on 10.11.2022.
//

import Foundation
import UIKit

class BaseCoordenator:NSObject, Coordinator, UINavigationControllerDelegate {
   
    var errorDelegat: LoadProtocol?
    
    func start() {
    
    }
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

