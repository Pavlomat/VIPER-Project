//
//  MainPresenter.swift
//  VIPER Project
//
//  Created by Pavlov Matvey on 29.07.2022.
//

import Foundation

protocol MainPresenterProtocol: AnyObject {//отвечает за действия при нажатии на кнопки в VC
    var router: MainRouterProtocol! { set get }
//    func configureView()    //для инициализации и построения визуальных элементов в VC
//    func textFieldDidBeginEditing()
//    func inputValueChanged(to newInputValue: String)
//    func inputValueCleared()
//    func inputCurrencyButtonClicked()
    func infoButtonClicked()
//    func showAlertView(with text: String)
    
}


class MainPresenter: MainPresenterProtocol {

    weak var view: MainViewProtocol!
    var interactor: MainInteractorProtocol!
    var router: MainRouterProtocol!
    
    
    required init(view: MainViewProtocol) {
        self.view = view
    }
    
//    func configureView() {
//        view?.setInputValue(with: inputValue)
//        view?.setOutputValue(with: outputValue)
//        view?.setInputCurrencyShortName(with: inputCurrencyShortName)
//        view?.setOutputCurrencyShortName(with: outputCurrencyShortName)
//        view?.addDoneOnInputCurrencyKeyboard()
//        updateRateText()
//        interactor.getAllCurrencies()
//    }
    
//    func textFieldDidBeginEditing() {
//        view.hidePickerView()
//    }
//
//    func inputValueChanged(to newInputValue: String) {
//        updateOutputValue(with: newInputValue)
//    }
//
//    func inputValueCleared() {
//        updateOutputValue(with: "")
//    }
    
//    func inputCurrencyButtonClicked() {
//        view.hideKeyboard()
//        interactor.inputCurrencyChanging()
//        currencyPickerView?.title = inputCurrencyPickerViewTitle
//        currencyPickerView?.arrayCurrencyNames = interactor.getCurrencyNames()
//        currencyPickerView?.reload()
//        currencyPickerView?.selectedCurrencyIndex = interactor.inputCurrencyIndex
//        view.showPickerView()
//    }
    
    func infoButtonClicked() {
        router.showAboutScene()
    }
    
//    func showAlertView(with text: String) {
//        view.showAlertView(with: text)
//    }
    
//    func currencyPickerViewCancelButtonClicked() {
//        view.hidePickerView()
//    }
    
}
