import Foundation

public struct CollectionResponse: Decodable, Encodable {
    let cryptocoins: DataResponse<[CryptoCoinTO], String>
    let commodities: DataResponse<[CommoditiesTO], String>
    let fiats: DataResponse<[FiatTO], String>
    
    private enum CodingKeys: String, CodingKey {
        case cryptocoins, commodities, fiats
    }
}
