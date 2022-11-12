//
//  LatestListingsModel.swift
//  Trade Me
//
//  Created by Oleksii Aharkov on 10.11.2022.
//

import Foundation

struct LatestListingsModel: Codable {
    let List:[ListModel]?

}

struct ListModel: Codable {
//    let BuyNowPrice: Int?
//    let HasBuyNow: Int?
    let PriceDisplay: String?
    let Region: String?
    let Title: String?
    let PictureHref: String?
    
    func getImageUrl() -> URL? {
        if let imageUrlString = PictureHref {
            if let imageUrl = URL(string: imageUrlString) {
                return imageUrl
            }
        }
        return nil
    }
}
