
import UIKit

extension UIApplication {
    static var statusBarHeight: CGFloat {
        let window = UIApplication.shared.windows[0]
        let topPadding = window.safeAreaInsets.top
        return topPadding
    }
}
