import UIKit

protocol Alertable where Self: UIViewController {
    func showError(with text: String)
}

extension Alertable {
    
    func showError(with text: String) {
        let alert = UIAlertController(title: "Error", message: text, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
