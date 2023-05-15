import UIKit

class MainView: UIView {

    private let tableView = UITableView(frame: .zero, style: .plain)
    private var items = [String]()

    init() {
        super.init(frame: .zero)
        self.setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainView {

    func updateView(items: [String]) {
        DispatchQueue.main.async {
            self.items = items
            self.tableView.reloadData()
        }
    }
}

private extension MainView {

    func setupViews() {
        self.configureSubviews()
        self.configureSubviewsConstraints()
    }

    func configureSubviews() {
        addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellItem")
        tableView.dataSource = self
    }

    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension MainView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellItem")!
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
}
