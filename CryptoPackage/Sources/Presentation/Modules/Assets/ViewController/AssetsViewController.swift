import UIKit
import CryptoUIKit
import Domain

class AssestsViewController: UIViewController {
    
    // MARK: - Views
    let titleLabel = UILabel()
    let stackViewFilters = UIStackView()
    let cryptoButton = RoundedRectButton()
    let commoditieButton = RoundedRectButton()
    let fiatButton = RoundedRectButton()
    let tableView = UITableView()
    
    var viewModel: AssetsViewModel
    
    enum TypeData {
        case cryptoCoin
        case commodities
        case fiats
    }
    
    var currentData: TypeData = .cryptoCoin
    var fiatFiltered: [Fiat]?

    public init(viewModel: AssetsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadCrypto()
    }
    
    @objc func loadCrypto() {
        cryptoButton.activateButton(state: true)
        commoditieButton.activateButton(state: false)
        fiatButton.activateButton(state: false)
        currentData = .cryptoCoin
        tableView.reloadData()
    }
    
    @objc func loadCommodities() {
        cryptoButton.activateButton(state: false)
        fiatButton.activateButton(state: false)
        currentData = .commodities
        tableView.reloadData()
    }
    
    @objc func loadFiat() {
        cryptoButton.activateButton(state: false)
        commoditieButton.activateButton(state: false)
        currentData = .fiats
        tableView.reloadData()
    }
    
}

extension AssestsViewController: UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch currentData {
        case .cryptoCoin:
            return viewModel.data.cryptoCoin.count
        case .commodities:
            return viewModel.data.commodities.count
        case .fiats:
            return viewModel.data.fiats.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AssetsCell.indentifier, for: indexPath) as? AssetsCell else {
            return UITableViewCell()
        }
        
        switch currentData {
        case .cryptoCoin:
            let data = viewModel.data.cryptoCoin[indexPath.row]
            cell.bind(name: data.name, icon: data.icon, symbol: data.symbol, price: data.price)
            return cell
        case .commodities:
            let data = viewModel.data.commodities[indexPath.row]
            cell.bind(name: data.name, icon: data.icon, symbol: data.symbol, price: data.price)
            return cell
        case .fiats:
            let data = viewModel.data.fiats[indexPath.row]
            cell.bind(name: data.name, icon: data.icon, symbol: data.symbol, hasWallet: data.hasWallets)
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch currentData {
        case .cryptoCoin:
            return 100
        case .commodities:
            return 100
        case .fiats:
            return 75
        }
    }
}

extension AssestsViewController: UITableViewDelegate {

}
