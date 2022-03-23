import Foundation
import Domain
import Combine
import XCTest
@testable import Data

final class CollectionRepositoryTest: XCTestCase {
    
    private var cancellables: Set<AnyCancellable>!
    private var mockCollectionDataSource: MockCollectionDataSource!
    private var sut: CollectionRepository!
    private var result: AnyPublisher<Collection, Error>!
    
    override func setUp() {
        super.setUp()
        cancellables = []
        mockCollectionDataSource = MockCollectionDataSource()
        sut = CollectionRepositoryImpl(collectionDataSource: MockCollectionDataSource())
    }
    
    func test_retrieve_collection_repsitory() {
        //give
        let expected = createMockCollection()
        mockCollectionDataSource.collectionStub.given(expected)
        // when
        let result = blockingAndGet(from: mockCollectionDataSource.retrieveCollection())
        
        // then
        XCTAssertEqual(result.value(), expected)
        XCTAssertNil(result.error)
        XCTAssertTrue(mockCollectionDataSource.collectionStub.called)
        

    }
    
}

extension CollectionRepositoryTest {
    private func createMockCollection() -> Collection {
        Collection(cryptoCoin: [CryptoCoin(name: "name1", icon: "", symbol: "", price: "")],
                   commodities: [Commodities(name: "", icon: "", symbol: "", price: "")],
                   fiats: [Fiat(name: "", icon: "", symbol: "", hasWallets: true)],
                   wallets: [Wallet(name: "", symbol: "", balance: "", defaultWallet: true, deleted: false)],
                   commodityWallets: [CommodityWallet(name: "", symbol: "", balance: "", defaultWallet: true, deleted: false)],
                   fiatWallets: [FiatWallet(name: "", symbol: "", balance: "", defaultWallet: true, deleted: false)])
    }
}
