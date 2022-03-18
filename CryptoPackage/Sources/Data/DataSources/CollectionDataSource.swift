import Foundation
import Combine
import Domain

protocol CollectionDataSource {
    func retrieveCollection() -> AnyPublisher<Collection, CollectionDataSourceError>
}

enum CollectionDataSourceError: Error {
    case unableToReadJSONFile
    case unableToDecodeData
}

// MARK: - EnergyLogsAPIDataSource

private enum Constants {
    static let collectionDataJSONFileName = "data"
}


struct CollectionAPIDataSource: CollectionDataSource {
    private let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func retrieveCollection() -> AnyPublisher<Collection, CollectionDataSourceError> {
        Deferred {
            Future<Collection, CollectionDataSourceError> { promise in
                guard let jsonData = try? dependencies.jsonFileReader.read(fileName: Constants.collectionDataJSONFileName, bundle: .module) else {
                    promise(.failure(.unableToReadJSONFile))
                    return
                }

                let jsonDecoder = JSONDecoder()
                guard let response = try? jsonDecoder.decode(CollectionResponse.self, from: jsonData) else {
                    promise(.failure(.unableToDecodeData))
                    return
                }
                let collection = CollectionMapper.map(input: response)
                promise(.success(collection))
            }
        }
        .eraseToAnyPublisher()
    }
}

// MARK: - Dependencies

extension CollectionAPIDataSource {
    struct Dependencies {
        let jsonFileReader: JSONReader
    }
}
