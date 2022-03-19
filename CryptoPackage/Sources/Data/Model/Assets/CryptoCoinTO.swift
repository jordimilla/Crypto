import Foundation

public struct CryptoCoinTO: Decodable, Encodable {
    let name: String
    let icon: String
    let symbol: String
    let price: String

    private enum CodingKeys: String, CodingKey {
        case name, symbol
        case icon = "logo"
        case price = "avg_price"
    }
}
