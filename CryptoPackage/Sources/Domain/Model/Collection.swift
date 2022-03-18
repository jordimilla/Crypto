import Foundation

public struct Collection: Equatable {
    public let cryptoCoin: [CryptoCoin]
    
    public init(cryptoCoin: [CryptoCoin]) {
        self.cryptoCoin = cryptoCoin
    }
}
