import UIKit

extension UITraitEnvironment {
    // расчет safeArea
    //MARK: SafeArea
    
    private var window: UIWindow {
        return UIApplication.shared.windows[0]
    }
    
    private var safeFrame: CGRect {
        let safeFrame = window.safeAreaLayoutGuide.layoutFrame
        return safeFrame
    }
    
    var safeAreaTopPadding: CGFloat {
        //return UIApplication.shared.keyWindow?.safeAreaInsets.top ?? 0
        return safeFrame.minY
    }
    
    var safeAreaBottomPadding: CGFloat {
        //return UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
        return window.frame.maxY - safeFrame.maxY
    }
}
