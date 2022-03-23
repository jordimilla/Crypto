import Foundation

public extension Result {
    
    func value<T>() -> T? {
        if case let .success(data) = self {
            return data as? T
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
