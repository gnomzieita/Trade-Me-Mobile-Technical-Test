//
//  ListingsTableViewCell.swift
//  Trade Me
//
//  Created by Oleksii Aharkov on 10.11.2022.
//

import UIKit

class ListingsTableViewCell: UITableViewCell {

    @IBOutlet weak var myImage: AsyncImageView!
    @IBOutlet weak var regionName: DesignableLabel!

    @IBOutlet weak var listTitle: DesignableLabel!
    @IBOutlet weak var reservLabel: DesignableLabel!
    
    @IBOutlet weak var listPrice: DesignableLabel!
    @IBOutlet weak var buyNowPrice: DesignableLabel!
    
    @IBOutlet weak var buyNowText: DesignableLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupInfo(data:ListModel) {
        if let imageUrl = data.getImageUrl() {
            self.myImage.setImage(url: imageUrl)
        } else {
            self.myImage.image = UIImage(named: "TradeMe_Logo")
        }
        listTitle.text = data.Title ?? ""
        regionName.text = data.Region ?? ""
        listPrice.text = data.PriceDisplay ?? ""
    }
    
}
