@testable import Data
import Foundation

enum MockJSONFileReaderError: Error {
    case mockError
}

final class MockJSONFileReader: JSONReader {
    var result: Result<Data, MockJSONFileReaderError>!

    func read(fileName _: String, bundle _: Bundle) throws -> Data {
        switch result {
        case let .success(data):
            return data
        case .failure, .none:
            throw MockJSONFileReaderError.mockError
        }
    }
}
