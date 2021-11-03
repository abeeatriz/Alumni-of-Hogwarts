import UIKit
import Kingfisher
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = UIWindow(frame:  UIScreen.main.bounds)
        

        print("Tamanho: \(UIScreen.main.bounds)")
        let api = API()
        self.window?.rootViewController = UINavigationController(rootViewController: ViewController(api: api))
        self.window?.makeKeyAndVisible()
        
        return true
    }

}
