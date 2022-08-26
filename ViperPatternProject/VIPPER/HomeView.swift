//
//  HomeView.swift
//  ViperPatternProject
//
//  Created by Tavi Danner Manrique Nestarez on 23/08/22.
//

import UIKit

class HomeView: UIView {
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.isHidden = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .red
        return tableView
    }()
    
    init() {
        super.init(frame: UIScreen.main.bounds)
        initViews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        initViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initViews() {
        addSubview(tableView)
        setupConstraint()
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate(
            [
                tableView.topAnchor.constraint(equalTo: self.topAnchor),
                tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ]
        )
    }
}
