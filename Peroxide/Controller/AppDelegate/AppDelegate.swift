//
//  AppDelegate.swift
//  Peroxide
//
//  Created by Harish on 30/05/18.
//  Copyright © 2018 Harish. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    public var objRevealViewController = SWRevealViewController()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        if UserDefaultsManager.methodForFetchBooleanValue(kIsLoggedIn) as Bool{
            
            
                        self.methodForLogout()
            
            
            //  Converted with Swiftify v1.0.6176 - https://objectivec2swift.com/
            //self.methodForLogin()
            
        }else{
            
            
            
            
            //self.methodForLogout()
                        self.methodForLogin()
        }
        return true
    }
    func methodForLogin() {
        
         self.methodForUserLogin()
    }

    func methodForUserLogin(){
        let storyboard = UIStoryboard(name: kMain, bundle: nil)
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let rearViewController = storyboard.instantiateViewController(withIdentifier: "UserSliderViewController") as? UserSliderViewController
        let frontViewControllerHome = storyboard.instantiateViewController(withIdentifier: "UserDashboardViewController") as? UserDashboardViewController
        
        let frontNavigationControllerHome = UINavigationController(rootViewController: frontViewControllerHome!)
        let rearNavigationController = UINavigationController(rootViewController: rearViewController!)
        rearNavigationController.isNavigationBarHidden = true
        
        let revealController = SWRevealViewController(rearViewController: rearNavigationController, frontViewController: frontNavigationControllerHome)
        
        self.objRevealViewController = revealController!
        self.window?.backgroundColor = UIColor.white
        self.window?.rootViewController = self.objRevealViewController
        self.window?.makeKeyAndVisible()
    }
    func methodForLogout() {
        
        let storyboard = UIStoryboard(name: kMain, bundle: nil)
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let objViewController = storyboard.instantiateViewController(withIdentifier: kViewController) as? ViewController
        let loginNav = UINavigationController(rootViewController: objViewController!)
        self.window?.backgroundColor = UIColor.white
        self.window?.rootViewController = loginNav
        self.window?.makeKeyAndVisible()
        
    }
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

