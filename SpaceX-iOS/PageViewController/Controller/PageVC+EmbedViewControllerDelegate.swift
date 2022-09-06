import UIKit

extension PageViewController: EmbedViewControllerDelegate {
    
    func settingsButtonTapped() {
        customDelegate?.settingsButtonTapped()
    }
    
    func startingsButtonTapped(with title: String) {
        customDelegate?.startingsButtonTapped(with: title)
    }
    
}
