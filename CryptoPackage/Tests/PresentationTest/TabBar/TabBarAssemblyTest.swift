@testable import Domain
@testable import Presentation
import XCTest

final class TabBarAssemblyTest: XCTestCase {
    
    var sut: TabBarAssembly!
    var getCollectionUseCase: MockGetCollectionUseCase!
    let assetsFeature: SingleParamFeatureProvider<Collection> = { _, _  in return UIViewController()}
    let walletsProvider: SingleParamFeatureProvider<Collection> = { _, _  in return UIViewController()}
    
    override func setUp() {
        super.setUp()
        getCollectionUseCase = MockGetCollectionUseCase(dispacherHelper: TestDispacherHelperImpl())
        let navigationController = UINavigationController()
        sut = TabBarAssembly(navigationController: navigationController,
                             getCollectionUseCase: getCollectionUseCase,
                             assetsProvider: assetsFeature,
                             walletsProvider: walletsProvider,
                             selectedIndex: 0)

    }
    
    func test_get_tabbarviewcontorller_when_build() {
        // WHEN
        let viewController = sut.build()
        
        // THEN
        XCTAssertTrue(viewController is TabBarViewController)
    }
}
