//
//  CollectionViewCell.swift
//  VIPER Project
//
//  Created by Pavlov Matvey on 29.07.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let identifier = "Cell"
    @IBOutlet weak var timerCount: UILabel!
    @IBOutlet weak var timerName: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
