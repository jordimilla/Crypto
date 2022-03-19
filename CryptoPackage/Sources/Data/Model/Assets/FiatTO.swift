import Foundation

public struct FiatTO: Decodable, Encodable {
    let name: String
    let icon: String
    let symbol: String
    let hasWallets: Bool

    private enum CodingKeys: String, CodingKey {
        case name, symbol
        case icon = "logo"
        case hasWallets = "has_wallets"
    }
}
