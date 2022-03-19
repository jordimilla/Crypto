import Foundation
import Combine

public class GetCollectionUseCase: QueryUseCase<NotUseCaseParams, Collection> {
    private let collectionRepository: CollectionRepository
    
    public init(collectionRepository: CollectionRepository,
                dispacherHelper: DispacherHelper) {
        self.collectionRepository = collectionRepository
        super.init(dispacherHelper: dispacherHelper)
    }
   
    public func build() -> AnyPublisher<Collection, CollectionRepositoryError> {
        return collectionRepository.retrieveCollection()
    }
}
