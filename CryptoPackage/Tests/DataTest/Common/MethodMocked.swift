import Foundation
import Combine
import Domain

struct UnStubError: Swift.Error {
    var description: String {
        return "UnStubd object."
    }
}

final class MethodStub<T> {
    private (set) var called = false
    private (set) var result: T? = .none
    private (set) var params: [Any] = []
    
    func doCall(params: [Any] = []) {
        self.called = true
        self.params = params
    }
    
    func given(_ value: T?) {
        result = value
    }
    
    func param<P>(_ index: Int) -> P? {
       return params[index] as? P
    }
}

final class ResultMethodStub<T> {
    private (set) var called = false
    private (set) var result: Result<T, Error> = .failure(UnStubError())
    private (set) var params: [Any] = []
    
    func doCall(params: [Any] = []) {
        self.called = true
        self.params = params
    }
    
    func given(_ value: T) {
        result = .success(value)
    }
    
    func given(_ error: Error) {
        result = .failure(error)
    }
    
    func param<P>(_ index: Int) -> P? {
       return params[index] as? P
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
    
    func param<P>(_ index: Int) -> P? {
       return params[index] as? P
    }
}
