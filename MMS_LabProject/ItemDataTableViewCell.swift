//
//  ItemDataTableViewCell.swift
//  MMS_LabProject
//
//  Created by prk on 10/20/23.
//

import UIKit

class ItemDataTableViewCell: UITableViewCell {
    var dataItemStart: dataItem?
    
    if dataItemStart != nil{
        itemImageCard.image = UIImage(named: dataItemStart!.imageProduct)
        itemPriceCard.text = "Rp \(dataItemStart!.priceProduct)"
        itemTitleCard.text = dataItemStart?.titleProduct
        itemDetailCard.text = dataItemStart?.description
        itemCategoryCard.text = "\(String(describing: dataItemStart?.categoryProduct))"
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
