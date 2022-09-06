//
//  ParameterCollectionViewCell.swift
//  SpaceX-iOS
//
//  Created by Антон on 20.08.2022.
//

import UIKit
import SnapKit

class ParameterCollectionViewCell: UICollectionViewCell {
    
    static var identifier: String {
        String(describing: self)
    }
    
    private lazy var parameterLabel: UILabel =  {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.LabGrotesque().Bold(size: 16)
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        return label
    }()
    
    private lazy var descriptionLabel: UILabel =  {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.LabGrotesque().Regular(size: 14)
        label.textColor = UIColor(red: 0.557, green: 0.557, blue: 0.561, alpha: 1)
        return label
    }()
    
    func setup(item: (String, String)) {
        parameterLabel.text = item.1
        descriptionLabel.text = item.0
    }
    
    
    func setupLayout() {
        
        addSubview(parameterLabel)
        addSubview(descriptionLabel)
        
        parameterLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(28)
            make.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(-8)
            make.height.equalTo(24)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(parameterLabel.snp.bottom).offset(1)
            make.left.equalToSuperview().offset(7)
            make.right.equalToSuperview().offset(-7)
            make.height.equalTo(20)
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        backgroundColor = UIColor(red: 0.129, green: 0.129, blue: 0.129, alpha: 1)
        layer.cornerRadius = 32
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
