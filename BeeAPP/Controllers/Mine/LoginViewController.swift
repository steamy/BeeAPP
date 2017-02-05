//
//  LoginViewController.swift
//  BeeAPP
//
//  Created by steam on 2017/2/5.
//  Copyright © 2017年 steam. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {
    
    @IBOutlet weak var phoneTextFiedl: UITextField!
    @IBOutlet weak var codeTextField: UITextField!
    @IBOutlet weak var getCodeButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        createView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: -  createView
    private func createView(){
        //标题/
        setTitle(title: "登录")
        
        //leftItem 退出
        let button = UIButton.createBackButton()
        button.addTarget(self, action: #selector(backToRootViewController), for: .touchUpInside)
        //rightItem 注册
        setRightItem(title: "注册", normalImage: nil, selectedImage: nil, action: #selector(pushToRegistViewController))
        
        //输入监听
        phoneTextFiedl.addTarget(self, action:#selector(textFieldDidChanged(textFile:)) , for: .editingChanged )
        codeTextField.addTarget(self, action:#selector(textFieldDidChanged(textFile:)) , for: .editingChanged )
        
        //点击事件
        loginButton.addTarget(self, action: #selector(loginBee), for: .touchUpInside)
        getCodeButton.addTarget(self, action: #selector(getCode), for: .touchUpInside)
        
    }
    
    // MARK: - 点击事件
    
    //退出按钮
    @objc private func backToRootViewController()  {
        dismiss(animated: true, completion: nil)
    }
    //注册
    @objc private func pushToRegistViewController()  {
        
    }
    //登录
     func loginBee()  {
        
    }
    //获取验证码
     func getCode()  {
        
    }
    
    // MARK: - 输入监听
    func textFieldDidChanged(textFile : UITextField)  {
        if (phoneTextFiedl.text?.isEmpty)! || (codeTextField.text?.isEmpty)!  {
            loginButton.backgroundColor = BeeButtonGrayColor
            loginButton.setTitleColor(UIColor.flatBlack, for: .normal)
            loginButton.isEnabled = false
        }else{
            loginButton.backgroundColor = BeeButtonYellowColor
            loginButton.setTitleColor(UIColor.white, for: .normal)
            loginButton.isEnabled = true
        }
    }
    

}

