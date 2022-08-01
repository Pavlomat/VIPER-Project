//
//  MainPresenter.swift
//  VIPER Project
//
//  Created by Pavlov Matvey on 29.07.2022.
//

import Foundation

protocol MainPresenterProtocol: AnyObject {//отвечает за действия при нажатии на кнопки в VC
    var router: MainRouterProtocol! { set get }
    
    func infoButtonClicked()
    func addTimerButtonClicked(name: String, time: Int)
}


class MainPresenter: MainPresenterProtocol {

    weak var view: MainViewProtocol!
    var interactor: MainInteractorProtocol!
    var router: MainRouterProtocol!
    
    
    required init(view: MainViewProtocol) {
        self.view = view
    }
    
    func infoButtonClicked() {
        router.showAboutScene()
    }
    
    func addTimerButtonClicked(name: String, time: Int) {
        view.addTimer(name: name, time: time)
    }
}
