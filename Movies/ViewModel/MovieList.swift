//
//  MovieList.swift
//  Movies
//
//  Created by Jefferson Naranjo rodríguez on 16/08/22.
//

import Foundation
import UIKit

class MovieList: UIViewController {
    
    lazy var tableView : UITableView = {
        
    
    let tableView = UITableView()
    tableView.delegate = self
    tableView.dataSource = self
    tableView.rowHeight = 80
    tableView.register(CustomCell.self, forCellReuseIdentifier: "\(CustomCell.self)")
    tableView.translatesAutoresizingMaskIntoConstraints = false
    return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureView()
    }
    
    private func configureView(){
        view.addSubview(tableView)
        var topPadding : CGFloat = 0.0
        if let topInset = UIApplication.shared.windows.first?.safeAreaInsets.top{
            topPadding = topInset
        }
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: topPadding),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}


extension MovieList : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // return MoviesModel.getList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(CustomCell.self)", for: <#T##IndexPath#>) as? CustomCell else {
            return UITableViewCell()
        }
        let user = MoviesModel.getVaList()[indexPath.row]
        cell.setData(user)
        return cell
    }
    
    
}
