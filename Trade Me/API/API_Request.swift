//
//  API_Request.swift
//  Trade Me
//
//  Created by Oleksii Aharkov on 10.11.2022.
//

import Foundation
import Combine
import UIKit

class API_Request: CombineNetworkService {
    
    static let shared = API_Request()
    private var _auth_token: String = ""
    var auth_token: String {
        get{
            return self._auth_token
        }
        set {
            self._auth_token = newValue
            UserDefaults.standard.set(newValue, forKey: "auth_token")
        }
        
    }

    private override init() {
        if let token = UserDefaults.standard.object(forKey: "auth_token") as? String {
            _auth_token = token
        }
        //TODO: Save auth_token to UserDefault
    }
    
    func GetLatestListings<T: Decodable>() -> AnyPublisher<T, NetworkServiceError> {
        return self.getPublisherForResponse(request: GetLatestListingsBaseRequest(auth_token).request())
    }
    
    func getImage(imageUrl:URL) -> AnyPublisher<UIImage, NetworkServiceError> {
        return self.getImageForResponse(url: imageUrl)
    }
    
}

