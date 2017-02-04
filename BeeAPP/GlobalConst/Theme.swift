//
//  Theme.swift
//  BeeAPP
//
//  Created by steam on 2017/2/2.
//  Copyright © 2017年 steam. All rights reserved.
//

import Foundation
import UIKit

// MARK: - 屏幕尺寸

public let ScreenWidth : CGFloat = UIScreen.main.bounds.size.width
public let ScreenHeight : CGFloat = UIScreen.main.bounds.size.height
public let ScreenBounds : CGRect = UIScreen.main.bounds

public let ScreenUnit : CGFloat = ScreenWidth / 750

// MARK: - 系统颜色
//背景颜色
public let BeeBackgroudColor : UIColor = UIColor.colorWithRGB(rgbColor: 0xffffff)

//文字色
public let BeeTextGrayColor : UIColor = UIColor.colorWithRGB(rgbColor: 0xb2b2b2)
public let BeeTextBlackColor : UIColor = UIColor.colorWithRGB(rgbColor: 0x262626)
//button颜色
public let BeeButtonYellowColor : UIColor = UIColor.colorWithRGB(rgbColor: 0xffd800)

//导航字体颜色
public let BeeNavigationTitleColor : UIColor = UIColor.colorWithRGB(rgbColor: 0x262626)

// MARK: - 系统字体大小

//通用
public let BeeTextLargeFont : UIFont = UIFont.systemFont(ofSize: 36 * ScreenUnit)
public let BeeTextNormalFont : UIFont = UIFont.systemFont(ofSize: 30 * ScreenUnit)
public let BeeTextSmallFont : UIFont = UIFont.systemFont(ofSize: 24 * ScreenUnit)

//navigation --titlefont
public let BeeNavigationTitleFont : UIFont = UIFont.systemFont(ofSize: 33 * ScreenUnit)

