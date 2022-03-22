import Combine
@testable import Data
import Domain

final class MockCollectionDataSource: CollectionDataSource {
    
    var collectionStub: CombineMethodStub<Collection> = CombineMethodStub()

    func retrieveCollection() -> AnyPublisher<Collection, Error> {
        collectionStub.doCall()
        return collectionStub.result
    }
}
