import UIKit

extension MainViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if let currentViewController = pageViewController.viewControllers![0] as? EmbedViewController {
            barView.selectedPage = currentViewController.index
            self.currentRocketIndex = currentViewController.index
        }
    }
}

