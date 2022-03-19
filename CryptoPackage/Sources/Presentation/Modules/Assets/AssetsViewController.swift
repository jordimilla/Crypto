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
    
    let crypto = [CryptoCoin(symbol: "BTC"),
                  CryptoCoin(symbol: "ETH"),
                  CryptoCoin(symbol: "DOT")]
    
    let commodities = [CryptoCoin(symbol: "Commodities 1"),
                       CryptoCoin(symbol: "Commodities 2"),
                       CryptoCoin(symbol: "Commodities 3")]
    
    let fiat = [CryptoCoin(symbol: "Dolar"),
                       CryptoCoin(symbol: "Euro"),
                       CryptoCoin(symbol: "Rublo")]

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
    }
    
    @objc func loadCommodities() {
        cryptoButton.clear()
        fiatButton.clear()
    }
    
    @objc func loadFiat() {
        cryptoButton.clear()
        commoditieButton.clear()
    }
}

extension AssestsViewController: UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crypto.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CryptoCommoditiesCell.indentifier, for: indexPath) as? CryptoCommoditiesCell else {
            return UITableViewCell()
        }
        let data = crypto[indexPath.row]
        
        cell.bind(name: data.symbol)
        return cell 
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}

extension AssestsViewController: UITableViewDelegate {
    
}
