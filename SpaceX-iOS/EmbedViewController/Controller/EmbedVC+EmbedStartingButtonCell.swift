import UIKit

extension EmbedViewController: EmbedStartingButtonCellDelegate {
    func startingsButtonTapped() {
        delegate?.startingsButtonTapped(with: element.name ?? "")
    }
}
