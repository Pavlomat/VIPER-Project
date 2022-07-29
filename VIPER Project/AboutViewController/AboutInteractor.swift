//
//  AboutInteractor.swift
//  VIPER Project
//
//  Created by Pavlov Matvey on 29.07.2022.
//

import Foundation

protocol AboutInteractorProtocol: AnyObject {   //логика хранения и извлечения данных
}

class AboutInteractor: AboutInteractorProtocol {
    
    weak var presenter: AboutPresenterProtocol! //Обязательно WEAK чобы не было утечек (VC - Strong и далее Presenter, Interactor и тд уже weak) Во всей цепочке главный - VC
    
    required init(presenter: AboutPresenterProtocol) {
        self.presenter = presenter
    }
}
