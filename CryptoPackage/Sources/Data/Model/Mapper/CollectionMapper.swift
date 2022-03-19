import Foundation
import Domain

public struct CollectionMapper: Mapper {
    
    static public func map(input: CollectionResponse) -> Collection {
        Collection(cryptoCoin: mapCollection(input: input.cryptocoins.attributes))
    }
    
    static public func mapCollection(input: [CryptoCoinTO]) -> [CryptoCoin] {
        return input.map { crypto -> CryptoCoin in
            CryptoCoin(symbol: crypto.symbol)
        }
    }
}
