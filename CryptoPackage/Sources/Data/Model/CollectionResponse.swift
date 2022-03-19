import Foundation

public struct CollectionResponse: Decodable, Encodable {
    let cryptocoins: DataResponse<[CryptoCoinTO], String>
    let commodities: DataResponse<[CommoditiesTO], String>
    let fiats: DataResponse<[FiatTO], String>
    let wallets: DataResponse<[WalletTO], String>
    let commodityWallets: DataResponse<[CommodityWalletTO], String>
    let fiatWallets: DataResponse<[FiatWalletTO], String>
    
    private enum CodingKeys: String, CodingKey {
        case cryptocoins, commodities, fiats, wallets
        case fiatWallets = "fiatwallets"
        case commodityWallets = "commodity_wallets"
    }
}
