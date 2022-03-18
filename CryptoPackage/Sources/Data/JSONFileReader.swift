import Foundation

protocol JSONReader {
    func read(fileName: String, bundle: Bundle) throws -> Data
}

struct JSONFileReader: JSONReader {
    func read(fileName: String, bundle: Bundle) throws -> Data {
        guard let filePath = bundle.path(forResource: fileName, ofType: "json") else {
            throw Error.unableToFindFile
        }

        guard let jsonData = try String(contentsOfFile: filePath).data(using: .utf8) else {
            throw Error.unableToReadFile
        }

        return jsonData
    }
}

// MARK: - Error

extension JSONFileReader {
    enum Error: Swift.Error {
        case unableToFindFile
        case unableToReadFile
    }
}
