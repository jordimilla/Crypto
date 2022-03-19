import Foundation
import Domain

public struct CollectionMapper: Mapper {
    
    static public func map(input: CollectionResponse) -> Collection {
        Collection(cryptoCoin: mapCollection(input: input.cryptocoins.attributes),
                   commodities: mapCollection(input: input.commodities.attributes),
                   fiats: mapCollection(input: input.fiats.attributes))
    }
    
    static public func mapCollection(input: [CryptoCoinTO]) -> [CryptoCoin] {
        return input.map { crypto -> CryptoCoin in
            CryptoCoin(name: crypto.name, icon: crypto.icon, symbol: crypto.symbol, price: crypto.price)
        }
    }
    
    static public func mapCollection(input: [CommoditiesTO]) -> [Commodities] {
        return input.map { com -> Commodities in
            Commodities(name: com.name, icon: com.icon, symbol: com.symbol, price: com.price)
        }
    }
    
    static public func mapCollection(input: [FiatTO]) -> [Fiat] {
        return input.map { fiat -> Fiat in
            Fiat(name: fiat.name, icon: fiat.icon, symbol: fiat.symbol, hasWallets: fiat.hasWallets)
        }
    }
}
