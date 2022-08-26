//
//  Presenter.swift
//  ViperPatternProject
//
//  Created by Tavi Danner Manrique Nestarez on 10/08/22.
//

import Foundation

// Object
// Protocol
// Ref to interactor, router, view

enum FetchError: Error {
    case failed
}

protocol HomePresenterProtocol {
    func didFetchHunters(with result: Result<Response, Error>)
}

class HomePresenter: BasePresenter, HomePresenterProtocol {
    var router: BaseRouter?
    var interactor: HomeInteractorProtocol? {
        didSet{
            interactor?.getHunters()
        }
    }
    var view: AnyView?
    
    func didFetchHunters(with result: Result<Response, Error>){
        switch result {
        case .success(let response):
            view?.update(with: response)
        case .failure:
            view?.update(with: "Something went wrong")
        }
    }
}
