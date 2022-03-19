import Combine
import Domain

struct CollectionRepositoryImpl: CollectionRepository {
    
    private let collectionDataSource: CollectionDataSource
    
    init(collectionDataSource: CollectionDataSource) {
        self.collectionDataSource = collectionDataSource
    }
    
    func retrieveCollection() -> AnyPublisher<Collection, CollectionRepositoryError> {
        collectionDataSource.retrieveCollection()
            .mapError { _ in CollectionRepositoryError.dataSourceError }
            .eraseToAnyPublisher()
    }
    
}
