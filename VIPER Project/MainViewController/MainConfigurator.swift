//
//  MainConfigurator.swift
//  VIPER Project
//
//  Created by Pavlov Matvey on 29.07.2022.
//

import Foundation

protocol MainConfiguratorProtocol: AnyObject {
    func configure(with viewController: MainViewController)
}

class MainConfigurator: MainConfiguratorProtocol {
    func configure(with viewController: MainViewController) {
        let presenter = MainPresenter(view: viewController)
        let interactor = MainInteractor(presenter: presenter)
        let router = MainRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
