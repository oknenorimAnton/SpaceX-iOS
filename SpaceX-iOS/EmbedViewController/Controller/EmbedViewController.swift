import UIKit
import SnapKit

protocol EmbedViewControllerDelegate: AnyObject {
    func settingsButtonTapped()
    func startingsButtonTapped(with title: String)
}

class EmbedViewController: UIViewController {
    
    let index: Int
    let element: RocketResponseElement
    let image: UIImage
    weak var delegate: EmbedViewControllerDelegate?
    
    private lazy var tableView: UITableView = {
        let tv = UITableView.init(frame: CGRect.zero, style: .plain)
        tv.separatorStyle = .none
        tv.register(EmbedImageTableViewCell.self, forCellReuseIdentifier: EmbedImageTableViewCell.identifier)
        tv.register(EmbedTitleWithDescriptionCell.self, forCellReuseIdentifier: EmbedTitleWithDescriptionCell.identifier)
        tv.register(EmbedHeaderCell.self, forCellReuseIdentifier: EmbedHeaderCell.identifier)
        tv.register(EmbedParameterTableViewCell.self, forCellReuseIdentifier: EmbedParameterTableViewCell.identifier)
        tv.register(EmbedSettingButtonCell.self, forCellReuseIdentifier: EmbedSettingButtonCell.identifier)
        tv.register(EmbedStartingButtonCell.self, forCellReuseIdentifier: EmbedStartingButtonCell.identifier)
        tv.delegate = self
        tv.dataSource = self
        tv.rowHeight = UITableView.automaticDimension
        tv.contentInsetAdjustmentBehavior = .never
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
        setupNotifications()
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
    
    private func setupNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(update), name: Notification.Name("update"), object: nil)
    }
    
    @objc func update() {
        dataSource = createDataSource()
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
        let setting = AppSettings.shared
        var sections = [Section]()
        sections.append(.image(image))
        sections.append(.settingButton(element.name!))
        sections.append(.space(32))
        
        var height: (String, Double) {
            switch setting.height {
            case .m: return ("m", element.height!.meters!)
            case .ft:  return ("ft", element.height!.feet!)
            }
        }
        
        var diameter: (String, Double) {
            switch setting.diameter {
            case .m: return ("m", (element.diameter!.meters!))
            case .ft: return ("ft", (element.diameter!.feet!))
            }
        }
        
        var mass: (String, Int) {
            switch setting.mass {
            case .kg: return ("kg", (element.mass!.kg!))
            case .lb: return ("lb", (element.mass!.lb!))
            }
        }
        
        var payload: (String, Int) {
            switch setting.payload {
            case .kg: return ("kg", (element.payloadWeights!.map({$0.kg!}).reduce(0, +)))
            case .lb: return ("lb", (element.payloadWeights!.map({$0.lb!}).reduce(0, +)))
            }
        }
        
        sections.append(.parameterCell([
            ("Высота, \(height.0)", String(height.1)),
            ("Диаметр, \(diameter.0)", String(diameter.1)),
            ("Масса, \(mass.0)", String(mass.1)),
            ("Нагрузка, \(payload.0)", String(payload.1))
        ]))
        
        sections.append(.space(50))
        
        if let firstFlight = element.firstFlight {
            sections.append(.titleWithDescription("Первый запуск", firstFlight.convertDateFormat()))
        }
        
        if let country = element.country {
            sections.append(.titleWithDescription("Страна", country))
        }
        
        if let costPerLaunch = element.costPerLaunch {
            sections.append(.titleWithDescription("Стоимость запуска", "\(String(costPerLaunch))$"))
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
