import UIKit

enum ScrollViewExamples: String, CaseIterable {
    case multipleSubviews = "Multiple Subviews"
    case containerStackView = "Container StackView"
    case containerSubviews = "Container Subviews"
    case pinnedBottomScrollView = "Pinned Bottom View"
    
    var viewController: UIViewController {
        switch self {
        case .multipleSubviews:
            return MultipleSubviewsViewController()
        case .containerStackView:   
            return ContainerStackViewScrollView()
        case .containerSubviews:
            return ContainerSubviewsScrollView()
        case .pinnedBottomScrollView:
            return ExpandingViewViewController()
        }
    }
}
