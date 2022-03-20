import Foundation
import Domain
import UIKit.UINavigationController

final class TabBarViewModel {
    
    let navigationController: UINavigationController
    private let getCollectionUseCase: QueryUseCase<NotUseCaseParams, Collection>
    let assetsProvider: SingleParamFeatureProvider<Collection>
    let walletsProvider: SingleParamFeatureProvider<Collection>
    
    @Observable var selectedIndex: Int
    @Observable var collectionObservable: Resource<Collection>? = .none
    
    init(navigationController: UINavigationController,
         getCollectionUseCase: QueryUseCase<NotUseCaseParams, Collection>,
         assetsProvider: @escaping SingleParamFeatureProvider<Collection>,
         walletsProvider: @escaping SingleParamFeatureProvider<Collection>,
         selectedIndex: Int) {
        
        self.navigationController = navigationController
        self.getCollectionUseCase = getCollectionUseCase
        self.assetsProvider = assetsProvider
        self.walletsProvider = walletsProvider
        self.selectedIndex = selectedIndex
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
