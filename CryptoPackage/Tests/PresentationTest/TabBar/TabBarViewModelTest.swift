import Foundation
@testable import Domain
@testable import Presentation
import XCTest

final class TabBarViewModelTest: XCTestCase {
    
    var sut: TabBarViewModel!
    var getCollectionUseCase: MockGetCollectionUseCase!
    var collection: Collection?
    let assetsFeature: SingleParamFeatureProvider<Collection> = { _, _  in return UIViewController()}
    let walletsProvider: SingleParamFeatureProvider<Collection> = { _, _  in return UIViewController()}

    override func setUp() {
        super.setUp()
        getCollectionUseCase = MockGetCollectionUseCase(dispacherHelper: TestDispacherHelperImpl())
        let navigationController = UINavigationController()
        sut = TabBarViewModel(navigationController: navigationController,
                             getCollectionUseCase: getCollectionUseCase,
                             assetsProvider: assetsFeature,
                             walletsProvider: walletsProvider,
                             selectedIndex: 0)
    }

    override func tearDown() {
        super.tearDown()
    }

    func test_Given_viewModel_When_setup_Then_CollectionMap() throws {
        var expectedCollection: Collection?
        
        let binding: (Resource<Collection>?) -> Void = { receivedCollection in
            expectedCollection = receivedCollection?.data()
        }
        
        sut.$collectionObservable.bind(action: binding)
      
        // THEN
        XCTAssertEqual(expectedCollection, collection)
   
    }

}

