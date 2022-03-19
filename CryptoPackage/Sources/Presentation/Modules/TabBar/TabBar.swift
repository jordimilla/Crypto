import UIKit.UINavigationController

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
        UITabBar.appearance().barTintColor = .white
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        let lineView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 1))
        lineView.backgroundColor = .gray
        tabBar.tintColor = .black
        tabBar.isTranslucent = false
        tabBar.addSubview(lineView)
    }
}
