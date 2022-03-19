import Foundation

public struct BaseResponse<T: Codable>: Codable {
    let data: DataResponse<T, String>
    
    public init(data: DataResponse<T, String>) {
        self.data = data
    }
}

public struct DataResponse<T: Codable, R: Codable>: Codable {
    let type: R
    let attributes: T
    
    private enum CodingKeys: String, CodingKey {
        case type
        case attributes
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(R.self, forKey: .type)
        self.attributes = try container.decode(T.self, forKey: .attributes)
    }
    
    public init(type: R,
                attributes: T) {
        self.type = type
        self.attributes = attributes
    }
}
