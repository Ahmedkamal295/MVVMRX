//
//  AppDelegate.swift
//  MVVMRX
//
//  Created by Ahmed kamal on 6/15/21.
//

import UIKit
import MOLH
@main
class AppDelegate: UIResponder, UIApplicationDelegate, MOLHResetable {
    
    var window: UIWindow?
  
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        let navigationBar = UINavigationController()
//        if Helper.getaUser_id() != nil {
//
//            let storyboard = UIStoryboard(name: "Home", bundle: nil)
//            let vc  = storyboard.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
//            vc.navigationController?.isNavigationBarHidden = true
//
//            navigationBar.setViewControllers([vc], animated: true)
//            window?.rootViewController = navigationBar
//        } else {
//            let storyboard = UIStoryboard(name: "Login", bundle: nil)
//            let vc  = storyboard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
//            vc.navigationController?.isNavigationBarHidden = true
//
//            navigationBar.setViewControllers([vc], animated: true)
//            window?.rootViewController = navigationBar
//        }
        
        return true
    }
    
 
    //MARK:- reset App function
    func reset() {
        let rootviewcontroller: UIWindow = ((UIApplication.shared.delegate?.window)!)!
        let stry = UIStoryboard(name: "Home", bundle: nil)
        rootviewcontroller.rootViewController = stry.instantiateViewController(withIdentifier: "HomeVC")
    }
}

