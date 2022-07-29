//
//  MainRouter.swift
//  VIPER Project
//
//  Created by Pavlov Matvey on 29.07.2022.
//

import Foundation
import UIKit

protocol MainRouterProtocol: AnyObject {
    func showAboutScene()
    func prepare(for segue: UIStoryboardSegue, sender: Any?)
}

class MainRouter: MainRouterProtocol {
    
    weak var viewController: MainViewController!
    
    init(viewController: MainViewController) {
        self.viewController = viewController
    }
    
    func showAboutScene() {
        viewController.performSegue(withIdentifier: viewController.mainToDetailSegueName, sender: nil)
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // prepare here some data for destination viewController
    }
}
