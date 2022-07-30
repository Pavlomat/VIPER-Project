//
//  MainInteractor.swift
//  VIPER Project
//
//  Created by Pavlov Matvey on 29.07.2022.
//

import Foundation

protocol MainInteractorProtocol: AnyObject {    //логика хранения и извлечения данных
}

class MainInteractor: MainInteractorProtocol {
    
    weak var presenter: MainPresenterProtocol!  //Обязательно WEAK чтобы избежать утечек памяти
    
    required init(presenter: MainPresenterProtocol) {
        self.presenter = presenter
    }
    
}
