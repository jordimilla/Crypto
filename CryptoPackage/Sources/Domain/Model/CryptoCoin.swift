import Foundation

public struct CryptoCoin: Equatable {
    public let symbol: String
    
    public init(symbol: String) {
        self.symbol = symbol
    }
}
