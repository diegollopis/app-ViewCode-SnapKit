//
//  HomeScreenViewController.swift
//  appViewCodeSnapKit
//
//  Created by Diego Llopis on 05/11/21.
//

import UIKit

class HomeScreenViewController: UIViewController {
    
    var homeScreen: HomeScreen?
    
    let data: [DataUser] = [
        DataUser(name: "Diego", nameImage: "person.fill"),
        DataUser(name: "Margarete", nameImage: "person.fill"),
        DataUser(name: "Enzo", nameImage: "person.fill"),
        DataUser(name: "Michelle", nameImage: "person.fill"),
    ]
    
    override func loadView() {
        homeScreen = HomeScreen()
        self.view = homeScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeScreen?.configTableViewDelegate(delegate: self, dataSource: self)
    }
}

extension HomeScreenViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell: UserDetailTableViewCell? = tableView.dequeueReusableCell(withIdentifier: UserDetailTableViewCell.identifier, for: indexPath) as? UserDetailTableViewCell
        cell?.configCell(data: self.data[indexPath.row])
        return cell ?? UITableViewCell()
       
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
