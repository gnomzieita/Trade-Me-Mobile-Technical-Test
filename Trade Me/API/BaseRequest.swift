//
//  BaseRequest.swift
//  Trade Me
//
//  Created by Oleksii Aharkov on 10.11.2022.
//

import Foundation

public enum HTTPMethod: String {
    case GET, POST, PUT, PATCH, DELETE
}

public protocol BaseRequest {

    var url: URL { get }
    var queryItems: [String: String]? { get }
    var headers: [String: String]? { get }
    var httpMethod: HTTPMethod { get }
    var httpBody: [String: Any]? { get }
    
    associatedtype ReturnType: Decodable
}

extension BaseRequest {
    
    func request() -> URLRequest {
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            return URLRequest(url: (url))
        }
        
        var qItems: [URLQueryItem] = []
        if let tQueryItems = queryItems  {
            for item in tQueryItems {
                qItems.append(URLQueryItem(name: item.key, value: item.value))
            }
        }
        urlComponents.queryItems = qItems
        
        var request = URLRequest(url: (urlComponents.url)!,timeoutInterval: Double.infinity)
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        if let tHeaders = headers {
            for header in tHeaders {
                request.addValue(header.value, forHTTPHeaderField: header.key)
            }
        }

        request.httpMethod = httpMethod.rawValue
        if let httpBody = httpBody {
            let jsonData = try! JSONSerialization.data(withJSONObject: httpBody, options: [])
            request.httpBody = jsonData
        }
        return request
    }
    
}

extension Encodable {
  var dictionary: [String: Any]? {
    guard let data = try? JSONEncoder().encode(self) else { return nil }
    return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
  }
}

extension String {
    func Bearer() -> [String:String] {
        return ["Authorization":"Bearer \(self)"]
    }
}
