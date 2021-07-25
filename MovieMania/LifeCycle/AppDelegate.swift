//
//  AppDelegate.swift
//  MovieMania
//
//  Created by Ahmad Ubaidillah on 10/07/21.
//

import UIKit
import RealmSwift

//@main
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let configuration = Realm.Configuration(
            schemaVersion: 1
        )
        
        Realm.Configuration.defaultConfiguration = configuration
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        URLCache.shared.removeAllCachedResponses()
        
        return true
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        
    }
}

