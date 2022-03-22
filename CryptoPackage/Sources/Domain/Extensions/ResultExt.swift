import Foundation

public extension Result {
    
    var value: Any? {
        if case let .success(data) = self {
            return data
        }
        return .none
        
    }
    
    var error: Error? {
        if case let .failure(error) = self {
            return error
        }
        return .none
    }
}
