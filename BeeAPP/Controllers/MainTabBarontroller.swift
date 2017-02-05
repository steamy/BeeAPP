//
//  MainTabBarontroller.swift
//  BeeAPP
//
//  Created by steam on 2017/2/4.
//  Copyright © 2017年 steam. All rights reserved.
//

import UIKit



fileprivate var isFirstApperance : Bool = true


class MainTabBarontroller: AnimationTabBarController {
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        createView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if isFirstApperance {
            let containers = createViewContainers()
            createCustomIcons(containers)
            isFirstApperance = false
        }
    }
    
    // MARK: -  createView
    
    func createView()  {
        addChildViewController(childController: BaseViewController(), title: "首页", imageName: "v2_home", tag: 0)
        addChildViewController(childController: BaseViewController(), title: "闪送超市", imageName: "v2_order", tag: 1)
        addChildViewController(childController: BaseViewController(), title: "购物车", imageName: "shopCart", tag: 2)
        addChildViewController(childController: LoginViewController(), title: "我的", imageName: "v2_my", tag: 3)
        
    }
    
    private func addChildViewController(childController : UIViewController!,title : String!,imageName : String!,tag : Int!) {
        let item = AnimationTabBarItem(title: title, image: UIImage.init(named: imageName), selectedImage: UIImage(named: imageName+"_selected"))
        
        iconsImageName.add(imageName)
        iconsSelectedImageName.add(imageName+"_selected")
        
        item.tag = tag
        
        item.animation = BounceAnimation()
        item.animation.textSelectedColor = UIColor.gray
        childController.tabBarItem = item
        
        let baseNav = BaseNavigationController(rootViewController: childController)
        addChildViewController(baseNav)
    }
    

  

}
