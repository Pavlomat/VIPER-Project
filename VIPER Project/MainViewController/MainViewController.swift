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
}

class MainViewController: UIViewController, MainViewProtocol, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let mainToDetailSegueName = "MainToAboutSegue"
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var timerName: UITextField!
    @IBOutlet weak var timerCount: UITextField!
    
    var presenter: MainPresenterProtocol!
    var configurator: MainConfiguratorProtocol = MainConfigurator()
    
    var myTimer = [MyTimer]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(infoButtonClicked))
        
        configurator.configure(with: self)
        
        self.collectionView.register(CollectionViewCell.nib, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myTimer.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath as IndexPath) as! CollectionViewCell
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
    
    @objc func infoButtonClicked() {
        presenter.infoButtonClicked()
    }
    @IBAction func addTimerButtonClicked(_ sender: Any) {
        if !timerName.text!.isEmpty {
            if !timerCount.text!.isEmpty {
                if !timerCount.text!.contains(",") {
                    addTimer(name: timerName.text!, time: Int(timerCount.text!)!)
                    return
                }
            }
        }
        let ac = UIAlertController(title: "Ошибка", message: "Неправильно задан таймер", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .cancel))
        present(ac, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        presenter.router.prepare(for: segue, sender: sender)
    }
    
    //старт таймера с данными из текстовых полей и сортировка таймеров  порядке убывания
    func addTimer(name: String, time: Int) {
        myTimer.insert(MyTimer(name: name, time: time, view: self), at: 0)
        myTimer.first?.setTimer()
        myTimer.sort { $0.time > $1.time }
        collectionView.reloadData()
        timerName.text = ""
        timerCount.text = ""
        view.endEditing(true)
    }
    
    func deleteCell(){  //метод удаляет истекший таймер
        print("Deleted")
        myTimer.removeLast()
        collectionView.reloadData()
    }
    
    func updateView() { //метод обновляет каждую секунду таймеры и тейбл вью
        myTimer.sort { $0.time > $1.time }
        collectionView.reloadData()
    }
}
