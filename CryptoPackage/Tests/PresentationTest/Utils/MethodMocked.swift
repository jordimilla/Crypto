import Foundation

struct UnStubError: Swift.Error {
    var description: String {
        return "UnStubd object."
    }
}

final class MethodStub<T> {
    var called = false
    var result: T? = .none
    var params: [AnyHashable] = []
    
    func doCall(params: [AnyHashable] = []) {
        self.called = true
        self.params = params
    }
}

final class ResultMethodStub<T> {
    var called = false
    var result: Result<T, Error> = .failure(UnStubError())
    var params: [AnyHashable] = []
    
    func doCall(params: [AnyHashable] = []) {
        self.called = true
        self.params = params
    }
}
