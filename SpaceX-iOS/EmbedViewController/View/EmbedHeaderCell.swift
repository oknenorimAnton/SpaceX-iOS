import UIKit
import SnapKit

class EmbedHeaderCell: UITableViewCell {
    
    static var identifier: String {
        String(describing: self)
    }
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = .white
        label.font = UIFont.LabGrotesque().Bold(size: 16)
        return label
    }()
    
    func setup(title: String) {
        headerLabel.text = title
    }
    
    func setupLayout() {
        addSubview(headerLabel)
        
        headerLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(32)
            make.left.equalToSuperview().offset(32)
            make.right.equalToSuperview().offset(-32)
            make.bottom.equalToSuperview().offset(-8)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
        selectionStyle = .none
        backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
