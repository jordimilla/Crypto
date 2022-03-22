import Domain
import Presentation
import Data

public class HelperAssemblyModule {
    
    public static func dispacherHelperProvider() -> DispacherHelperImpl {
        DispacherHelperImpl()
    }
}

public class FeatureAssembly {
    
    public static let tabBarFeature: FeatureProvider = { navigationController in
        tabBarWithSelectedIndexFeature(navigationController, 0)
    }
    
    public static let tabBarWithSelectedIndexFeature: SingleParamFeatureProvider<Int> = { navigationController, index in
        
        let useCase = GetCollectionUseCase(collectionRepository: RepositoryAssembly.makeCollectionRepository(),
                                           dispacherHelper: HelperAssemblyModule.dispacherHelperProvider())
        
        return TabBarAssembly(navigationController: navigationController,
                              getCollectionUseCase: useCase,
                              assetsProvider: assetsFeature,
                              walletsProvider: walletsFeature,
                              selectedIndex: index).build()
    }
    
    public static let assetsFeature: SingleParamFeatureProvider<Collection> = { navigationController, data  in
        let useCase = GetCollectionUseCase(collectionRepository: RepositoryAssembly.makeCollectionRepository(),
                                           dispacherHelper: HelperAssemblyModule.dispacherHelperProvider())
        
        return AssetsAssembly(data: data).build()
    }
    
    public static let walletsFeature: SingleParamFeatureProvider<Collection> = { navigationController, data  in
        let useCase = GetCollectionUseCase(collectionRepository: RepositoryAssembly.makeCollectionRepository(),
                                           dispacherHelper: HelperAssemblyModule.dispacherHelperProvider())
        
        return WalletsAssembly(data: data).build()
    }
}

