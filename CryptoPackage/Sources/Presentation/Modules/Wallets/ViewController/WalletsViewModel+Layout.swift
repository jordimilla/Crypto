import CryptoUIKit
import UIKit

extension WalletsViewController {
    
    func setupUI() {
        setupSubviews()
        setupConstraints()
        setupView()
        setupStackView()
        setupButtons()
        setupLabel()
        setupTableView()
    }
    
    private func setupSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(stackViewFilters)
        view.addSubview(tableView)
        stackViewFilters.addArrangedSubview(fiatWalletButton)
        stackViewFilters.addArrangedSubview(walletsButton)
        stackViewFilters.addArrangedSubview(commodityWalletsButton)
        
    }
    
    private func setupConstraints() {
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                     left: view.safeAreaLayoutGuide.leftAnchor,
                     right: view.safeAreaLayoutGuide.rightAnchor,
                     leftConstant: 24,
                     rightConstant: 24)
        
        stackViewFilters.anchor(top: titleLabel.bottomAnchor,
                                left: view.safeAreaLayoutGuide.leftAnchor,
                                right: view.safeAreaLayoutGuide.rightAnchor,
                                topConstant: 8,
                                leftConstant: 8,
                                rightConstant: 16)
        
        tableView.anchor(top: stackViewFilters.bottomAnchor,
                         left: view.safeAreaLayoutGuide.leftAnchor,
                         bottom: view.safeAreaLayoutGuide.bottomAnchor,
                         right: view.safeAreaLayoutGuide.rightAnchor)
    }
    
    private func setupView() {
        view.backgroundColor = Color.background.color
    }
    
    private func setupStackView() {
        stackViewFilters.backgroundColor = Color.background.color
        stackViewFilters.axis = .horizontal
        stackViewFilters.alignment = .fill
        stackViewFilters.distribution = .fillProportionally
        stackViewFilters.spacing = 8
    }
    
    private func setupButtons() {
        fiatWalletButton.setTitle(Constants.firstSection, for: .normal)
        fiatWalletButton.setTitleColor(Color.text.color, for: .normal)
        fiatWalletButton.addTarget(self, action: #selector(loadFiatWallets), for: .touchUpInside)
        
        walletsButton.setTitle(Constants.secondSection, for: .normal)
        walletsButton.setTitleColor(Color.text.color, for: .normal)
        walletsButton.addTarget(self, action: #selector(loadWallets), for: .touchUpInside)
        
        commodityWalletsButton.setTitle(Constants.thirdSection, for: .normal)
        commodityWalletsButton.setTitleColor(Color.text.color, for: .normal)
        commodityWalletsButton.addTarget(self, action: #selector(loadComodityWallets), for: .touchUpInside)
    }
    
    private func setupLabel() {
        titleLabel.text = Constants.title
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title1)
    }
    
    private func setupTableView() {
        tableView.backgroundColor = Color.background.color
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(WalletCell.self, forCellReuseIdentifier: WalletCell.indentifier)
    }
    
}
