import Foundation

public struct Fiat: Equatable {

    public let name: String
    public let icon: String
    public let symbol: String
    public let hasWallets: Bool
    
    public init(name: String, icon: String, symbol: String, hasWallets: Bool) {
        self.name = name
        self.icon = icon
        self.symbol = symbol
        self.hasWallets = hasWallets
    }
}
