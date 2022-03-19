import Foundation

public struct CollectionResponse: Decodable, Encodable {
    let cryptocoins: DataResponse<[CryptoCoinTO], String>
    
    private enum CodingKeys: String, CodingKey {
        case cryptocoins
    }
}
