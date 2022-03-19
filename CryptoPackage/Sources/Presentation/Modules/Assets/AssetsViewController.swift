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

    let collection = Collection(cryptoCoin: [CryptoCoin(symbol: "BTC"),
                                             CryptoCoin(symbol: "ETH"),
                                             CryptoCoin(symbol: "DOT")],
                                commodities: [CryptoCoin(symbol: "Commodities 1"),
                                              CryptoCoin(symbol: "Commodities 2"),
                                              CryptoCoin(symbol: "Commodities 3")],
                                fiats: [CryptoCoin(symbol: "Dolar"),
                                        CryptoCoin(symbol: "Euro"),
                                        CryptoCoin(symbol: "Rublo")])

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
        viewModel.requestCollection()

    }
    
    @objc func loadCrypto() {
        commoditieButton.clear()
        fiatButton.clear()
        currentData = .cryptoCoin
        tableView.reloadData()
    }
    
    @objc func loadCommodities() {
        cryptoButton.clear()
        fiatButton.clear()
        currentData = .commodities
        tableView.reloadData()
    }
    
    @objc func loadFiat() {
        cryptoButton.clear()
        commoditieButton.clear()
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
            return collection.cryptoCoin.count
        case .commodities:
            return collection.cryptoCoin.count
        case .fiats:
            return collection.cryptoCoin.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch currentData {
        case .cryptoCoin:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CryptoCommoditiesCell.indentifier, for: indexPath) as? CryptoCommoditiesCell else {
                return UITableViewCell()
            }
            let data = collection.cryptoCoin[indexPath.row]
            
            cell.bind(name: data.symbol)
            return cell
        case .commodities:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CryptoCommoditiesCell.indentifier, for: indexPath) as? CryptoCommoditiesCell else {
                return UITableViewCell()
            }
            let data =  collection.commodities[indexPath.row]
            
            cell.bind(name: data.symbol)
            return cell
        case .fiats:
            return UITableViewCell()
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
