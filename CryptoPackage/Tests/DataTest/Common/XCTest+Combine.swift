import XCTest
import Foundation
import Combine

extension XCTestCase {

    func blockingAndGet<T>(
        from publisher: AnyPublisher<T, Error>,
        timeout: TimeInterval = 2,
        file: StaticString = #file,
        line: UInt = #line
    ) -> Result<T, Error> {
        let exp = expectation(description: "")
        
        var result: Result<T, Error> = .failure(UnStubError())
        let cancellable = publisher
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    result = .failure(error)
                    exp.fulfill()
                    
                case .finished:
                    exp.fulfill()
                }
        
            }, receiveValue: { value in
                result = .success(value)
            })
          
        XCTAssertNotNil(cancellable)
        wait(for: [exp], timeout: 1)
        
        return result
    }
}
