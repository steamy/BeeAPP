//
//  UIButton+Extension.swift
//  BeeAPP
//
//  Created by steam on 2017/2/5.
//  Copyright © 2017年 steam. All rights reserved.
//

import Foundation
import UIKit

extension UIButton{
    class func createBackButton() -> UIButton{
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 40)
        
        button.setImage(#imageLiteral(resourceName: "v2_goback").withRenderingMode(.alwaysOriginal), for: .normal)
        
        return button
    }
}
