//
//  MainViewController.swift
//  VIPER Project
//
//  Created by Pavlov Matvey on 29.07.2022.
//

import UIKit

protocol MainViewProtocol: AnyObject {
    func deleteCell()
    func updateView()
    func infoButtonClicked()
    func addTimer(name: String, time: Int)
    func deleteTapped(_ cell: CollectionViewCell)
}

class MainViewController: UIViewController, MainViewProtocol, UICollectionViewDelegate, UICollectionViewDataSource, CollectionViewCellDelegate, UITextFieldDelegate {
    
    let mainToDetailSegueName = "MainToAboutSegue"
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var timerName: UITextField!
    @IBOutlet weak var timerCount: UITextField!
    
    var presenter: MainPresenterProtocol!
    var configurator: MainConfiguratorProtocol = MainConfigurator()
    
    var myTimer = [MyTimer]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator.configure(with: self)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(infoButtonClicked))
        
        self.collectionView.register(CollectionViewCell.nib, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        timerCount.delegate = self
        
        timerCount.addTarget(self, action: #selector(wholeNumberFilter(_:)), for: .editingChanged)
    }
    
    @objc func infoButtonClicked() {
        presenter.infoButtonClicked()
    }
    
    @IBAction func addTimerButtonClicked(_ sender: Any) {
        if !timerName.text!.isEmpty && !timerCount.text!.isEmpty {
            presenter.addTimerButtonClicked(name: timerName.text!, time: Int(timerCount.text!)!)
                    return
        }
        let ac = UIAlertController(title: "Ошибка", message: "Неправильно задан таймер", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .cancel))
        present(ac, animated: true)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        presenter.router.prepare(for: segue, sender: sender)
//    }
    
    func addTimer(name: String, time: Int) {
        myTimer.insert(MyTimer(name: name, time: time, view: self), at: 0)
        myTimer.first?.setTimer()
        myTimer.sort { $0.time > $1.time }
        collectionView.reloadData()
        timerName.text = ""
        timerCount.text = ""
        view.endEditing(true)
    }
    
    func deleteTapped(_ cell: CollectionViewCell) {
        if let indexPath = collectionView.indexPath(for: cell) {
            myTimer.remove(at: indexPath.row)
        }
    }
     
    func deleteCell() {
        myTimer.removeLast()
        collectionView.reloadData()
    }
    
    func updateView() {
        myTimer.sort { $0.time > $1.time }
        collectionView.reloadData()
    }
}
