//
//  API_Requests.swift
//  Trade Me
//
//  Created by Oleksii Aharkov on 10.11.2022.
//

import Foundation

struct GetLatestListingsBaseRequest: BaseRequest {
    
    var url: URL = API.server.getURLwithPath(path: "/listings/latest.json")
    var httpMethod: HTTPMethod = .GET
    var queryItems: [String : String]?
    var headers: [String : String]?
    
    typealias ReturnType = LatestListingsModel
    
    var httpBody: [String: Any]?

    init(_ auth_token:String) {
        self.headers = ["Authorization": "OAuth oauth_consumer_key=\"A1AC63F0332A131A78FAC304D007E7D1\",oauth_signature_method=\"PLAINTEXT\",oauth_timestamp=\"1668046229\",oauth_nonce=\"04hXTmJdnMx\",oauth_version=\"1.0\",oauth_signature=\"EC7F18B17A062962C6930A8AE88B16C7%26\""]
//        self.httpBody = ["user":["email": email,
//                         "password":passwd]]
        self.queryItems = ["rows":"20"]
    }
}
