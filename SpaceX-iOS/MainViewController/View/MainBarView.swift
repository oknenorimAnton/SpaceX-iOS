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
    
   private func setupView() {
        backgroundColor = UIColor(red: 0.071, green: 0.071, blue: 0.071, alpha: 1)
        setupLayout()
    }
    
    private func setupLayout() {
        addSubview(pageControl)
        pageControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(24)
        }
    }
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("Unsupported initializer, please use init()")
    }
}

