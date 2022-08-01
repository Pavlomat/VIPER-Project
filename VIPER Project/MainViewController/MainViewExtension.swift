//
//  MainViewExtension.swift
//  VIPER Project
//
//  Created by Pavlov Matvey on 30.07.2022.
//

import UIKit

extension MainViewController {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myTimer.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath as IndexPath) as! CollectionViewCell
        cell.delegate = self
        cell.timerName.text = myTimer[indexPath.row].name
        if myTimer[indexPath.row].min! > 9 {
            if myTimer[indexPath.row].sec! > 9 {
                cell.timerCount.text = "\(myTimer[indexPath.row].min!):\(myTimer[indexPath.row].sec!)"
            } else {
                cell.timerCount.text = "\(myTimer[indexPath.row].min!):0\(myTimer[indexPath.row].sec!)"
            }
        } else {
            if myTimer[indexPath.row].sec! > 9 {
                cell.timerCount.text = "0\(myTimer[indexPath.row].min!):\(myTimer[indexPath.row].sec!)"
            } else {
                cell.timerCount.text = "0\(myTimer[indexPath.row].min!):0\(myTimer[indexPath.row].sec!)"
            }
        }
        return cell
    }
    
    @objc func wholeNumberFilter(_ textField: UITextField) {
      if let text = textField.text,
        let number = Decimal(string: text.filter { $0.isWholeNumber }) {
          textField.text = "\(number)"
      } else {
        textField.text = ""
      }
    }
}

