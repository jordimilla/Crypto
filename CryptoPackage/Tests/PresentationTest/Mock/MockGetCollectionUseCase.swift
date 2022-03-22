import Foundation
import Combine
@testable import Domain

public class MockGetCollectionUseCase: QueryUseCase<NotUseCaseParams, Collection> {
    var result: AnyPublisher<Collection, Error>!
    
    public override func build(params: NotUseCaseParams? = nil) -> AnyPublisher<Collection, Error> {
        result
    }
}
