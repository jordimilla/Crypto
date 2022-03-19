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
        
        return TabBarAssembly(navigationController: navigationController,
                              assetsProvider: assetsFeature,
                              walletsProvider: walletsFeature,
                              selectedIndex: index).build()
    }
    
    
    
    public static let assetsFeature: FeatureProvider = { navigationController  in
        let useCase = GetCollectionUseCase(collectionRepository: RepositoryAssembly.makeCollectionRepository(),
                                           dispacherHelper: HelperAssemblyModule.dispacherHelperProvider())
        
        return AssetsAssembly(useCase: useCase).build()
    }
    
    public static let walletsFeature: FeatureProvider = { navigationController  in
        let useCase = GetCollectionUseCase(collectionRepository: RepositoryAssembly.makeCollectionRepository(),
                                           dispacherHelper: HelperAssemblyModule.dispacherHelperProvider())
        
        return WalletsAssembly(useCase: useCase).build()
    }
}

