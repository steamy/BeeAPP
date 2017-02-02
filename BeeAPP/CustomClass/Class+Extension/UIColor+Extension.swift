//
//  UIColor+Extension.swift
//  BeeAPP
//
//  Created by steam on 2017/2/2.
//  Copyright © 2017年 steam. All rights reserved.
//

import UIKit
import Foundation

extension UIColor {
    
    
    ///
    ///
    /// - Parameters:
    ///   - red: r
    ///   - green: g
    ///   - blue: b
    /// - Returns: uicolor
    class func colorWithCustom(red : CGFloat,green : CGFloat, blue : CGFloat) -> UIColor {
        return UIColor.init(red: red / 255.0, green: green / 255.0 , blue: blue / 255.0, alpha: 1)
    }
    
    ///
    ///
    /// - Parameters:
    ///   - rgbColor:
    ///   - alpha:
    /// - Returns:
    class func colorWithRGB(rgbColor : Int, alpha : CGFloat = 1) -> UIColor {
        return UIColor.init(red:((CGFloat)((rgbColor & 0xFF0000)>>16))/255.0 ,green:((CGFloat)((rgbColor & 0xFF00)>>8))/255.0 ,blue:((CGFloat)(rgbColor & 0xFF))/255.0, alpha : alpha)
    }
    
    class func colorWithHex(hex: String, alpha: CGFloat = 1.0) -> UIColor {
        var rgb: CUnsignedInt = 0;
        let scanner = Scanner.init(string: hex)
        
        if hex.hasPrefix("#") {
            // skip '#' character
            scanner.scanLocation = 1
        }
        scanner.scanHexInt32(&rgb)
        
        let r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((rgb & 0xFF00) >> 8) / 255.0
        let b = CGFloat(rgb & 0xFF) / 255.0
        
        return UIColor(red: r, green: g, blue: b, alpha: alpha)
    }
    
}
