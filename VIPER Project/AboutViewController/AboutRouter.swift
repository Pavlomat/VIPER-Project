//
//  AboutRouter.swift
//  VIPER Project
//
//  Created by Pavlov Matvey on 29.07.2022.
//

import Foundation
import UIKit

protocol AboutRouterProtocol: AnyObject {   //Presenter решает что при нажатии на кнопку закрыть нужно перейти между экранами поэтому обработка переходов передается в Router
    func closeCurrentViewController()   //Умеет только закрывать текущий VC
}

class AboutRouter: AboutRouterProtocol {
    
    weak var viewController: AboutViewController!
    
    init(viewController: AboutViewController) {
        self.viewController = viewController
    }
    
    func closeCurrentViewController() {
        viewController.dismiss(animated: true)
    }
}
