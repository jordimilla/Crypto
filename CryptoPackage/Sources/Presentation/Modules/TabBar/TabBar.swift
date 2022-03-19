import UIKit.UINavigationController
import CryptoUIKit

class TabBar: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAppearance()
    }
    
    func createNavController(for rootViewController: UIViewController,
                             title: String,
                             image: UIImage?,
                             selectedImage: UIImage?,
                             identifier: String) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.tabBarItem.selectedImage = selectedImage
        navController.tabBarItem.accessibilityIdentifier = identifier
        return navController
    }
    
    private func setupAppearance() {
        UITabBar.appearance().barTintColor = Color.background.color
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        let lineView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 1))
        lineView.backgroundColor = Color.line.color
        tabBar.tintColor = Color.backgroundButton.color
        tabBar.isTranslucent = false
        tabBar.addSubview(lineView)
    }
}
