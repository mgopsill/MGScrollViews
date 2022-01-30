import UIKit

final class ContainerSubviewsScrollView: UIViewController {
    private let scrollView = UIScrollView()
    private let containerView = UIView()
    private let subview1 = UIView()
    private let subview2 = UIView()
    private let subview3 = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Container Subviews View"
        view.backgroundColor = .white
        
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        let colors: [UIColor] = [.systemRed, .systemMint, .systemBlue]
        let subviews = [subview1, subview2, subview3]

        for (index, subview) in subviews.enumerated() {
            containerView.addSubview(subview)
            subview.translatesAutoresizingMaskIntoConstraints = false
            subview.backgroundColor = colors[index]
        }

        let padding: CGFloat = 20

        scrollView.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: padding).isActive = true
        containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -padding * 2).isActive = true
        containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -padding).isActive = true
        containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true

        subview1.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        subview1.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        subview1.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        subview1.heightAnchor.constraint(equalToConstant: 500).isActive = true
        
        subview2.topAnchor.constraint(equalTo: subview1.bottomAnchor, constant: padding).isActive = true
        subview2.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        subview2.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        subview2.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        subview3.topAnchor.constraint(equalTo: subview2.bottomAnchor, constant: padding).isActive = true
        subview3.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        subview3.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        subview3.heightAnchor.constraint(equalToConstant: 400).isActive = true
        subview3.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true

        subview1.layer.cornerRadius = 20
        subview2.layer.cornerRadius = 20
        subview3.layer.cornerRadius = 20
    }
}
