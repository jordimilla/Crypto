import Foundation
import UIKit.UINavigationController

public class TabBarAssembly {
    
    private let navigationController: UINavigationController
    private let assetsProvider: FeatureProvider
    private let walletsProvider: FeatureProvider
    private let selectedIndex: Int
    
    public init(navigationController: UINavigationController,
                assetsProvider: @escaping FeatureProvider,
                walletsProvider: @escaping FeatureProvider,
                selectedIndex: Int) {
        self.navigationController = navigationController
        self.assetsProvider = assetsProvider
        self.walletsProvider = walletsProvider
        self.selectedIndex = selectedIndex
    }
    
    public func build() -> UIViewController {
        TabBarViewController(
            viewModel: makeViewModel()
        )
    }
}

extension TabBarAssembly {
    
    private func makeViewModel() -> TabBarViewModel {
        TabBarViewModel(
            navigationController: navigationController,
            assetsProvider: assetsProvider,
            walletsProvider: walletsProvider,
            selectedIndex: selectedIndex
        )
    }
}
