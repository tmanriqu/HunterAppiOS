//
//  Base.swift
//  ViperPatternProject
//
//  Created by Tavi Danner Manrique Nestarez on 23/08/22.
//

import Foundation

protocol BasePresenter {
    var router: BaseRouter? { get set }
    var interactor: HomeInteractorProtocol? { get set }
    var view: AnyView? { get set }
}
