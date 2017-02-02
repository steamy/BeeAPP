//
//  CommonPromptView.swift
//  BeeAPP
//
//  Created by steam on 2017/2/2.
//  Copyright © 2017年 steam. All rights reserved.
//

import UIKit

class CommonPromptView: UIView {
    //提示图片
    private    var contentImageView : UIImageView  = {
        let imageView = UIImageView()
        return imageView
    }()
    //提示文字
    private    var contentLabel : UILabel = {
        let label = UILabel()
        return label
    }()
    //交互处理按钮
    private     var setterButton : UIButton = {
        let button = UIButton()
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //设置subview大小
    override func layoutSubviews() {
        contentImageView.frame = CGRect(x: 225 * ScreenUnit, y: 300 * ScreenUnit, width: 300 * ScreenUnit, height: 300 * ScreenUnit);
        
        contentLabel.frame = CGRect(x: 0, y: contentImageView.frame.maxY + 40 * ScreenUnit , width:ScreenWidth , height: 32)
        contentLabel.textColor = BeeTextGrayColor
        contentLabel.font = BeeTextNormalFont
        contentLabel.textAlignment = .center
        
        setterButton.frame = CGRect(x: 225 * ScreenUnit, y: contentLabel.frame.maxY + 33 * ScreenUnit, width: 300 * ScreenUnit, height: 64 * ScreenUnit)
        setterButton.backgroundColor = BeeButtonYellowColor
        setterButton.layer.cornerRadius = 3.0
        setterButton.setTitleColor(UIColor.white, for: .normal)
        setterButton.titleLabel?.font = BeeTextNormalFont
        setterButton.titleLabel?.textAlignment = .center
        
    }
    // MARK: -  createView
    private func createView()  {
        backgroundColor = BeeBackgroudColor
        addSubview(contentImageView)
        addSubview(contentLabel)
        addSubview(setterButton)
    }
    
    
    // MARK: -  public interface
    
    /// 设置内容
    ///
    /// - Parameters:
    ///   - imageName: 图片名称
    ///   - promptText: 提示信息
    ///   - buttonText: button文字
    ///   - action: 点击事件
    ///   - target: 目标上下文
    func setViewContent(imageName : String , promptText : String , buttonText : String ,action : Selector,target : Any!) {
        contentImageView.image = UIImage(named: imageName)
        
        contentLabel.text = promptText
        
        setterButton.setTitle(buttonText, for: .normal)
        setterButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    
}
