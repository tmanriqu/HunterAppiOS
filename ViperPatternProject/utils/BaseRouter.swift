//
//  BaseRouter.swift
//  ViperPatternProject
//
//  Created by Tavi Danner Manrique Nestarez on 23/08/22.
//

import Foundation

protocol BaseRouter {
    var entry: EntryPoint? { get }
    static func start() -> BaseRouter
}
