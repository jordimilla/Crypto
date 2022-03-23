import Foundation
import XCTest

class TabBarSteps {
    
    private var tabBar: TabBarScreen
    
    init() {
        tabBar = TabBarScreen()
    }
    
    /// I see TabBar Screen
    func i_see_tabbar() {
        XCTContext.runActivity(named: "I see TabBar") { _ in
            tabBar.isPresent()
        }
    }
    
    /// I see Assets Screen
    func i_see_assets_screen() {
        XCTContext.runActivity(named: "I see assets screen") { _ in
            tabBar.isFirstTabBarLoad()
        }
    }
}
