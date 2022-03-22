@testable import Domain
@testable import Presentation
import XCTest

final class WalletsAssetsAssemblyTest: XCTestCase {
    
    var sut: WalletsAssembly!
    var data: Collection!
    
    override func setUp() {
        super.setUp()
        data = Collection(cryptoCoin: [CryptoCoin(name: "", icon: "", symbol: "", price: "")],
                          commodities: [Commodities(name: "", icon: "", symbol: "", price: "")],
                          fiats: [Fiat(name: "", icon: "", symbol: "", hasWallets: true)],
                          wallets: [Wallet(name: "", symbol: "", balance: "", defaultWallet: true, deleted: false)],
                          commodityWallets: [CommodityWallet(name: "", symbol: "", balance: "", defaultWallet: true, deleted: false)],
                          fiatWallets: [FiatWallet(name: "", symbol: "", balance: "", defaultWallet: true, deleted: false)])
        
        sut = WalletsAssembly(data: data)

    }
    
    func test_get_walletsviewcontroller_when_build() {
        let viewController = sut.build()
        
        XCTAssertTrue(viewController is WalletsViewController)
    }
}
