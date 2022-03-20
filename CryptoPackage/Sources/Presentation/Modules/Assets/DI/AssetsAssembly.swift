import Foundation
import UIKit
import Domain

public class AssetsAssembly {
    
    let data: Collection
    
    public init(data: Collection) {
        self.data = data
    }
    
    public func build() -> UIViewController {
        AssestsViewController(viewModel: makeViewModel())
    }
}

extension AssetsAssembly {

    private func makeViewModel() -> AssetsViewModel {
        AssetsViewModel(data: data)
    }
    
}
