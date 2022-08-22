import UIKit

extension EmbedViewController: EmbedSettingButtonCellDelegate {
    
    func settingsButtonTapped() {
        delegate?.settingsButtonTapped()
    }
    
    
}
