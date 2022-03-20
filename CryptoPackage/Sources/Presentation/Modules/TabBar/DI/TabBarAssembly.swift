import Foundation
import Domain
import UIKit.UINavigationController

public class TabBarAssembly {
    
    private let navigationController: UINavigationController
    private let getCollectionUseCase: QueryUseCase<NotUseCaseParams, Collection>
    private let assetsProvider: SingleParamFeatureProvider<Collection>
    private let walletsProvider: SingleParamFeatureProvider<Collection>
    private let selectedIndex: Int
    
    public init(navigationController: UINavigationController,
                getCollectionUseCase: QueryUseCase<NotUseCaseParams, Collection>,
                assetsProvider: @escaping SingleParamFeatureProvider<Collection>,
                walletsProvider: @escaping SingleParamFeatureProvider<Collection>,
                selectedIndex: Int) {
        self.navigationController = navigationController
        self.getCollectionUseCase = getCollectionUseCase
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
            getCollectionUseCase: getCollectionUseCase,
            assetsProvider: assetsProvider,
            walletsProvider: walletsProvider,
            selectedIndex: selectedIndex
        )
    }
}

