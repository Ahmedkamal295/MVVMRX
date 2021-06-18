//
//  UIViewController + Extension.swift
//  MVVMRX
//
//  Created by Ahmed kamal on 6/15/21.
//
import Foundation
import UIKit
import MBProgressHUD
import Kingfisher
import MOLH
extension UIViewController {
    
    // MARK:- custom showIndicator loading
    func showIndicator() {
        let indicator = MBProgressHUD.showAdded(to: self.view, animated: true)
        indicator.isUserInteractionEnabled = false
        indicator.detailsLabel.text = ""
        indicator.show(animated: true)
        self.view.isUserInteractionEnabled = false
        if MOLHLanguage.currentAppleLanguage() == "en" {
            indicator.label.text = "loading"
        } else {
            indicator.label.text = "تحميل"
        }
    }
    // MARK:- custom hideIndicator loading
    func hideIndicator() {
        MBProgressHUD.hide(for: self.view, animated: true)
        self.view.isUserInteractionEnabled = true
    }
    // MARK:- validation UIAlert
    func createSkipAlert(alertTite: String, alertMessage: String) {
        let alert = UIAlertController(title: alertTite, message: alertMessage, preferredStyle: .alert)
        let okAlertButton = UIAlertAction(title: "ok", style: .default, handler: nil)
        alert.view.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        alert.addAction(okAlertButton)
        present(alert, animated: true, completion: nil)
        
    }
}

// MARK:- load image function using kingfisher
extension UIImageView{
    func loadImage(_ url : URL?) {
        
        self.kf.setImage(
            with: url,
            placeholder: UIImage(named: "user"),
            options: [.scaleFactor(UIScreen.main.scale),.transition(.fade(1)),.cacheOriginalImage])
            self.kf.indicatorType = .activity
     }
  }
