//
//  BaseNavigationController.swift
//  BeeAPP
//
//  Created by steam on 2017/2/4.
//  Copyright © 2017年 steam. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        interactivePopGestureRecognizer?.delegate = nil
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: -  createView
    func createBackButton() -> UIButton {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: -10, width: 48 * ScreenUnit, height: 48 * ScreenUnit)
        
        var returnImage = #imageLiteral(resourceName: "v2_goback")
        returnImage = returnImage.withRenderingMode(.alwaysOriginal)
        
        button.setBackgroundImage(returnImage, for: .normal)
        button.addTarget(self, action: #selector(clickedBackButton), for: .touchUpInside)
        button.titleLabel?.isHidden = true
        
        
        return button;
    }
    
    func clickedBackButton()  {
        popViewController(animated: true)
    }
    
    // MARK: -  重写 pushViewController方法
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        
        //不是第一页
        if self.childViewControllers.count > 0 {
            UINavigationBar.appearance().backItem?.hidesBackButton = false
            let item = UIBarButtonItem(customView: createBackButton())
            viewController.navigationItem.leftBarButtonItem = item
            viewController.hidesBottomBarWhenPushed = true
        }
        
        super.pushViewController(viewController, animated: animated)
        
    }
}
