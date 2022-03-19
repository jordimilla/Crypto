import Foundation

public struct Collection: Equatable {
    public let cryptoCoin: [CryptoCoin]
    public let commodities: [Commodities]
    public let fiats: [Fiat]
    public let wallets: [Wallet]
    public let commodityWallets: [CommodityWallet]
    public let fiatWallets: [FiatWallet]
    
    public init(cryptoCoin: [CryptoCoin], commodities: [Commodities], fiats: [Fiat], wallets: [Wallet], commodityWallets: [CommodityWallet], fiatWallets: [FiatWallet]) {
        self.cryptoCoin = cryptoCoin
        self.commodities = commodities
        self.fiats = fiats
        self.wallets = wallets
        self.commodityWallets = commodityWallets
        self.fiatWallets = fiatWallets
    }
}
