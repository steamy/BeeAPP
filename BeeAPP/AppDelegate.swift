//
//  AppDelegate.swift
//  BeeAPP
//
//  Created by steam on 2017/2/2.
//  Copyright © 2017年 steam. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow.init(frame:ScreenBounds )
        window?.makeKeyAndVisible()
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {

    }

    func applicationDidEnterBackground(_ application: UIApplication) {

    }

    func applicationWillEnterForeground(_ application: UIApplication) {

    }

    func applicationDidBecomeActive(_ application: UIApplication) {

    }

    func applicationWillTerminate(_ application: UIApplication) {

    }
    
    // MARK: - 设置启动后的第一页
    func setRootViewController() {
        if !UserDefaults.standard.bool(forKey:UserDefault_IsFirstStart ) {
            //第一次启动加载导航控制器
            UserDefaults.standard.set(true, forKey: UserDefault_IsFirstStart)
            
        }else{
            //加载主控制页
        }
    }


}

