import UIKit
// создание внутреннего контроллера (дочернего) для создания pageViewController
extension UIViewController {
    
    func add(_ child: UIViewController, toView: UIView) {
        addChild(child)
        child.view.frame = toView.bounds//bounds  как фрейм только с системой отсчета относсительно себя(x,y = 0), а не отностительно супревью
        toView.addSubview(child.view)
        child.didMove(toParent: self)
    }
}
