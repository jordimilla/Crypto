import Foundation
import XCTest

@testable import Crypto

var app = XCUIApplication()

class BaseScreen {
    
    func waitForOtherElementsPresent(screenId: String, timeout: TimeInterval = 5) {
        let resultView = app.otherElements[screenId]
        let viewExists = resultView.waitForExistence(timeout: timeout)
        XCTAssert(viewExists)
    }
    
    func otherElementsPresent(screenId: String) {
        let resultView = app.otherElements[screenId]
        XCTAssert(resultView.exists)
    }
    
    func tabOnTabBarItem(screenId: String) {
        let tab = app.tabBars.firstMatch.buttons.element(boundBy: 1)
        tab.tap()
    }
}

