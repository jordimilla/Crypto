import Combine

public typealias CollectionPublisher = AnyPublisher<String, CollectionRepositoryError>

public enum CollectionRepositoryError: Error {
    case dataSourceError
}

public protocol CollectionRepository {
    func retrieveCollection() -> AnyPublisher<Collection, CollectionRepositoryError>
}
