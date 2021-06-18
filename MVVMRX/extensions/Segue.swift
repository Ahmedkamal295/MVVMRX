//
//  Segue.swift
//  MVVMRX
//
//  Created by Ahmed kamal on 6/15/21.
//

import Foundation
import UIKit
var window: UIWindow?
extension UIViewController {
   
    //MARK:- push viewController Using
    func goVC<viewController: UIViewController>(viewController: viewController.Type ,storyboard : String){
        
    let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        let vc  = storyboard.instantiateViewController(withIdentifier: String(describing: viewController.self))
        navigationController?.pushViewController(vc, animated: true)

    }
    //MARK:- dismiss viewController Using navigation
    func dismiss()  {
        navigationController?.popViewController(animated: true)
    }
    
}
