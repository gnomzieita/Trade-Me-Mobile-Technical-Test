//
//  AsyncImageView.swift
//  Trade Me
//
//  Created by Oleksii Aharkov on 13.11.2022.
//

import UIKit
import Combine

class AsyncImageView: UIImageView {

    var anyCancellables = Set<AnyCancellable>()
    
    func setImage(url:URL) {
        API_Request.shared.getImage(imageUrl: url).sink { error in
                // no-op
            print(error)
        
        } receiveValue: { image in
            DispatchQueue.main.async {
                self.image = image
            }
        }.store(in: &anyCancellables)
    }
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
