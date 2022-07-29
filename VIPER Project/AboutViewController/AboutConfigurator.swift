//
//  AboutConfigurator.swift
//  VIPER Project
//
//  Created by Pavlov Matvey on 29.07.2022.
//

import Foundation

protocol AboutConfiguratorProtocol: AnyObject {
    func configure(with viewController: AboutViewController)
}

class AboutConfigurator: AboutConfiguratorProtocol {
    func configure(with viewController: AboutViewController) {  //здесь будет конфигурироваться модуль
        let presenter = AboutPresenter(view: viewController)
               let interactor = AboutInteractor(presenter: presenter)
               let router = AboutRouter(viewController: viewController)
               
               viewController.presenter = presenter
               presenter.interactor = interactor
               presenter.router = router
    }
}
