@testable import Domain
@testable import Presentation
import XCTest

final class AssetsAssemblyTest: XCTestCase {
    
    var sut: AssetsAssembly!
    var data: Collection!
    
    override func setUp() {
        super.setUp()
        data = Collection(cryptoCoin: [CryptoCoin(name: "", icon: "", symbol: "", price: "")],
                          commodities: [Commodities(name: "", icon: "", symbol: "", price: "")],
                          fiats: [Fiat(name: "", icon: "", symbol: "", hasWallets: true)],
                          wallets: [Wallet(name: "", symbol: "", balance: "", defaultWallet: true, deleted: false)],
                          commodityWallets: [CommodityWallet(name: "", symbol: "", balance: "", defaultWallet: true, deleted: false)],
                          fiatWallets: [FiatWallet(name: "", symbol: "", balance: "", defaultWallet: true, deleted: false)])
        
        sut = AssetsAssembly(data: data)

    }
    
    func test_get_assetsviewcontroller_when_build() {
        // WHEN
        let viewController = sut.build()
        
        // THEN
        XCTAssertTrue(viewController is AssestsViewController)
    }
}
