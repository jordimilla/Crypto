import Foundation

public struct CollectionResponse: Decodable {
    let cryptocoins: [CryptoCoinTO]
    
    private enum CodingKeys: String, CodingKey {
        case cryptocoins
    }
}
