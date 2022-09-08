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

class MainViewController: UIViewController, Alertable {
    
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
            guard let self = self, let value = value else {return}// проверяем что ошибка не нил. иначе по дефолту будет выводить ошибку т.к. в мейнвьюмодель еррор = нил
            self.showError(with: value)
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

