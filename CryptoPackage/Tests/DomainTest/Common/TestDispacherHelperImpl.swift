import Foundation
import Combine

@testable import Domain

internal class TestDispacherHelperImpl: DispacherHelper {
    
    public func main() -> DispatchQueue {
        return DispatchQueue.main
    }
    
    public func io() -> DispatchQueue {
        return DispatchQueue.main
    }
}
