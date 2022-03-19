import Foundation

public struct Collection: Equatable {
    public let cryptoCoin: [CryptoCoin]
    public let commodities: [CryptoCoin]
    public let fiats: [CryptoCoin]
    
    public init(cryptoCoin: [CryptoCoin],
                commodities: [CryptoCoin],
                fiats: [CryptoCoin]) {
        
        self.cryptoCoin = cryptoCoin
        self.commodities = commodities
        self.fiats = fiats
    }
}
