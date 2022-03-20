import CryptoUIKit
import UIKit

extension AssestsViewController {
    
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
        stackViewFilters.addArrangedSubview(cryptoButton)
        stackViewFilters.addArrangedSubview(commoditieButton)
        stackViewFilters.addArrangedSubview(fiatButton)
        
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
        cryptoButton.setTitle(Constants.firstSection, for: .normal)
        cryptoButton.setTitleColor(Color.text.color, for: .normal)
        cryptoButton.addTarget(self, action: #selector(loadCrypto), for: .touchUpInside)
        
        commoditieButton.setTitle(Constants.secondSection, for: .normal)
        commoditieButton.setTitleColor(Color.text.color, for: .normal)
        commoditieButton.addTarget(self, action: #selector(loadCommodities), for: .touchUpInside)
        
        fiatButton.setTitle(Constants.thirdSection, for: .normal)
        fiatButton.setTitleColor(Color.text.color, for: .normal)
        fiatButton.addTarget(self, action: #selector(loadFiat), for: .touchUpInside)
    }
    
    private func setupLabel() {
        titleLabel.text = Constants.title
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title1)
    }
    
    private func setupTableView() {
        tableView.backgroundColor = Color.background.color
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(AssetsCell.self, forCellReuseIdentifier: AssetsCell.indentifier)
        tableView.isUserInteractionEnabled = false
    }
    
}
