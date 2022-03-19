import UIKit
import CryptoUIKit
import Domain

class WalletsViewController: UIViewController {
    
    // MARK: - Views
    let titleLabel = UILabel()
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
    
    var currentData: TypeData = .fiatWallets

    var collectionData: Collection?
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
        setupViewModel()
        viewModel.requestCollection()
    }
    
    @objc func loadFiatWallets() {
        walletsButton.activateButton(state: false)
        commodityWalletsButton.activateButton(state: false)
        currentData = .fiatWallets
        tableView.reloadData()
    }
    
    @objc func loadWallets() {
        fiatWalletButton.activateButton(state: false)
        commodityWalletsButton.activateButton(state: false)
        currentData = .wallets
        tableView.reloadData()
    }
    
    @objc func loadComodityWallets() {
        fiatWalletButton.activateButton(state: false)
        walletsButton.activateButton(state: false)
        currentData = .commodityWallets
        tableView.reloadData()
    }
    
    func filterFiatByHasWallet() {
        fiatFiltered = collectionData?.fiats.filter() {
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
            guard let fiatWallets = collectionData?.fiatWallets else {
                return 0
            }
            return fiatWallets.count
        case .wallets:
            guard let wallets = collectionData?.wallets else {
                return 0
            }
            return wallets.count
        case .commodityWallets:
            guard let commodityWallets = collectionData?.commodityWallets else {
                return 0
            }
            return commodityWallets.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WalletCell.indentifier, for: indexPath) as? WalletCell else {
            return UITableViewCell()
        }
        
        switch currentData {
        case .fiatWallets:
            let data = collectionData?.fiatWallets[indexPath.row]
            cell.bind(name: data?.name, symbol: data?.symbol, balance: data?.balance, defaultWallet: data?.defaultWallet, deleted: data?.deleted)
            return cell
        case .wallets:
            let data =  collectionData?.wallets[indexPath.row]
            cell.bind(name: data?.name, symbol: data?.symbol, balance: data?.balance, defaultWallet: data?.defaultWallet, deleted: data?.deleted)
            return cell
        case .commodityWallets:
            let data =  collectionData?.commodityWallets[indexPath.row]
            cell.bind(name: data?.name, symbol: data?.symbol, balance: data?.balance, defaultWallet: data?.defaultWallet, deleted: data?.deleted)
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension WalletsViewController: UITableViewDelegate {

}
