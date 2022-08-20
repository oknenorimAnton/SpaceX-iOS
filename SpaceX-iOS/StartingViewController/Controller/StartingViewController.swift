//
//  StartingViewController.swift
//  SpaceX-iOS
//
//  Created by Антон on 08.08.2022.
//

import UIKit
import SnapKit

class StartingViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tv = UITableView.init(frame: CGRect.zero, style: .plain)
        tv.separatorStyle = .none //разделитель выкл
        tv.register(StartingTableViewCell.self, forCellReuseIdentifier: StartingTableViewCell.identifier)
        tv.delegate = self
        tv.dataSource = self
        tv.rowHeight = UITableView.automaticDimension //авторасчет размера ячейки
        tv.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 32))
        tv.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        return tv
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension StartingViewController: UITableViewDataSource, UITableViewDelegate {
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StartingTableViewCell.identifier, for: indexPath) as! StartingTableViewCell
        return cell
    }
}
