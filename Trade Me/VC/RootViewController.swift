//
//  RootViewController.swift
//  Trade Me
//
//  Created by Oleksii Aharkov on 10.11.2022.
//

import UIKit
import Combine

class RootViewController: UIViewController, LoadProtocol {
    
    let loadVC = LoadViewController()
    
    
    func startActyvity() {

        // add the spinner view controller
        addChild(loadVC)
        loadVC.view.frame = view.frame
        view.addSubview(loadVC.view)
        loadVC.didMove(toParent: self)
    }
    
    func stopActyvity() {
        DispatchQueue.main.async {
            self.loadVC.willMove(toParent: nil)
            self.loadVC.view.removeFromSuperview()
            self.loadVC.removeFromParent()
        }
    }
    
    func error(_ error: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Error!", message: error, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func alertOK(_ message: String, handler: ((UIAlertAction) -> Void)? = nil) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Success!", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: handler))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    var anyCancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dismissKeyboard()
        
    }
    
    func setBackButton() {
        let yourBackImage = UIImage(named: "back")
        self.navigationController?.navigationBar.backIndicatorImage = yourBackImage
        self.navigationController?.navigationBar.tintColor = UIColor(named: "Tasman 500")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UIViewController {
    func dismissKeyboard() {
       let tap: UITapGestureRecognizer = UITapGestureRecognizer( target:     self, action:    #selector(UIViewController.dismissKeyboardTouchOutside))
       tap.cancelsTouchesInView = false
       view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboardTouchOutside() {
       view.endEditing(true)
    }
}

extension UIViewController {
    static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }

        return instantiateFromNib()
    }
}
