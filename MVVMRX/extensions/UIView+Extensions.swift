//
//  UIView+Extensions.swift
//  MVVMRX
//
//  Created by Ahmed kamal on 6/12/21.
//
import Foundation
import UIKit
@IBDesignable extension UIView {
  
    //MARK:- The color of the shadow. Defaults to opaque black. Colors created
    @IBInspectable var shadowColor: UIColor? {
        set {
            layer.shadowColor = newValue!.cgColor
        }
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            else {
                return nil
            }
        }
    }
    //MARK:- The opacity of the shadow. Defaults to 0. Specifying a value outside the
    @IBInspectable var shadowOpacity: Float {
        set {
            layer.shadowOpacity = newValue
        }
        get {
            return layer.shadowOpacity
        }
    }
    
   //MARK:- The shadow offset. Defaults to (0, -3). Animatable.
    @IBInspectable var shadowOffset: CGPoint {
        set {
            layer.shadowOffset = CGSize(width: newValue.x, height: newValue.y)
        }
        get {
            return CGPoint(x: layer.shadowOffset.width, y:layer.shadowOffset.height)
        }
    }
    
    //MARK:- The blur radius used to create the shadow. Defaults to 3. Animatable.
    @IBInspectable var shadowRadius: CGFloat {
        set {
            layer.shadowRadius = newValue
        }
        get {
            return layer.shadowRadius
        }
    }
    
   //MARK:-  The corner radius of the view
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
   //MARK:- Circle View
    @IBInspectable var isCircle: Bool {
        set {
            layer.cornerRadius = self.frame.size.width / 2
        }
        get {
            return self.isCircle
        }
    }
    
    //MARK:- border Width
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    //MARK:- border Color
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }

}
