import Foundation
import UIKit
import Domain

public class AssetsAssembly {
    
    let useCase: GetCollectionUseCase
    
    public init(useCase: GetCollectionUseCase) {
        self.useCase = useCase
    }
    
    public func build() -> UIViewController {
        AssestsViewController(viewModel: makeViewModel())
    }
}

extension AssetsAssembly {

    private func makeViewModel() -> AssetsViewModel {
        AssetsViewModel(getCollectionUseCase: useCase)
    }
    
}
