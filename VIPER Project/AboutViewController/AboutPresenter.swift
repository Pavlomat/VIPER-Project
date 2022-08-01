//
//  AboutPresenter.swift
//  VIPER Project
//
//  Created by Pavlov Matvey on 29.07.2022.
//

import Foundation

protocol AboutPresenterProtocol: AnyObject {
    var router: AboutRouterProtocol! { set get }
    func closeButtonClicked()
    func showGreetingsAlertClicked()
}

class AboutPresenter: AboutPresenterProtocol {
        
    weak var view: AboutViewProtocol!  
    var interactor: AboutInteractorProtocol!
    var router: AboutRouterProtocol!
    
    required init(view: AboutViewProtocol) {
        self.view = view
    }
    
    func showGreetingsAlertClicked() {
        view.showAlert()
    }
    
    func closeButtonClicked() {
        router.closeCurrentViewController()
    }
}
