//
//  EmbedStartingButtonViewCellTableViewCell.swift
//  SpaceX-iOS
//
//  Created by Антон on 21.08.2022.
//

import UIKit
import SnapKit

class EmbedStartingButtonViewCell: UITableViewCell {
    
    static var identifier: String {
        String(describing: self)
    }
    private var staringButton: UIButton = {
        let button = UIButton()
        //utton.setTitle("Просмотреть запуски", for: .normal)
        button.setTitleColor(.white, for: .normal)
        //button.backgroundColor = UIColor(red: 0.129, green: 0.129, blue: 0.129, alpha: 1)
        button.backgroundColor = .red
        return button
    }()
    
    func setup(title: String) {
        staringButton.setTitle(title, for: .normal)
    }
    
    func setupLayout() {
        
        addSubview(staringButton)
        
        staringButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.left.equalToSuperview().offset(32)
            make.right.equalToSuperview().offset(-32)
            make.bottom.equalToSuperview().offset(-8)
            make.height.equalTo(32).priority(.medium)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
        
    }
}
