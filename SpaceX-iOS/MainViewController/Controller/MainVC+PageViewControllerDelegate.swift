import UIKit

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
