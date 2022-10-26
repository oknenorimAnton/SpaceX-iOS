import UIKit
import SnapKit

class EmbedImageTableViewCell: UITableViewCell {
    
    static var identifier: String {
        String(describing: self)
    }
    
    private lazy var mainImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.layer.masksToBounds = true
        return iv
    }()
    
    private var roundedView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 25
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return view
    }()
    
    func setup(with image: UIImage) {
        mainImageView.image = image
    }
    
    func setupLayout() {
        addSubview(mainImageView)
        addSubview(roundedView)
        
        mainImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        roundedView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(50)
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
