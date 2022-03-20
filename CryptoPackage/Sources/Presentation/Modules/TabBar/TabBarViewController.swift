import UIKit
import Domain
import CryptoUIKit

class TabBarViewController: UIViewController {
    
    static let assetsIndex = 0
    
    let tabBar = TabBar()
    var viewModel: TabBarViewModel
    var currentIndex = TabBarViewController.assetsIndex
    
    public init(viewModel: TabBarViewModel) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupViewModel()
        viewModel.requestCollection()
    }
    
    func setupView() {
        view.backgroundColor = Color.background.color
    }
    
    func setupTabBarController(data: Collection) {
        let assets = tabBar.createNavController(for: viewModel.assetsProvider(viewModel.navigationController, data),
                                                title: Constants.assetsTitle,
                                                image: UIImage(systemName: Constants.iconAssets),
                                                selectedImage: UIImage(systemName: Constants.iconAssets),
                                                identifier: Constants.tabAssetsIdentifier)
        
        let wallets = tabBar.createNavController(for: viewModel.walletsProvider(viewModel.navigationController, data),
                                                 title: Constants.walletsTitle,
                                                 image: UIImage(systemName: Constants.iconWallets),
                                                 selectedImage: UIImage(systemName: Constants.iconWallets),
                                                 identifier: Constants.tabWalletIdentifier)
        
        
        tabBar.viewControllers = [assets, wallets]
        view.addSubview(tabBar.view)
        tabBar.delegate = self
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return self.currentIndex == TabBarViewController.assetsIndex ? .lightContent : .darkContent
    }
}

extension TabBarViewController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard let index = tabBar.viewControllers?.firstIndex(of: viewController) else {
            return
        }
        currentIndex = index
        setNeedsStatusBarAppearanceUpdate()
    }
}

extension TabBarViewController {
    struct Constants {
        static let assetsTitle: String = "Assets"
        static let walletsTitle: String = "Wallets"
        
        static let iconAssets: String = "bookmark"
        static let iconWallets: String = "folder"
        
        static let tabAssetsIdentifier: String = "tabBarAsset"
        static let tabWalletIdentifier: String = "tabBarWallet"
    }
}
