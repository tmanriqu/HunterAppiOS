//
//  View.swift
//  ViperPatternProject
//
//  Created by Tavi Danner Manrique Nestarez on 10/08/22.
//

import Foundation
import UIKit

// ViewController
// Protocol
// Reference Presenter

protocol AnyView {
    var presenter: BasePresenter? { get set }
    
    func update(with response: Response)
    func update(with error: String)
}

class UserViewController: UIViewController, AnyView, UITableViewDelegate, UITableViewDataSource {
    var presenter: BasePresenter?
    var response: Response = Response()
    private var homeView: HomeView? {
        view as? HomeView
    }
    
    override func loadView() {
        view = HomeView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        homeView?.tableView.delegate = self
        homeView?.tableView.dataSource = self
    }
    
    func update(with response: Response) {
        print("Get Hunters")
        DispatchQueue.main.async {
            self.response = response
            self.homeView?.tableView.reloadData()
        }
    }
    
    func update(with error: String) {
        print(error)
    }
    
    // TABLE
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return response.hunters.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = response.hunters[indexPath.row].name
        return cell
    }
}
