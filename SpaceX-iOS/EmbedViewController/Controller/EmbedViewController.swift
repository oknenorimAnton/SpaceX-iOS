//
//  EmbedViewController.swift
//  SpaceX-iOS
//
//  Created by Антон on 05.08.2022.
//

import UIKit
import SnapKit

protocol EmbedViewControllerDelegate: AnyObject {
    func settingsButtonTapped()
    func startingsButtonTapped()
}

//создание встроенного контроллера 
class EmbedViewController: UIViewController {
    
    let index: Int
    let element: RocketResponseElement
    let image: UIImage
    weak var delegate: EmbedViewControllerDelegate?
    
    lazy var tableView: UITableView = {
        let tv = UITableView.init(frame: CGRect.zero, style: .plain)
        tv.separatorStyle = .none //разделитель выкл
        tv.register(EmbedImageTableViewCell.self, forCellReuseIdentifier: EmbedImageTableViewCell.identifier)
        tv.register(EmbedTitleWithDescriptionCell.self, forCellReuseIdentifier: EmbedTitleWithDescriptionCell.identifier)
        tv.register(EmbedHeaderCell.self, forCellReuseIdentifier: EmbedHeaderCell.identifier)
        tv.register(EmbedParameterTableViewCell.self, forCellReuseIdentifier: EmbedParameterTableViewCell.identifier)
        tv.register(EmbedSettingButtonCell.self, forCellReuseIdentifier: EmbedSettingButtonCell.identifier)
        tv.register(EmbedStartingButtonCell.self, forCellReuseIdentifier: EmbedStartingButtonCell.identifier)
        tv.delegate = self
        tv.dataSource = self
        tv.rowHeight = UITableView.automaticDimension //авторасчет размера ячейки
        tv.contentInsetAdjustmentBehavior = .never //убирает верхний отсуп тейбл вью
        tv.showsVerticalScrollIndicator = false
        tv.backgroundColor = .black
        return tv
    }()
    
    var dataSource = [Section]() {
        didSet{
            tableView.reloadData()
        }
    }
    
    enum Section {
        case settingButton(String)
        case parameterCell([(String, String)])
        case image(UIImage)
        case header(String)
        case titleWithDescription(String, String)
        case space(CGFloat)
        case startingButton(String)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupLayout()
        dataSource = createDataSource()
    }
    
    private func setupView() {
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
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
        
        sections.append(.settingButton(element.name!))
        
        sections.append(.space(32))
        
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
//        var mockDict: = ["date": "2018-12-04 10:02"]
//
//        //Convertation to Date
//
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
//        dateFormatter.timeZone = NSTimeZone(abbreviation: "UTC")! as TimeZone
//        let dataDate = dateFormatter.date(from: dict["date"] as! String)!
//
//        dateFormatter.dateFormat = "MMMM dd"
//        let newStringDate = dateFormatter.string(from: dataDate)
        
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
        
        sections.append(.startingButton("Просмотреть запуски"))
        return sections
    }
}
