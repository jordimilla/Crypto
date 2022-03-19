import Foundation
import Combine
import Domain

protocol CollectionDataSource {
    func retrieveCollection() -> AnyPublisher<Collection, Error>
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
    
    func retrieveCollection() -> AnyPublisher<Collection, Error> {
        Deferred{
            Future<Data, Error> { promise in
                guard let jsonData = try? jsonFileReader.read(fileName: Constants.collectionDataJSONFileName, bundle: .module) else {
                    promise(.failure(CollectionDataSourceError.unableToReadJSONFile))
                    return
                }
                promise(.success(jsonData))
            }
        }.tryMap {
            let jsonDecoder = JSONDecoder()
            
            let response = try jsonDecoder.decode(BaseResponse<CollectionResponse>.self, from: $0)
            return CollectionMapper.map(input: response.data.attributes)
            
        }
        .eraseToAnyPublisher()
    }
}
