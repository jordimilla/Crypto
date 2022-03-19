import Foundation

public struct CryptoCoinTO: Decodable, Encodable {
    let symbol: String

    private enum CodingKeys: String, CodingKey {
        case symbol = "symbol"

    }
}
