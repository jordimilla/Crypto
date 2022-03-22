import Combine
import Foundation

public extension Publisher {
    
    func fallback(to fallbackPublisher: @escaping () -> AnyPublisher<Output, Failure>) -> AnyPublisher<Output, Failure> {
        self.catch { _ in
            fallbackPublisher()
        }.eraseToAnyPublisher()
    }
}

public extension Publishers {
    
    static func createPublisher<T>(fromResultCompletion completionMethod: @escaping (@escaping ResultCompletion<T>) -> Void) -> AnyPublisher<T, Swift.Error> {
        Deferred {
            Future { promise in
                completionMethod { result in
                    switch result {
                    case let .success(value):
                        promise(.success(value))
                    case let .failure(error):
                        promise(.failure(error))
                    }
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    static func createVoidPublisher() -> AnyPublisher<Void, Swift.Error> {
        createValuePublisher(())
    }
    
    static func createValuePublisher<T>(_ value: T) -> AnyPublisher<T, Swift.Error> {
        Just(value)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    static func createValuePublisher<T>(_ completion: @escaping () throws -> T?) -> AnyPublisher<T, Swift.Error> {
        Deferred {
            Future { promise in
                do {
                    if let value = try completion() {
                        promise(.success(value))
                    } else {
                        let error = NSError(domain: "PublishersValueCompletion", code: -1, userInfo: ["type" : T.self])
                        promise(.failure(error))
                    }
                } catch {
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    static func createVoidPublisher(_ completion: @escaping () throws -> Void) -> AnyPublisher<Void, Swift.Error> {
        Deferred {
            Future { promise in
                do {
                    try completion()
                    promise(.success(()))
                } catch {
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    static func createErrorPublisher<T>(_ error: Error) -> AnyPublisher<T, Swift.Error> {
        Fail(error: error)
            .eraseToAnyPublisher()
    }
    
    static func createErrorPublisher(_ error: Error) -> AnyPublisher<Void, Swift.Error> {
        Fail(error: error)
            .eraseToAnyPublisher()
    }
}
