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


private enum Constants {
    static let collectionDataJSONFileName = "data"
}


struct CollectionDataSourceImpl: CollectionDataSource {
    private let jsonFileReader: JSONReader
    
    init(jsonFileReader: JSONReader) {
        self.jsonFileReader = jsonFileReader
    }
    
    func retrieveCollection() -> AnyPublisher<Collection, CollectionDataSourceError> {
        Deferred {
            Future<Collection, CollectionDataSourceError> { promise in
                guard let jsonData = try? jsonFileReader.read(fileName: Constants.collectionDataJSONFileName, bundle: .module) else {
                    promise(.failure(.unableToReadJSONFile))
                    return
                }

                let jsonDecoder = JSONDecoder()
                
                guard let response = try? jsonDecoder.decode(BaseResponse<CollectionResponse>.self, from: jsonData) else {
                    promise(.failure(.unableToDecodeData))
                    return
                }
                let collection = CollectionMapper.map(input: response.data.attributes)
                promise(.success(collection))
            }
        }
        .eraseToAnyPublisher()
    }
}
