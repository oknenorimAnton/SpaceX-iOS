import UIKit
import SnapKit

class EmbedParameterTableViewCell: UITableViewCell {
    
    static var identifier: String {
        String(describing: self)
    }
    
    private lazy var parameterCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 12
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ParameterCollectionViewCell.self, forCellWithReuseIdentifier:ParameterCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 32, bottom: 0, right: 0)
        collectionView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private var items: [(String, String)] = [] {
        didSet{
            parameterCollectionView.reloadData()
        }
    }
    
    func setup(items: [(String, String)]) {
        self.items = items
    }
    
    func setupLayout() {
        contentView.addSubview(parameterCollectionView)
        parameterCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
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

extension EmbedParameterTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ParameterCollectionViewCell.identifier, for: indexPath) as! ParameterCollectionViewCell
        let item = items[indexPath.row]
        cell.setup(item: item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 96, height: 96)
    }
}
