import Foundation

public struct Collection: Equatable {
    public let cryptoCoin: [CryptoCoin]
    public let commodities: [Commodities]
    public let fiats: [Fiat]
    
    public init(cryptoCoin: [CryptoCoin],
                commodities: [Commodities],
                fiats: [Fiat]) {
        
        self.cryptoCoin = cryptoCoin
        self.commodities = commodities
        self.fiats = fiats
    }
}
