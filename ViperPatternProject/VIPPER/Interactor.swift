//
//  Interactor.swift
//  ViperPatternProject
//
//  Created by Tavi Danner Manrique Nestarez on 10/08/22.
//

import Foundation

// Object
// Protocol
// Ref to Presenter

protocol HomeInteractorProtocol {
    var presenter: HomePresenter? { get set }
    func getHunters()
}

class HomeInteractor: HomeInteractorProtocol {
    var presenter: HomePresenter?
    func getHunters() {
        print("Interactor Get Hunters")
        guard let url = URL(string: "http://hunterxhunter-server.herokuapp.com/hunterxhunter/hunters") else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            DispatchQueue.main.async {
                guard let data = data, error == nil else {
                    self?.presenter?.didFetchHunters(with: .failure(FetchError.failed))
                    return
                }
                do {
                    let response = try JSONDecoder().decode(Response.self, from: data)
                    self?.presenter?.didFetchHunters(with: .success(response))
                } catch {
                    self?.presenter?.didFetchHunters(with: .failure(error))
                }
            }
        }
        task.resume()
    }
}
