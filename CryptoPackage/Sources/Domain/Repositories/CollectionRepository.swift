import Combine

public enum CollectionRepositoryError: Error {
    case dataSourceError
}

public protocol CollectionRepository {
    func retrieveCollection() -> AnyPublisher<Collection, Error>
}
