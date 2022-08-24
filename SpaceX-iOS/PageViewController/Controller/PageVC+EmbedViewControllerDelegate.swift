import UIKit

extension PageViewController: EmbedViewControllerDelegate {
    func startingsButtonTapped() {
        customDelegate?.startingsButtonTapped()
    }
    
    
    func settingsButtonTapped() {
        customDelegate?.settingsButtonTapped()
    }
    
    
}
