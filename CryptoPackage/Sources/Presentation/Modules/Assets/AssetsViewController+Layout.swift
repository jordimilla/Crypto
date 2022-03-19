import CryptoUIKit
import UIKit

extension AssestsViewController {
    
    func setupUI() {
        setupSubviews()
        setupConstraints()
        setupView()
        setupLabel()
        setupTableView()
    }
    
    private func setupSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                     left: view.safeAreaLayoutGuide.leftAnchor,
                     right: view.safeAreaLayoutGuide.rightAnchor,
                     leftConstant: 24,
                     rightConstant: 24)
        
        tableView.anchor(top: titleLabel.bottomAnchor,
                         left: view.safeAreaLayoutGuide.leftAnchor,
                         bottom: view.safeAreaLayoutGuide.bottomAnchor,
                         right: view.safeAreaLayoutGuide.rightAnchor,
                         topConstant: 24)
    }
    
    private func setupView() {
        view.backgroundColor = .white
    }
    
    private func setupLabel() {
        titleLabel.text = "Assets"
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title1)
    }
    
    private func setupTableView() {
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(CryptoCommoditiesCell.self, forCellReuseIdentifier: CryptoCommoditiesCell.indentifier)
    }
    
}
