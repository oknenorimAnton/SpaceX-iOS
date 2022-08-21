import UIKit
import SnapKit

class MainBarView: UIView {
    
    private lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.numberOfPages = countPages
        pc.currentPage = selectedPage
        return pc
    }()
    
    var countPages = 0 {
        didSet{
            pageControl.numberOfPages = countPages
        }
    }
    
    var selectedPage = 0 {
        didSet{
            pageControl.currentPage = selectedPage
        }
    }
    
    func setupView() {
        setupLayout()
        setupSubviews()
    }
    
    private func setupLayout() {
        addSubview(pageControl)
        
        pageControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(24)
        }
    }
    
    private func setupSubviews() {}
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("Unsupported initializer, please use init()")
    }
}

