//
//  ViewController.swift
//  SpaceX-iOS
//
//  Created by Антон on 25.08.2022.
//

import UIKit
import SnapKit

class SettingViewController: UIViewController {
    
    private lazy var heightLabel: UILabel = {
        let label = UILabel()
        label.text = "Высота"
        label.font = UIFont.LabGrotesque().Regular(size: 16)
        label.textColor = .white
        return label
    }()
    
    private lazy var diameterLabel: UILabel = {
        let label = UILabel()
        label.text = "Диаметр"
        label.font = UIFont.LabGrotesque().Regular(size: 16)
        label.textColor = .white
        return label
    }()
    
    private lazy var massLabel: UILabel = {
        let label = UILabel()
        label.text = "Масса"
        label.font = UIFont.LabGrotesque().Regular(size: 16)
        label.textColor = .white
        return label
    }()
    
    private lazy var payloadLabel: UILabel = {
        let label = UILabel()
        label.text = "Полезная нагрузка"
        label.font = UIFont.LabGrotesque().Regular(size: 16)
        label.textColor = .white
        return label
    }()
    
    private lazy var heightSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["m", "ft"])
        segmentedControl.selectedSegmentTintColor = .white
        segmentedControl.backgroundColor = UIColor(red: 0.129, green: 0.129, blue: 0.129, alpha: 1)
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()
    
    private lazy var diameterSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["m", "ft"])
        segmentedControl.selectedSegmentTintColor = .white
        segmentedControl.backgroundColor = UIColor(red: 0.129, green: 0.129, blue: 0.129, alpha: 1)
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()
    
    private lazy var massSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["kg", "lb"])
        segmentedControl.selectedSegmentTintColor = .white
        segmentedControl.backgroundColor = UIColor(red: 0.129, green: 0.129, blue: 0.129, alpha: 1)
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()
    
    private lazy var payloadSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["kg", "lb"])
        segmentedControl.selectedSegmentTintColor = .white
        segmentedControl.backgroundColor = UIColor(red: 0.129, green: 0.129, blue: 0.129, alpha: 1)
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()
    
    private lazy var closeBarButtonItem: UIBarButtonItem = {
        let bb = UIBarButtonItem(title: "Закрыть", style: .plain, target: self, action: #selector(closeBarButtonTapped))
        bb.tintColor = .white
        return bb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Настройки"
        
        view.backgroundColor = UIColor(red: 0.071, green: 0.071, blue: 0.071, alpha: 1)
        navigationItem.rightBarButtonItem = closeBarButtonItem
        
        setupLayout()
    }
    
    private func setupLayout() {
        
        view.addSubview(heightLabel)
        view.addSubview(diameterLabel)
        view.addSubview(massLabel)
        view.addSubview(payloadLabel)
        view.addSubview(heightSegmentedControl)
        view.addSubview(diameterSegmentedControl)
        view.addSubview(massSegmentedControl)
        view.addSubview(payloadSegmentedControl)
        
        heightLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(120)
            make.left.equalToSuperview().offset(28)
            make.height.equalTo(24)
            make.width.equalTo(176)
        }
        
        heightSegmentedControl.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(112)
            make.right.equalToSuperview().offset(-28)
            make.height.equalTo(40)
            make.width.equalTo(115)
        }
        
        diameterLabel.snp.makeConstraints { make in
            make.top.equalTo(heightLabel.snp.bottom).offset(40)
            make.left.equalToSuperview().offset(28)
            make.height.equalTo(24)
            make.width.equalTo(176)
        }
        
        diameterSegmentedControl.snp.makeConstraints { make in
            make.top.equalTo(heightSegmentedControl.snp.bottom).offset(24)
            make.right.equalToSuperview().offset(-28)
            make.height.equalTo(40)
            make.width.equalTo(115)
        }
        
        massLabel.snp.makeConstraints { make in
            make.top.equalTo(diameterLabel.snp.bottom).offset(40)
            make.left.equalToSuperview().offset(28)
            make.height.equalTo(24)
            make.width.equalTo(176)
        }
        
        massSegmentedControl.snp.makeConstraints { make in
            make.top.equalTo(diameterSegmentedControl.snp.bottom).offset(24)
            make.right.equalToSuperview().offset(-28)
            make.height.equalTo(40)
            make.width.equalTo(115)
        }
        
        payloadLabel.snp.makeConstraints { make in
            make.top.equalTo(massLabel.snp.bottom).offset(40)
            make.left.equalToSuperview().offset(28)
            make.height.equalTo(24)
            make.width.equalTo(176)
        }
        
        payloadSegmentedControl.snp.makeConstraints { make in
            make.top.equalTo(massSegmentedControl.snp.bottom).offset(24)
            make.right.equalToSuperview().offset(-28)
            make.height.equalTo(40)
            make.width.equalTo(115)
        }
    }
    
    @objc private func closeBarButtonTapped() {
        dismiss(animated: true)
    }
}
