//
//  ViewController.swift
//  SpaceX-iOS
//
//  Created by Антон on 03.08.2022.
//

import UIKit
import Combine
import SnapKit
//здесь работаем с вью

class MainViewController: UIViewController {
    
    let viewModel = MainViewModel()
    var currentRocketIndex = 0
    let containerView = UIView()
    let barView = MainBarView()
    let pageViewController = PageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationController()
        setupBarView()
        setupContainerView()
        
        pageViewController.delegate = self
        pageViewController.customDelegate = self
        
        setupData()
        viewModel.fetchRocketData()
        
    }
    
    private func setupData() {
        
        let queue = DispatchQueue.main
        
        viewModel.$rocketResponseElement
            .receive(on: queue)
            .sink { [weak self] value in
            guard let self = self, !value.isEmpty else {return} //проверяем что сам экран на который приходит запрос существует.
            self.pageViewController.rocketResponseElement = value
        }.store(in: &viewModel.cancellables)
        
        viewModel.$error.sink { [weak self] value in
            guard let _ = self, let value = value else {return}// проверяем что ошибка не нил. иначе по дефолту будет выводить ошибку т.к. в мейнвьюмодель еррор = нил
            
            print(value)
            
        }.store(in: &viewModel.cancellables)
    }
    
    //тут создаем пэйджвьюконтроллер
    func setupBarView() {
        
        view.addSubview(barView)
        
        barView.snp.makeConstraints { make in
            make.height.equalTo(72 + safeAreaBottomPadding)
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
    
    func setupContainerView() {
        
        view.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalTo(barView.snp.top)
        }
        
        add(pageViewController, toView: containerView)
    }
    
    private func setupNavigationController() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.tintColor = .white
    }
}

// внутренний делегат для передачи страниц
extension MainViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if let currentViewController = pageViewController.viewControllers![0] as? EmbedViewController {
            barView.selectedPage = currentViewController.index
            self.currentRocketIndex = currentViewController.index
        }
    }
}

// подсчет кол-ва страниц в пейдж
extension MainViewController: PageViewControllerDelegate {
    
    func setPagesIndicatorCount(_ count: Int) {
        barView.countPages = count
    }
    
    func settingsButtonTapped() {
        
        let vc = UINavigationController(rootViewController: SettingViewController())
        vc.modalPresentationStyle = .formSheet
        vc.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        present(vc, animated: true)
    }
    
    func startingsButtonTapped(with title: String) {
        guard let rocketId = self.viewModel.rocketResponseElement[self.currentRocketIndex].id else { return }
        let vc = StartingViewController(rocketId: rocketId, title: title)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}
