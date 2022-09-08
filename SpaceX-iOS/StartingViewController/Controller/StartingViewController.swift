import UIKit
import SnapKit
import Combine

class StartingViewController: UIViewController, Alertable {
    
    let rocketId: String
    let customTitle: String
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
    
    var activityIndicator: UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView()
        ai.style = .large
        ai.startAnimating()
        ai.color = .gray
        return ai
    }()
    
    private func bindViewModel() {
        
        let queue = DispatchQueue.main
        viewModel.$launchData
            .receive(on: queue)
            .sink { [weak self] newValue in
                guard let self = self, !newValue.isEmpty else {return}
                self.launches = newValue.filter { $0.rocket.rawValue == self.rocketId }
                self.tableView.reloadData()
                self.activityIndicator.stopAnimating()
            }.store(in: &bag)
        
        viewModel.$error
            .receive(on: queue)
            .sink { [weak self] newValue in
                guard let self = self, let newValue = newValue else {return}
                self.activityIndicator.stopAnimating()
                self.showError(with: newValue)
            }.store(in: &bag)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupBackBarButton()
        bindViewModel()
        viewModel.fetchStartingData()
        title = customTitle
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.LabGrotesque().Bold(size: 20)!,
                                                                   NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    private func setupLayout() {
        
        view.addSubview(tableView)
        view.addSubview(activityIndicator)
        
        activityIndicator.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupBackBarButton() {
        let backButton = UIBarButtonItem()
        backButton.title = "Назад"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    init(rocketId: String, title: String) {
        self.rocketId = rocketId
        self.customTitle = title
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

