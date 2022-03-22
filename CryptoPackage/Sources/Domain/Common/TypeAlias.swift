import Foundation
import Combine

public typealias ResultCompletion<T> = (Result<T, Error>) -> Void
public typealias DefaultCompletion = () -> Void
