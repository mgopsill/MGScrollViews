import Combine
import UIKit

final class ExpandingViewViewController: UIViewController {
    private let scrollView = UIScrollView()
    private let expandingLabel = UILabel()
    private let pinnedLabel = UILabel()
    private lazy var heightConstraint = expandingLabel.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor)
    
    private var isScrollable: Bool = false {
        didSet {
            animate()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Scrollable View with Pinned Bottom"
        view.backgroundColor = .white
        
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        expandingLabel.translatesAutoresizingMaskIntoConstraints = false
        expandingLabel.backgroundColor = .systemMint
        expandingLabel.clipsToBounds = true
        expandingLabel.text = "Not Scrollable"
        expandingLabel.textAlignment = .center
        scrollView.addSubview(expandingLabel)
        
        expandingLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        expandingLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        expandingLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        expandingLabel.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        expandingLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        heightConstraint.isActive = true
        
        expandingLabel.isUserInteractionEnabled = true
        let tapRecogniser = UITapGestureRecognizer(target: self, action: #selector(didTap))
        expandingLabel.addGestureRecognizer(tapRecogniser)
        
        expandingLabel.addSubview(pinnedLabel)
        pinnedLabel.text = "Pinned Label"
        pinnedLabel.textAlignment = .center
        pinnedLabel.clipsToBounds = true
        pinnedLabel.backgroundColor = .systemGray6
        pinnedLabel.layer.cornerRadius = 20
        pinnedLabel.translatesAutoresizingMaskIntoConstraints = false
        pinnedLabel.bottomAnchor.constraint(equalTo: expandingLabel.bottomAnchor, constant: -40).isActive = true
        pinnedLabel.leadingAnchor.constraint(equalTo: expandingLabel.leadingAnchor, constant: 40).isActive = true
        pinnedLabel.trailingAnchor.constraint(equalTo: expandingLabel.trailingAnchor, constant: -40).isActive = true
        pinnedLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc func didTap() {
        isScrollable.toggle()
    }
    
    private func animate() {
        view.layoutIfNeeded()
        UIView.animate(withDuration: 0.5) { [self] in
            if isScrollable {
                heightConstraint.constant = 300
                expandingLabel.text = "Scrollable"
                view.layoutIfNeeded()
            } else {
                heightConstraint.constant = 0
                expandingLabel.text = "Not Scrollable"
                view.layoutIfNeeded()
            }
        }
    }
}
