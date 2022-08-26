//
//  Router.swift
//  ViperPatternProject
//
//  Created by Tavi Danner Manrique Nestarez on 10/08/22.
//

import Foundation
import UIKit

// Object
// Entry point
typealias EntryPoint = AnyView & UIViewController

class HomeRouter: BaseRouter {
    var entry: EntryPoint?
    
    static func start() -> BaseRouter {
        let router = HomeRouter()
        //ASSIGN VIP
        var view: AnyView = UserViewController()
        var presenter: HomePresenter = HomePresenter()
        var interactor: HomeInteractorProtocol = HomeInteractor()
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
        
        router.entry = view as? EntryPoint
        
        return router
    }
}
