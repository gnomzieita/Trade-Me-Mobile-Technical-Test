//
//  Coordinator.swift
//  Trade Me
//
//  Created by Oleksii Aharkov on 10.11.2022.
//

import Foundation
import UIKit

protocol LoadProtocol {
    func error(_ error:String)
    func startActyvity()
    func stopActyvity()
    func alertOK(_ message: String, handler: ((UIAlertAction) -> Void)?)
    
}

protocol Coordinator:AnyObject {
    
    var childCoordinators: [Coordinator] {get set}
    var navigationController: UINavigationController {get set}
    
    func start()
}
