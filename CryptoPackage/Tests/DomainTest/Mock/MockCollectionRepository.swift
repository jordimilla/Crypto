import Foundation
import Domain
import Combine

public class MockCollectionRepository: CollectionRepository {

    var getCollectionStub: CombineMethodStub<Collection> = CombineMethodStub()
    
    public init() {}
    
    public func retrieveCollection() -> AnyPublisher<Collection, Error> {
        getCollectionStub.doCall()
        return getCollectionStub.result
    }
    
}

