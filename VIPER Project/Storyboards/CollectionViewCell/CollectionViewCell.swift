//
//  CollectionViewCell.swift
//  VIPER Project
//
//  Created by Pavlov Matvey on 29.07.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    static let identifier = "Cell"
    
    @IBOutlet weak var timeLabel: UILabel!
    static var nib: UINib {
           return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    @IBAction func deleteButtonClicked(_ sender: Any) {
    }
}
