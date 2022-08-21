//
//  TableViewCell.swift
//  SpaceX-iOS
//
//  Created by Антон on 08.08.2022.
//

import UIKit
import SnapKit

class StartingTableViewCell: UITableViewCell {
    
    static var identifier: String {
        String(describing: self)
    }
    
    private lazy var viewCell: UIView = {
        let vc = UIView()
        vc.layer.cornerRadius = 24
        vc.backgroundColor = UIColor (red: 0.129, green: 0.129, blue: 0.129, alpha: 1)
        return vc
    }()
    
    private lazy var nameLabel: UILabel = {
        let nl = UILabel()
        nl.textColor = UIColor (red:1, green: 1, blue: 1, alpha: 1)
        nl.text = "FalconSat"
        return nl
    }()
    
    private lazy var dateLabel: UILabel = {
        let dl = UILabel()
        dl.textColor = UIColor (red: 0.557, green: 0.557, blue: 0.561, alpha: 1)
        dl.text = "2 февраля, 2022"
        return dl
    }()
    
    private lazy var imageStart: UIImageView = {
        let img = UIImageView()
        return img
    }()
    
    func setupLayout() {
        
        addSubview(viewCell)
        viewCell.addSubview(nameLabel)
        viewCell.addSubview(dateLabel)
        viewCell.addSubview(imageStart)
        imageStart.image = UIImage(named: "Yes")
        
        viewCell.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-8)
            make.left.equalToSuperview().offset(32)
            make.right.equalToSuperview().offset(-32)
            make.height.equalTo(100).priority(.medium)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-198)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(52)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-166)
        }
        
        imageStart.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(34)
            make.right.equalToSuperview().offset(-32)
            make.width.equalTo(32)
            make.height.equalTo(32)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
        backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

