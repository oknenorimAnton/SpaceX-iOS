import UIKit

extension PageViewController: EmbedViewControllerDelegate {
    
    func settingsButtonTapped() {
        customDelegate?.settingsButtonTapped()
    }
    
    
}
