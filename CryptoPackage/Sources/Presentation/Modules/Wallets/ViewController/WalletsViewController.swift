import UIKit
import CryptoUIKit
import Domain

class WalletsViewController: UIViewController {
    
    // MARK: - Views
    let titleLabel = UILabel()
    let defaultLabel = UILabel()
    let stackViewFilters = UIStackView()
    let fiatWalletButton = RoundedRectButton()
    let walletsButton = RoundedRectButton()
    let commodityWalletsButton = RoundedRectButton()
    let tableView = UITableView()
    
    var viewModel: WalletsViewModel
    
    enum TypeData {
        case fiatWallets
        case wallets
        case commodityWallets
    }
    
    var currentData: TypeData = .wallets
    var fiatFiltered: [Fiat]?

    public init(viewModel: WalletsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadWallets()
    }
    
    @objc func loadWallets() {
        walletsButton.activateButton(state: true)
        fiatWalletButton.activateButton(state: false)
        commodityWalletsButton.activateButton(state: false)
        currentData = .wallets
        setEmpty(state: !viewModel.data.wallets.isEmpty)
        tableView.reloadData()
    }
    
    @objc func loadFiatWallets() {
        walletsButton.activateButton(state: false)
        commodityWalletsButton.activateButton(state: false)
        currentData = .fiatWallets
        setEmpty(state: !viewModel.data.fiatWallets.isEmpty)
        tableView.reloadData()
    }
    
    @objc func loadComodityWallets() {
        fiatWalletButton.activateButton(state: false)
        walletsButton.activateButton(state: false)
        currentData = .commodityWallets
        setEmpty(state: !viewModel.data.commodityWallets.isEmpty)
        tableView.reloadData()
    }
    
    func filterFiatByHasWallet() {
        fiatFiltered = viewModel.data.fiats.filter() {
            let hasWallet = $0.hasWallets == true
            return hasWallet
        }
    }
}

extension WalletsViewController: UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch currentData {
        case .fiatWallets:
            return viewModel.data.fiatWallets.count
        case .wallets:
            return viewModel.data.wallets.count
        case .commodityWallets:
            return viewModel.data.commodityWallets.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WalletCell.indentifier, for: indexPath) as? WalletCell else {
            return UITableViewCell()
        }
        
        switch currentData {
        case .fiatWallets:
            let data = viewModel.data.fiatWallets[indexPath.row]
            cell.bind(name: data.name, symbol: data.symbol, balance: data.balance, defaultWallet: data.defaultWallet)
            return cell
        case .wallets:
            let data = viewModel.data.wallets[indexPath.row]
            cell.bind(name: data.name, symbol: data.symbol, balance: data.balance, defaultWallet: data.defaultWallet)
            return cell
        case .commodityWallets:
            let data = viewModel.data.commodityWallets[indexPath.row]
            cell.bind(name: data.name, symbol: data.symbol, balance: data.balance, defaultWallet: data.defaultWallet)
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension WalletsViewController: UITableViewDelegate {

}
