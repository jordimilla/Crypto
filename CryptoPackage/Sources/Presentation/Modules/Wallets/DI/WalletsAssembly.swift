import Foundation
import UIKit
import Domain

public class WalletsAssembly {
    
    let useCase: GetCollectionUseCase
    
    public init(useCase: GetCollectionUseCase) {
        self.useCase = useCase
    }
    
    public func build() -> UIViewController {
        WalletsViewController(viewModel: makeViewModel())
    }
}

extension WalletsAssembly {

    private func makeViewModel() -> WalletsViewModel {
        WalletsViewModel(getCollectionUseCase: useCase)
    }
    
}
