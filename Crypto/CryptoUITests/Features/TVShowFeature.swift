import XCTest

@testable import Crypto

class TabBarFeature: XCTestCase {
    private var tabBarSteps: TabBarSteps!
    
    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
        
        tabBarSteps = TabBarSteps()
    }
    
    func test_Show_TabBar() throws {
        tabBarSteps.i_see_tabbar()
        tabBarSteps.i_see_assets_screen()
    }
}
