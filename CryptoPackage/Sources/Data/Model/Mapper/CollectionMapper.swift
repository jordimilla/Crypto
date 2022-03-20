import Foundation
import Domain

public struct CollectionMapper: Mapper {
    
    static public func map(input: CollectionResponse) -> Collection {
        Collection(cryptoCoin: mapCollection(input: input.cryptocoins.map { $0.attributes }),
                   commodities: mapCollection(input: input.commodities.map { $0.attributes }),
                   fiats: mapCollection(input: input.fiats.map { $0.attributes }).filter(){$0.hasWallets == true},
                   wallets: mapCollection(input: input.wallets.map { $0.attributes }).filter(){$0.deleted == false}.sorted(by: { Double($0.balance) ?? 0 >  Double($1.balance) ?? 0 }),
                   commodityWallets: mapCollection(input: input.commodityWallets.map { $0.attributes }).filter(){ $0.deleted == false }.sorted(by: { Double($0.balance) ?? 0 >  Double($1.balance) ?? 0 }),
                   fiatWallets: mapCollection(input: input.fiatWallets.map { $0.attributes }).filter(){$0.deleted == false}.sorted(by: { Double($0.balance) ?? 0 >  Double($1.balance) ?? 0 }))
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
    
    static public func mapCollection(input: [WalletTO]) -> [Wallet] {
        return input.map { wallet -> Wallet in
            Wallet(name: wallet.name, symbol: wallet.symbol, balance: wallet.balance, defaultWallet: wallet.defaultWallet ?? false, deleted: wallet.deleted ?? true)
        }
    }
    
    static public func mapCollection(input: [CommodityWalletTO]) -> [CommodityWallet] {
        return input.map { wallet -> CommodityWallet in
            CommodityWallet(name: wallet.name, symbol: wallet.symbol, balance: wallet.balance, defaultWallet: wallet.defaultWallet ?? false, deleted: wallet.deleted ?? true)
        }
    }
    
    static public func mapCollection(input: [FiatWalletTO]) -> [FiatWallet] {
        return input.map { wallet -> FiatWallet in
            FiatWallet(name: wallet.name, symbol: wallet.symbol, balance: wallet.balance, defaultWallet: wallet.defaultWallet ?? false, deleted: wallet.deleted ?? true)
        }
    }
}
