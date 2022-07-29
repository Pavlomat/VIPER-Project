//
//  AboutViewController.swift
//  VIPER Project
//
//  Created by Pavlov Matvey on 29.07.2022.
//

import UIKit

protocol AboutViewProtocol: AnyObject {
    func showAlert()
}

class AboutViewController: UIViewController, AboutViewProtocol {

    var presenter: AboutPresenterProtocol!
    let configurator:AboutConfiguratorProtocol = AboutConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configurator.configure(with: self)

    }

    @IBAction func showGreetings(_ sender: Any) {
        presenter.showGreetingsAlertClicked()
    }
    
    func showAlert() {
        let ac = UIAlertController(title: "Greetings", message: nil, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .cancel))
        present(ac, animated: true)
    }
}
