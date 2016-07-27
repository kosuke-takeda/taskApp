//
//  AppDelegate.swift
//  taskapp
//
//  Created by kohsuke.takeda on 2016/07/16.
//  Copyright © 2016年 kosuke.takeda. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // ユーザーに通知の許可を求める
        let settings = UIUserNotificationSettings(forTypes: [UIUserNotificationType.Alert, UIUserNotificationType.Sound], categories: nil)
        UIApplication.sharedApplication().registerUserNotificationSettings(settings)
        
        //通知からの起動かどうか確認する
        
        if let notification = launchOptions?[UIApplicationLaunchOptionsLocalNotificationKey] as? UILocalNotification {
            //通知領域から削除する
            application.cancelLocalNotification(notification)
        }
        
    
        return true
        
    }

    func applicationWillResignActive(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification) {
        
        //アプリがフォアグランドに居る時に通知が届いた時
        if application.applicationState == UIApplicationState.Active {
            //アラートを表示する
            let alertController = UIAlertController(title: "時間になりました", message:notification.alertBody, preferredStyle: .Alert)
            let defaultAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
            alertController.addAction(defaultAction)
            
            
            window?.rootViewController!.presentViewController(alertController, animated: true, completion: nil)
        } else {
            //バックグラウンドに居る時に通知が届いた時はログに出力するだけ
            print("\(notification.alertBody)")
        }
        
        //通知領域から削除する
        application.cancelLocalNotification(notification)
        
        
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

