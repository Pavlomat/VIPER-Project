//
//  MainViewController.swift
//  VIPER Project
//
//  Created by Pavlov Matvey on 29.07.2022.
//

import UIKit

protocol MainViewProtocol: AnyObject {
}

class MainViewController: UIViewController, MainViewProtocol, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let mainToDetailSegueName = "MainToAboutSegue"
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var presenter: MainPresenterProtocol!
    var configurator: MainConfiguratorProtocol = MainConfigurator()
    
    var myTimer = [MyTimer]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(infoButtonClicked))

        configurator.configure(with: self)
        
        self.collectionView.register(CollectionViewCell.nib, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
      
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath as IndexPath) as! CollectionViewCell
        return cell
    }
    
    @objc func infoButtonClicked() {
        presenter.infoButtonClicked()
    }
    @IBAction func addTimerButtonClicked(_ sender: Any) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        presenter.router.prepare(for: segue, sender: sender)
    }
}
