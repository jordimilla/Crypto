import Foundation
import UIKit.UINavigationController

final class TabBarViewModel {
    
    let navigationController: UINavigationController
    let assetsProvider: FeatureProvider
    let walletsProvider: FeatureProvider
    
    @Observable var selectedIndex: Int
    
    init(navigationController: UINavigationController,
         assetsProvider: @escaping FeatureProvider,
         walletsProvider: @escaping FeatureProvider,
         selectedIndex: Int) {
        
        self.navigationController = navigationController
        self.assetsProvider = assetsProvider
        self.walletsProvider = walletsProvider
        self.selectedIndex = selectedIndex
    }
}
