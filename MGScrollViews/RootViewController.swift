import UIKit

final class RootViewController: UITableViewController {
    
    private enum Section { case main }
    private lazy var dataSource = makeDataSource(tableView: tableView)
        
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Scroll View Examples"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.reuseIdentifer)
        tableView.dataSource = dataSource
        applySnapshot()
    }
    
    func applySnapshot() {
        typealias Snapshot = NSDiffableDataSourceSnapshot<Section, ScrollViewExamples>
        var snapshot = Snapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(ScrollViewExamples.allCases, toSection: .main)
        dataSource.apply(snapshot)
    }
}

extension RootViewController {
    private func makeDataSource(tableView: UITableView) -> UITableViewDiffableDataSource<Section, ScrollViewExamples> {
        UITableViewDiffableDataSource(tableView: tableView, cellProvider: cellProvider)
    }
    
    private func cellProvider(tableView: UITableView, indexPath: IndexPath, model: ScrollViewExamples) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.reuseIdentifer, for: indexPath)
        cell.textLabel?.text = model.rawValue
        return cell
    }
}

extension RootViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let item = dataSource.itemIdentifier(for: indexPath) else { return }
        let viewController = item.viewController
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension UITableViewCell {
    static let reuseIdentifer = "UITableViewCell"
}
