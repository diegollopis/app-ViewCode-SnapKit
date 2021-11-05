//
//  HomeScreen.swift
//  appViewCodeSnapKit
//
//  Created by Diego Llopis on 05/11/21.
//

import UIKit

class HomeScreen: UIView, ViewCodeProtocol {
    
    lazy var table: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .white
        table.register(UserDetailTableViewCell.self, forCellReuseIdentifier: UserDetailTableViewCell.identifier)
        return table
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configView()
        self.configConstraints()
        self.setBackgroundColor()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setBackgroundColor() {
        self.backgroundColor = UIColor(red: 24/255, green: 117/255, blue: 104/255, alpha: 1.0)
    }
    
    func configTableViewDelegate(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        self.table.delegate = delegate
        self.table.dataSource = dataSource
    }
    
    func configView() {
        self.addSubview(self.table)
    }
    
    func configConstraints() {
        
        NSLayoutConstraint.activate([
            self.table.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.table.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor),
            self.table.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor),
            self.table.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
