import Foundation
import Combine
import XCTest

@testable import Domain

class GetCollectionUseCaseTest: XCTestCase {
    
    private var mockCollectionRepository: MockCollectionRepository()
    private var sut: GetCollectionUseCase!
    
    override func setUp() {
        sut = GetCollectionUseCase(collectionRepository: mockCollectionRepository,
                                   dispacherHelper: TestDispacherHelperImpl())
    }
    
    func test_should_User_see_Colletion() {
        let expected = createCollection()
        
    }
    
}

extension GetCollectionUseCaseTest {

    private func createCollection() -> Collection {
        Collection(cryptoCoin: [CryptoCoin(name: "", icon: "", symbol: "", price: "")],
                                  commodities: [Commodities(name: "", icon: "", symbol: "", price: "")],
                                  fiats: [Fiat(name: "", icon: "", symbol: "", hasWallets: "")],
                                  wallets: [Wallet(name: "", symbol: "", balance: "", defaultWallet: true, deleted: false)],
                                  commodityWallets: [CommodityWallet(name: "", symbol: "", balance: "", defaultWallet: true, deleted: false)],
                                  fiatWallets: [FiatWallet(name: "", symbol: "", balance: "", defaultWallet: true, deleted: false)])
    }
}
