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

    var collectionData: Collection?

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
        setupViewModel()
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
            guard let cryptoCoin = collectionData?.cryptoCoin else {
                return 0
            }
            return cryptoCoin.count
        case .commodities:
            guard let commodities = collectionData?.commodities else {
                return 0
            }
            return commodities.count
        case .fiats:
            guard let fiats = collectionData?.fiats else {
                return 0
            }
            return fiats.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch currentData {
        case .cryptoCoin:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CryptoCommoditiesCell.indentifier, for: indexPath) as? CryptoCommoditiesCell else {
                return UITableViewCell()
            }
            let data = collectionData?.cryptoCoin[indexPath.row]
            
            cell.bind(name: data?.name, icon: data?.icon, symbol: data?.symbol, price: data?.price)
            return cell
        case .commodities:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CryptoCommoditiesCell.indentifier, for: indexPath) as? CryptoCommoditiesCell else {
                return UITableViewCell()
            }
            let data =  collectionData?.commodities[indexPath.row]
            
            cell.bind(name: data?.name, icon: data?.icon, symbol: data?.symbol, price: data?.price)
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
            return 100
        }
    }
}

extension AssestsViewController: UITableViewDelegate {

}
