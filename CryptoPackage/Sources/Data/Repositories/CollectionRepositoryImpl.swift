import Combine
import Domain

struct CollectionRepositoryImpl: CollectionRepository {
    
    private let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func retrieveCollection() -> AnyPublisher<Collection, CollectionRepositoryError> {
        dependencies.collectionDataSource.retrieveCollection()
            .mapError { _ in CollectionRepositoryError.dataSourceError }
            .eraseToAnyPublisher()
    }
    
}

// MARK: - Dependencies

extension CollectionRepositoryImpl {
    struct Dependencies {
        let collectionDataSource: CollectionDataSource
    }
}
