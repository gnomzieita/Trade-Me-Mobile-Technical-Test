//
//  API.swift
//  Trade Me
//
//  Created by Oleksii Aharkov on 10.11.2022.
//

import Foundation

struct API {
    
    /// If `true` we will get dev environment, if `false` - prod.
    /// Automatically switches between `dev` when building on simulator/device
    /// and `prod` when running TF (and AppStore in future) version
    static var inDebug: Bool {
    #if DEBUG
        return true
    #else
        return false
    #endif
    }
    
    struct Server{
        let baseURL: String
        let port: Int?
        
        func getURL() -> URL?{
            if let port = port {
                return URL(string: "\(baseURL):\(port)")
            } else {
                return URL(string: baseURL)
            }
        }
        
        func getURLwithPath(path: String) -> URL{
            if let port = port {
                return URL(string: "\(baseURL):\(port)\(path)")!
            } else {
                return URL(string: baseURL+path)!
            }
        }
    }
    
    static let server = Server(baseURL: inDebug ? "https://api.tmsandbox.co.nz/v1" : "https://api.trademe.co.nz/v1", port: nil)
}


