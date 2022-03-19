import Foundation
import Domain

public class DispacherHelperImpl: DispacherHelper {
    
    public init() {}
    
    public func main() -> DispatchQueue {
        return DispatchQueue.main
    }
    
    public func io() -> DispatchQueue {
        return DispatchQueue.global()
    }
}
