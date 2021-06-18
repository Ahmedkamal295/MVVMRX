//
//  CellHome.swift
//  MVVMRX
//
//  Created by Ahmed kamal on 6/16/21.
//

import UIKit

class CellHome: UITableViewCell {

    // MARK:- outLet properties
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var nameProduct: UILabel!
    @IBOutlet weak var priceProduct: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
