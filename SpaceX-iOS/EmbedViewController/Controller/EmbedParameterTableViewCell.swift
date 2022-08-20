//
//  EmbedParameterTableViewCell.swift
//  SpaceX-iOS
//
//  Created by Антон on 20.08.2022.
//

import UIKit
import SnapKit

class EmbedParameterTableViewCell: UITableViewCell {
    
    
    static var identifier: String {
        String(describing: self)
    }
    
    func setup() {}
    
    func setupLayout() {}
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
