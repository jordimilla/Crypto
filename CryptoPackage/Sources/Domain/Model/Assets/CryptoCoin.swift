import Foundation

public struct CryptoCoin: Equatable {

    public let name: String
    public let icon: String
    public let symbol: String
    public let price: String
    
    public init(name: String, icon: String, symbol: String, price: String) {
        self.name = name
        self.icon = icon
        self.symbol = symbol
        self.price = price
    }
}
