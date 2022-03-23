import Foundation
import Combine
import Domain

struct UnStubError: Swift.Error {
    var description: String {
        return "UnStubd object."
    }
}

final class CombineMethodStub<T> {
    private (set) var called = false
    private (set) var result: AnyPublisher<T, Error> = Publishers.createErrorPublisher(UnStubError())
    private (set) var params: [Any] = []
    
    func doCall(params: [Any] = []) {
        self.called = true
        self.params = params
    }
    
    func given(_ value: T) {
        result = Publishers.createValuePublisher(value)
    }
    
    func given(_ error: Error) {
        result = Publishers.createErrorPublisher(error)
    }
}

