import Foundation
import UIKit
import Domain

public class WalletsAssembly {
    
    let data: Collection
    
    public init(data: Collection) {
        self.data = data
    }
    
    public func build() -> UIViewController {
        WalletsViewController(viewModel: makeViewModel())
    }
}

extension WalletsAssembly {

    private func makeViewModel() -> WalletsViewModel {
        WalletsViewModel(data: data)
    }
    
}
