//
//  CollectionViewCell.swift
//  VIPER Project
//
//  Created by Pavlov Matvey on 29.07.2022.
//

import UIKit

protocol CollectionViewCellProtocol {
}

protocol CollectionViewCellDelegate {
    func deleteTapped(_ cell: CollectionViewCell)
}

class CollectionViewCell: UICollectionViewCell, CollectionViewCellProtocol {
    
    static let identifier = "Cell"
    @IBOutlet weak var timerCount: UILabel!
    @IBOutlet weak var timerName: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    
    var delegate: CollectionViewCellDelegate?
    
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func deleteTapped(_ sender: Any) {
        delegate?.deleteTapped(self)
    }
}
