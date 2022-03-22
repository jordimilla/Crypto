import Combine
@testable import Data
import Domain

final class MockCollectionDataSource: CollectionDataSource {
    var result: AnyPublisher<Collection, Error>!

    func retrieveCollection() -> AnyPublisher<Collection, Error> {
        result
    }
}
