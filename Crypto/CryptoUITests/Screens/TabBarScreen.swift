import Foundation
import XCTest

@testable import Crypto

class TabBarScreen : BaseScreen {

    private static let tabBarScreenIdentifier: String = "tabBarScreen"
    
    private static let assetScreenIdentifier: String = "assetScreenIdentifier"
    
    private static let tabAssetsIdentifier: String = "tabBarAsset"
    private static let tabWalletIdentifier: String = "tabBarWallet"
    
    func isPresent() {
        waitForOtherElementsPresent(screenId: TabBarScreen.tabBarScreenIdentifier)
    }
    
    func isFirstTabBarLoad() {
        waitForOtherElementsPresent(screenId: TabBarScreen.assetScreenIdentifier)
    }
}
