import UIKit

final class MultipleSubviewsViewController: UIViewController {
    private let scrollView = UIScrollView()
    private let subview1 = UIView()
    private let subview2 = UIView()
    private let subview3 = UIView()
    private let subview4 = UIView()
    private let subview5 = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Multiple Subviews"
        view.backgroundColor = .white
        
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        let colors: [UIColor] = [.systemCyan, .systemBlue, .systemRed, .systemMint, .systemTeal]
        let subviews = [subview1, subview2, subview3, subview4, subview5]

        for (index, subview) in subviews.enumerated() {
            scrollView.addSubview(subview)
            subview.translatesAutoresizingMaskIntoConstraints = false
            subview.backgroundColor = colors[index]
        }
    
        subview1.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        subview1.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        subview1.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        subview1.heightAnchor.constraint(equalToConstant: 200).isActive = true

        subview2.topAnchor.constraint(equalTo: subview1.bottomAnchor).isActive = true
        subview2.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        subview2.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor ).isActive = true
        subview2.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        subview3.topAnchor.constraint(equalTo: subview2.bottomAnchor).isActive = true
        subview3.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        subview3.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        subview3.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        subview4.topAnchor.constraint(equalTo: subview3.bottomAnchor).isActive = true
        subview4.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        subview4.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        subview4.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        subview5.topAnchor.constraint(equalTo: subview4.bottomAnchor).isActive = true
        subview5.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        subview5.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        subview5.heightAnchor.constraint(equalToConstant: 200).isActive = true
        subview5.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }
}
