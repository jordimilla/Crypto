import Domain
import Foundation
import Combine

final class AssetsViewModel {
    
    private let getCollectionUseCase: QueryUseCase<NotUseCaseParams, Collection>

    @Observable var collectionObservable: Resource<Collection>? = .none
    
    init(getCollectionUseCase: QueryUseCase<NotUseCaseParams, Collection>){
        
        self.getCollectionUseCase = getCollectionUseCase
    }
    
    public func requestCollection() {
        
        getCollectionUseCase.execute(
            onSuccess: { [unowned self] collectionList in
                self.collectionObservable = .success(collectionList)
            },
            onError: { error in
                print(error)
            }
        )
    }
}
