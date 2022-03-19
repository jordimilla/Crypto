import Foundation

public struct WalletTO: Decodable, Encodable {
    let name: String
    let symbol: String
    let balance: String
    let defaultWallet: Bool?
    let deleted: Bool?

    private enum CodingKeys: String, CodingKey {
        case name, deleted, balance
        case symbol = "cryptocoin_symbol"
        case defaultWallet = "is_default"
    }
}
