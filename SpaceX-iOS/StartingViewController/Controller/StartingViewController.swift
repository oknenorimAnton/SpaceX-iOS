import UIKit
import SnapKit
import Combine

class StartingViewController: UIViewController {
    
    let rocketId: String
    var launches: [LaunchData] = []
    let viewModel = StartingViewModel()
    var bag = Set<AnyCancellable>()
    
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
    
    private func bindViewModel() {
        
        let queue = DispatchQueue.main
        viewModel.$launchData
            .receive(on: queue)
            .sink { [weak self] newValue in
                guard let self = self, !newValue.isEmpty else {return}
                self.launches = newValue.filter { $0.rocket.rawValue == self.rocketId }
                self.tableView.reloadData()
            }.store(in: &bag)
    }
    
//    var dataSource = [Section]() {
//        didSet {
//            tableView.reloadData()
//        }
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        bindViewModel()
        viewModel.fetchStartingData()
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    init(rocketId: String) {
        self.rocketId = rocketId
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



