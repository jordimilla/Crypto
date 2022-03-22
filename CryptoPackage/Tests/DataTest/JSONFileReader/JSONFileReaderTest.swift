import Foundation
import XCTest
@testable import Data

final class JSONFileReaderTest: XCTestCase {
    
    private var sut: JSONFileReader!
    
    override func setUp() {
        super.setUp()
        sut = JSONFileReader()
    }
    
    func test_json_reader_succeed() {
        //give
        let jsonFileName = "json_file_reader_test"
        //when
        let fileData = try? sut.read(fileName: jsonFileName, bundle: .module)
        //then
        XCTAssertNotNil(fileData)
        
    }
    
    func test_json_reader_fails() {
        //give
        let jsonFileName = "random"
        //when
        let fileData = try? sut.read(fileName: jsonFileName, bundle: .module)
        //then
        XCTAssertNil(fileData)
        
    }
    
}
