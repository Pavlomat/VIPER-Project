//
//  AboutInteractor.swift
//  VIPER Project
//
//  Created by Pavlov Matvey on 29.07.2022.
//

import Foundation

protocol AboutInteractorProtocol: AnyObject {
}

class AboutInteractor: AboutInteractorProtocol {
    
    weak var presenter: AboutPresenterProtocol!
    
    required init(presenter: AboutPresenterProtocol) {
        self.presenter = presenter
    }
}
