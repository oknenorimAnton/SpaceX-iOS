//
//  EmbedViewController.swift
//  SpaceX-iOS
//
//  Created by Антон on 05.08.2022.
//

import UIKit
import SnapKit
//создание встроенного контроллера 
class EmbedViewController: UIViewController {
    
    let index: Int
    let element: RocketResponseElement
    let image: UIImage
    
    
    lazy var tableView: UITableView = {
        let tv = UITableView.init(frame: CGRect.zero, style: .plain)
        tv.separatorStyle = .none //разделитель выкл
        tv.register(EmbedImageTableViewCell.self, forCellReuseIdentifier: EmbedImageTableViewCell.identifier)
        tv.register(EmbedTitleWithDescriptionCell.self, forCellReuseIdentifier: EmbedTitleWithDescriptionCell.identifier)
        tv.register(EmbedHeaderCell.self, forCellReuseIdentifier: EmbedHeaderCell.identifier)
        tv.register(EmbedParameterTableViewCell.self, forCellReuseIdentifier: EmbedParameterTableViewCell.identifier)
        tv.delegate = self
        tv.dataSource = self
        tv.rowHeight = UITableView.automaticDimension //авторасчет размера ячейки
        tv.contentInsetAdjustmentBehavior = .never //убирает верхний отсуп тейбл вью
        //        tv.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 32))
        //        tv.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        tv.showsVerticalScrollIndicator = false
        return tv
    }()
    
    var dataSource = [Section]() {
        didSet{
            tableView.reloadData()
        }
    }
    
    enum Section {
        case parameterCell([(String, String)])
        case image(UIImage)
        case header(String)
        case titleWithDescription(String, String)
        case space(CGFloat)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupLayout()
        dataSource = createDataSource()
    }
    
    private func setupView() {
        view.backgroundColor = .black
    }
    
    private func setupLayout() {
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    
    init(index: Int, element: RocketResponseElement, image: UIImage) {
        self.index = index
        self.element = element
        self.image = image
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension EmbedViewController {
    
    func createDataSource() -> [Section] {
        var sections = [Section]()
        sections.append(.image(image))
        
        sections.append(.parameterCell([
            ("Высота, m", String(element.height!.meters!)),
            ("Диаметр, m", String(element.diameter!.meters!)),
            ("Масса, kg", String(element.mass!.kg!)),
            ("Нагрузка, kg", String(element.payloadWeights!.map({$0.kg!}).reduce(0, +))),
        ]))
        
        sections.append(.space(50))
        
        if let firstFlight = element.firstFlight {
            sections.append(.titleWithDescription("Первый запуск", firstFlight))
        }
        
        if let country = element.country {
            sections.append(.titleWithDescription("Страна", country))
        }
        
        if let costPerLaunch = element.costPerLaunch {
            sections.append(.titleWithDescription("Стоимость запуска", String(costPerLaunch)))
        }
        
        sections.append(.header("ПЕРВАЯ СТУПЕНЬ"))
        
        if let firstStageEngines = element.firstStage?.engines {
            sections.append(.titleWithDescription("Количество двигателей", String(firstStageEngines)))
        }
        
        if let firstStageFuelAmountTons = element.firstStage?.fuelAmountTons {
            sections.append(.titleWithDescription("Количество топлива", String(firstStageFuelAmountTons)))
        }
        
        if let firstStageBurnTimeSec = element.firstStage?.burnTimeSEC {
            sections.append(.titleWithDescription("Время сгорания", String(firstStageBurnTimeSec)))
        }
        
        sections.append(.header("ВТОРАЯ СТУПЕНЬ"))
        
        if let secondStageEngines = element.secondStage?.engines {
            sections.append(.titleWithDescription("Количество двигателей", String(secondStageEngines)))
        }
        
        if let secondStageFuelAmountTons = element.secondStage?.fuelAmountTons {
            sections.append(.titleWithDescription("Количество топлива", String(secondStageFuelAmountTons)))
        }
        
        if let firstStageFuelAmountTons = element.firstStage?.burnTimeSEC {
            sections.append(.titleWithDescription("Время сгорания", String(firstStageFuelAmountTons)))
        }
        return sections
    }
}

extension EmbedViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch dataSource[section] {
        case .image: return 1
        case .parameterCell: return 1
        case .header: return 1
        case .titleWithDescription: return 1
        case .space: return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = dataSource[indexPath.section]
        
        switch section {
        case .image(let i):
            let cell = tableView.dequeueReusableCell(withIdentifier: EmbedImageTableViewCell.identifier, for: indexPath) as! EmbedImageTableViewCell
            cell.setup(with: i)
            return cell
            
        case .parameterCell(let items):
            let cell = tableView.dequeueReusableCell(withIdentifier: EmbedParameterTableViewCell.identifier, for: indexPath) as! EmbedParameterTableViewCell
            cell.setup(items: items)
            return cell
        case .header(let title):
            let cell = tableView.dequeueReusableCell(withIdentifier: EmbedHeaderCell.identifier, for: indexPath) as! EmbedHeaderCell
            cell.setup(title: title)
            return cell
            
            
        case .titleWithDescription(let title, let description):
            let cell = tableView.dequeueReusableCell(withIdentifier: EmbedTitleWithDescriptionCell.identifier, for: indexPath) as! EmbedTitleWithDescriptionCell
            cell.setup(title: title, description: description)
            return cell
            
        case .space:
            let cell = UITableViewCell()
            cell.backgroundColor = .black
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let section = dataSource[indexPath.section]
        
        switch section {
        case .image: return 300
        case .parameterCell: return 96
        case .header: return UITableView.automaticDimension
        case .titleWithDescription: return UITableView.automaticDimension
        case .space(let space): return space
        }
    }
}

