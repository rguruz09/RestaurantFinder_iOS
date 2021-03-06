//
//  AppDelegate.swift
//  MyRestaurantFinderIOS
//
//  Created by Savani Vishnoi on 5/21/16.
//  Copyright © 2016 Savani Vishnoi. All rights reserved.
//
import GoogleMaps
import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  //  var window: UIWindow?
    var window: UIWindow? = UIWindow(frame: UIScreen.mainScreen().bounds)


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
//        let viewController = TableViewController()
//        viewController.dataProvider = SearchDetailsDataProvider()
//        window!.rootViewController = viewController
//        window!.makeKeyAndVisible();
        
        window?.rootViewController = TableViewController();
        window!.makeKeyAndVisible();
        
        window!.rootViewController = ViewController()
        window!.makeKeyAndVisible()
        GMSServices.provideAPIKey("AIzaSyD66jS3qwC-mhAwK6cvYqSM9_NchiYTKhA")
        var nav1 = UINavigationController()
        var first = ViewController(nibName: nil, bundle: nil)
        nav1.viewControllers = [first]
        
        var second = SearchViewController(nibName: nil, bundle: nil)
        var nav2 = UINavigationController()
        nav2.viewControllers = [second]
        let tabs = UITabBarController()
        
        let firstImage = UIImage(named: "one.png")
        let secondImage = UIImage(named: "pizza bar icon")
        nav1.tabBarItem = UITabBarItem(
            title: "Search",
            image: firstImage,
            tag: 1)
        nav2.tabBarItem = UITabBarItem(
            title: "Favorites",
            image: secondImage,
            tag:2)
        tabs.viewControllers = [nav1, nav2]
        
        self.window!.rootViewController = tabs;
        self.window?.makeKeyAndVisible();
       //  Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

