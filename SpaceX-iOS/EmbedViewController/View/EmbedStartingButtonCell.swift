import UIKit
import SnapKit

protocol EmbedStartingButtonCellDelegate: AnyObject {
    func startingsButtonTapped()
}

class EmbedStartingButtonCell: UITableViewCell {
    
    static var identifier: String {
        String(describing: self)
    }
    private var staringButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.LabGrotesque().Bold(size: 16)
        button.backgroundColor = UIColor(red: 0.129, green: 0.129, blue: 0.129, alpha: 1)
        button.layer.cornerRadius = 10
        return button
    }()
    
    weak var delegate: EmbedStartingButtonCellDelegate?
    
    func setup(title: String) {
        staringButton.setTitle(title, for: .normal)
    }
    
    func setupLayout() {
        addSubview(staringButton)
        staringButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(32)
            make.right.equalToSuperview().offset(-32)
            make.bottom.equalToSuperview().offset(-30)
            make.height.equalTo(50).priority(.medium)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.isUserInteractionEnabled = true
        setupLayout()
        selectionStyle = .none
        staringButton.addTarget(self, action: #selector(startingButtonTapped), for: .touchUpInside)
    }
    
    @objc func startingButtonTapped(sender: UIButton) {
        delegate?.startingsButtonTapped()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
