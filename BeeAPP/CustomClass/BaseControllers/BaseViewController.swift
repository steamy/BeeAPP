//
//  BaseViewController.swift
//  BeeAPP
//
//  Created by steam on 2017/2/2.
//  Copyright © 2017年 steam. All rights reserved.
//

import UIKit

enum ErrorType {
    case InternetUnavailable
    case LocationUnavailable
    case NotLoginIn
}

class BaseViewController: UIViewController {
    
    lazy var  promptView : CommonPromptView = {
        let view = CommonPromptView(frame: ScreenBounds)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //设置背景颜色
        view.backgroundColor = BeeBackgroudColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - 通用方法
    
    /// 设置title
    ///
    /// - Parameter title: 标题
    func setTitle( title : String) {
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 120, height: 40))
        titleLabel.font = BeeNavigationTitleFont
        titleLabel.textColor = BeeNavigationTitleColor
        titleLabel.text = title
        titleLabel.textAlignment = .center
        navigationItem.titleView = titleLabel
    }
    
    /// 设置右边的item
    ///
    /// - Parameters:
    ///   - title: 文字item
    ///   - imageName: 图片
    ///   - selectImageName: 图片
    ///   - action: 点击事件
    func setRightItem(title : String?,imageName : String?,selectedImageName : String?,action : Selector) {
        let rigthButton = UIButton(type: .custom)
        rigthButton.frame = CGRect(x: 0, y: 0, width: 45, height: 35)
        
        
        //设置图片
        if imageName != nil{
            var normalImage = UIImage(named: imageName!)
            normalImage = normalImage?.withRenderingMode(.alwaysOriginal)
            rigthButton.setImage(normalImage, for: .normal)
            rigthButton.imageEdgeInsets = UIEdgeInsetsMake(3, 3, 0, -20)
            
            //选中效果
            if selectedImageName != nil {
                var selectedImage = UIImage(named: selectedImageName!)
                selectedImage = selectedImage?.withRenderingMode(.alwaysOriginal)
                rigthButton .setImage(selectedImage, for: .highlighted)
            }
        }
        
        //设置文字
        if title != nil {
            rigthButton.setTitle(title, for: .normal)
            rigthButton.setTitleColor(BeeTextBlackColor, for: .normal)
            rigthButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        }
        
        //点击事件
        rigthButton.addTarget(self, action: action, for: .touchUpInside)
        
        let rightItem = UIBarButtonItem(customView: rigthButton)
        navigationItem.rightBarButtonItem = rightItem
    }
    
    /// 显示异常
    ///
    /// - Parameters:
    ///   - type: 异常类型
    ///   - setter: 点击事件
    func showErrorView(type : ErrorType, setter : Selector) {
        if type == .InternetUnavailable {
            //网络不可用
            promptView.setViewContent(imageName: "v2_connnect_error", promptText: "当前网络不可用，请稍后重试", buttonText: "点击重试", action: setter, target: self)
        }else if type == .LocationUnavailable{
            //定位不可用
            promptView.setViewContent(imageName: "v2_connnect_error", promptText: "当前网络不可用，请稍后重试", buttonText: "点击重试", action: setter, target: self)
        }else if type == .NotLoginIn   {
            promptView.setViewContent(imageName: "v2_connnect_error", promptText: "登录后查看购物车、收藏记录", buttonText: "登录", action: setter, target: self)
        }
        
        view.addSubview(promptView)
    }
    
    /// 将异常界面移除
    func removePromptView() {
        promptView.removeFromSuperview()
    }
    

}
