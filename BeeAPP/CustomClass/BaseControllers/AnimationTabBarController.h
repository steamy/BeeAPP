//
//  AnimationTabBarController.h
//  LikeBeeOC
//
//  Created by steam on 16/7/13.
//  Copyright © 2016年 steam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
/**
 *  点击item有动画效果的TabBarController
 *
 *
 *
 *
 *
 *
 *
 *
 *
 */
@interface AnimationTabBarController : UITabBarController
//容器键值对 item容器序号：容器VIew
@property(nonatomic ,strong) NSMutableArray * iconsView;
//item的图标的名字数组
@property(nonatomic ,strong) NSMutableArray * iconsImageName;
//选中图标的名字数组
@property(nonatomic ,strong) NSMutableArray * iconsSelectedImageName;

/**
 *  创建item字典
 *
 *  @return 字典（container（index） + UIView）
 *   item 的序号、容器
 */
-(NSDictionary *)createViewContainers;
/**
 *  创建item的内容 图标加文字的师徒
 *
 *  @param containers item的容器字典
 */
-(void)createCustomIcons:(NSDictionary *)containers;

@end

/**
 *  item的动画接口
 *
 */
#pragma mark --  item的动画接口
@protocol ItemAnimationProtocol <NSObject>

//选中动画
-(void)playAnimationWithIcon:(UIImageView *)icon textLabel: (UILabel *  )textLabel;
//取消选取的动画
-(void)deselectAnimationWithIcon:(UIImageView *)icon textLabel: (UILabel *  )textLabel defaultTextColor:(UIColor *)defaultTextColor;
//处于选中状态
-(void)selectStateWithIcon:(UIImageView *)icon textLabel: (UILabel *  )textLabel;

@end

/**
 *动画基类
 */
#pragma mark -- 动画基类
@interface  ItemAnimation : NSObject <ItemAnimationProtocol>
//动画时间
@property(nonatomic ,assign) CGFloat duration;
//文本选中颜色
@property(nonatomic ,strong) UIColor * textSelectedColor;
//图片选中颜色
@property(nonatomic ,strong) UIColor * iconSelectedColor;

@end

/**
 *  弹跳动画
 */
#pragma mark -- 弹跳动画
@interface BounceAnimation : ItemAnimation

@end

/**
 *  带有动画的tabbaritem
 */
#pragma mark -- 带有动画的tabbaritem

@interface  AnimationTabBarItem : UITabBarItem
//动画
@property(nonatomic ,strong) ItemAnimation * animation;
//文字颜色
@property(nonatomic ,strong) UIColor * textColor;
@end

#pragma mark -- item类


@interface IconContain : NSObject

@property(nonatomic,strong) UIImageView * icon;
@property(nonatomic ,strong) UILabel * textLabel;

@end

