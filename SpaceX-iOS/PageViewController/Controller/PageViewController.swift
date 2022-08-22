//
//  PageViewController.swift
//  SpaceX-iOS
//
//  Created by Антон on 05.08.2022.
//

import UIKit

protocol PageViewControllerDelegate: AnyObject {
    func setPagesIndicatorCount(_ count: Int) // передали кол-во страниц
    func settingsButtonTapped()
}


class PageViewController: UIPageViewController {
    
    
    var rocketResponseElement: [RocketResponseElement]? {
        didSet{
            setViewControllers([vcs[0]], direction: .forward, animated: false, completion: nil)
            customDelegate?.setPagesIndicatorCount(vcs.count)
            dataSource = self
            activityIndicator.stopAnimating()
        }
    }
    
    lazy var vcs: [EmbedViewController] =  {
        var result: [EmbedViewController] = []
        guard let rocketResponseElement = rocketResponseElement else {return []}
        
        for (i,v) in rocketResponseElement.enumerated() {
            let vc = EmbedViewController(index: i, element: v, image: images[i])
            vc.delegate = self
            result.append(vc)
        }
        return result
    }()
    
    var activityIndicator: UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView()
        ai.style = .large
        ai.startAnimating()
        return ai
    }()
    
    weak var customDelegate: PageViewControllerDelegate?
    
    let  images: [UIImage] =  [
        UIImage(named: "SpaceX1")!,
        UIImage(named: "SpaceX2")!,
        UIImage(named: "SpaceX3")!,
        UIImage(named: "SpaceX4")!,
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupLayout()
    }
    
    private func setupView() {
        view.backgroundColor = .black
    }
    
    private func setupLayout() {
        view.addSubview(activityIndicator)
        
        activityIndicator.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    // кастомная инициализация (можно нагуглить) для плавного перелистывания
    init(transitionStyle: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation) {
        super.init(transitionStyle: transitionStyle, navigationOrientation: navigationOrientation, options: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// обязательные функции расширения PageViewController
extension PageViewController: UIPageViewControllerDataSource {
    //контроллер до загрузки
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = vcs.firstIndex(of: viewController as! EmbedViewController) else { return nil }
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else { return nil}
        guard vcs.count > previousIndex else { return nil }
        return vcs[previousIndex]
    }
    // контроллер после загрузки
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = vcs.firstIndex(of: viewController as! EmbedViewController) else { return nil }
        let nextIndex = viewControllerIndex + 1
        guard nextIndex < vcs.count else { return nil }
        guard vcs.count > nextIndex else { return nil }
        return vcs[nextIndex]
    }
}
