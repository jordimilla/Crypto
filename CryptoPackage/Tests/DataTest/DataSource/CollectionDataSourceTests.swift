import Foundation
import Combine
import XCTest

@testable import Domain
@testable import Data

final class CollectionDataSourceTests: XCTestCase {
    
    var cancellables: Set<AnyCancellable>!
    var fileReader: MockJSONFileReader!
    var sut: CollectionDataSource!
    
    override func setUp() {
        super.setUp()
        cancellables = []
        fileReader = MockJSONFileReader()
        sut = CollectionDataSourceImpl(jsonFileReader: fileReader)
    }
    
    func test_retrieve_collection() {
        //give
        let expected = Collection(cryptoCoin: [CryptoCoin(name: "", icon: "", symbol: "", price: "")],
                                  commodities: [Commodities(name: "", icon: "", symbol: "", price: "")],
                                  fiats: [Fiat(name: "", icon: "", symbol: "", hasWallets: true)],
                                  wallets: [Wallet(name: "", symbol: "", balance: "", defaultWallet: true, deleted: false)],
                                  commodityWallets: [CommodityWallet(name: "", symbol: "", balance: "", defaultWallet: true, deleted: false)],
                                  fiatWallets: [FiatWallet(name: "", symbol: "", balance: "", defaultWallet: true, deleted: false)])

        
    }
}
