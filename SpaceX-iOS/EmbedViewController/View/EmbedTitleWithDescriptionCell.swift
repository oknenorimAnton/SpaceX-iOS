
import UIKit
import SnapKit

class EmbedTitleWithDescriptionCell: UITableViewCell {
    
    static var identifier: String {
        String(describing: self)
    }
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.LabGrotesque().Regular(size: 16)
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.numberOfLines = 0
        label.font = UIFont.LabGrotesque().Regular(size: 16)
        return label
    }()
    
    func setup(title: String, description: String) {
        nameLabel.text = title
        descriptionLabel.text = description
        nameLabel.textColor = UIColor(red: 0.792, green: 0.792, blue: 0.792, alpha: 1)
        descriptionLabel.textColor = .white
    }
    
    func setupLayout() {
        
        addSubview(nameLabel)
        addSubview(descriptionLabel)
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.left.equalToSuperview().offset(32)
            make.bottom.equalToSuperview().offset(-8)
            make.width.equalTo(200)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(-32)
            make.bottom.equalToSuperview().offset(-8)
            make.width.equalTo(150)
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
