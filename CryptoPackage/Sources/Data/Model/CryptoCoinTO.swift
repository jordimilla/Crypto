import Foundation

public struct CryptoCoinTO: Decodable {
    let symbol: String

    private enum CodingKeys: String, CodingKey {
        case symbol = "symbol"

    }
}
