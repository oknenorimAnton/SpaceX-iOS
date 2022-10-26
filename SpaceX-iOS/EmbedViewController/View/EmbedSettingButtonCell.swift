import UIKit
import SnapKit

protocol EmbedSettingButtonCellDelegate: AnyObject {
    func settingsButtonTapped()
}

class EmbedSettingButtonCell: UITableViewCell {
    
    static var identifier: String {
        String(describing: self)
    }
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.LabGrotesque().Bold(size: 24)
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        return label
    }()
    
    private var settingButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Setting"), for: .normal)
        return button
    }()
    
    func setup(title: String) {
        nameLabel.text = title
    }
    
    weak var delegate: EmbedSettingButtonCellDelegate?
    
    func setupLayout() {
        addSubview(nameLabel)
        addSubview(settingButton)
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(32)
            make.width.equalTo(200)
        }
        
        settingButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.right.equalToSuperview().offset(-32)
            make.bottom.equalToSuperview()
            make.width.equalTo(32)
            make.height.equalTo(32)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.isUserInteractionEnabled = true
        setupLayout()
        selectionStyle = .none
        backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        settingButton.addTarget(self, action: #selector(settingButtonTapped), for: .touchUpInside)
    }
    
    @objc func settingButtonTapped(sender: UIButton) {
        delegate?.settingsButtonTapped()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
