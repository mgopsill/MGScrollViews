import UIKit

final class ContainerStackViewScrollView: UIViewController {
    private let scrollView = UIScrollView()
    private let containerStackView = UIStackView()
    private let subview1 = UIView()
    private let subview2 = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Container Stack View"
        view.backgroundColor = .white
        
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        let colors: [UIColor] = [.systemYellow, .systemBlue]
        let subviews = [subview1, subview2]

        for (index, subview) in subviews.enumerated() {
            subview.translatesAutoresizingMaskIntoConstraints = false
            subview.backgroundColor = colors[index]
        }
        
        scrollView.addSubview(containerStackView)
        containerStackView.axis = .vertical
        containerStackView.spacing = 10
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        containerStackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        containerStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        containerStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        containerStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        containerStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
        containerStackView.addArrangedSubview(subview1)
        containerStackView.addArrangedSubview(subview2)
        
        subview1.heightAnchor.constraint(equalToConstant: 550).isActive = true
        subview2.heightAnchor.constraint(equalToConstant: 550).isActive = true
        subview1.layer.cornerRadius = 20
        subview2.layer.cornerRadius = 20
    }
}
