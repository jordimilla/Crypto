import Foundation
import Combine
import XCTest

@testable import Domain

class GetCollectionUseCaseTest: XCTestCase {
    
    private var mockCollectionRepository: MockCollectionRepository!
    private var sut: GetCollectionUseCase!
    
    override func setUp() {
        mockCollectionRepository = MockCollectionRepository()
        sut = GetCollectionUseCase(collectionRepository: mockCollectionRepository,
                                   dispacherHelper: TestDispacherHelperImpl())
    }
    
    override func tearDown() {
        mockCollectionRepository = .none
        sut = .none
    }
    
    func test_should_User_see_Colletion() {
        // given
        let mockCollection = createMockCollection()
        mockCollectionRepository.getCollectionStub.given(mockCollection)
        
        // when
        let result: Result<Collection, Error> = blockingAndGet(from: sut.build(params: .none))
        
        // then
        XCTAssertNotNil(result.value())
        XCTAssertTrue(mockCollectionRepository.getCollectionStub.called)
    }
    
}

extension GetCollectionUseCaseTest {
    private func createMockCollection() -> Collection {
        Collection(cryptoCoin: [CryptoCoin(name: "", icon: "", symbol: "", price: "")],
                                  commodities: [Commodities(name: "", icon: "", symbol: "", price: "")],
                                  fiats: [Fiat(name: "", icon: "", symbol: "", hasWallets: true)],
                                  wallets: [Wallet(name: "", symbol: "", balance: "", defaultWallet: true, deleted: false)],
                                  commodityWallets: [CommodityWallet(name: "", symbol: "", balance: "", defaultWallet: true, deleted: false)],
                                  fiatWallets: [FiatWallet(name: "", symbol: "", balance: "", defaultWallet: true, deleted: false)])
    }
}
