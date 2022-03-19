import Domain
import Foundation
import Combine

final class WalletsViewModel {
    
    private let getCollectionUseCase: QueryUseCase<NotUseCaseParams, Collection>
    
    init(getCollectionUseCase: QueryUseCase<NotUseCaseParams, Collection>){
        
        self.getCollectionUseCase = getCollectionUseCase
    }
    
    public func requestCollection() {
//        getCollectionUseCase.execute(
//            onSuccess: { [unowned self] collectionList in
//                print(collectionList)
//            },
//            onError: { error in
//                print(error)
//            }
//        )
    }
}
