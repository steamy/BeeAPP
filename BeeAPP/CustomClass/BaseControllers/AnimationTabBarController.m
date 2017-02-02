//
//  AnimotionTabBarController.m
//  LikeBeeOC
//
//  Created by steam on 16/7/13.
//  Copyright © 2016年 steam. All rights reserved.
//

#import "AnimationTabBarController.h"

/**
 *      屏幕尺寸
 */
#define KScreenBounds [UIScreen mainScreen].bounds
#define kScreenWidth [UIScreen mainScreen].bounds.size.width//屏幕宽度
#define kScreenHeight [UIScreen mainScreen].bounds.size.height//屏幕高度
#define KScreenUnit ([UIScreen mainScreen].bounds.size.width)/750//屏幕单位


@interface AnimationTabBarController ()

@end

@implementation AnimationTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.iconsView = [[NSMutableArray alloc] init];
    self.iconsSelectedImageName = [[NSMutableArray alloc] init];
    self.iconsImageName = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

/**
 *  创建item字典
 *
 *  @return 字典（container（index） + UIView）
 */
-(NSDictionary *)createViewContainers{
    NSMutableDictionary * containersDict = [[NSMutableDictionary alloc] init];
    
    if (!self.tabBar.items) {
        return containersDict;
    }
    
    for (int  i = 0 ; i < self.tabBar.items.count; i ++) {
        UIView * viewContainer = [self createViewContainer:i];
        containersDict[[NSString stringWithFormat:@"container%d",i]] = viewContainer;
    }
    
    return  containersDict;
}

/**
 *  创建view作为item的容器
 */
-(UIView *) createViewContainer:(int) index{
    CGFloat viewWidth = kScreenWidth / (CGFloat) (self.tabBar.items.count);
    CGFloat viewHeight = self.tabBar.bounds.size.height;
    
    UIView * viewContainer = [[UIView alloc] initWithFrame:CGRectMake(index * viewWidth, 0, viewWidth, viewHeight)];
    
    viewContainer.backgroundColor = [UIColor clearColor];
    viewContainer.userInteractionEnabled  = YES;
    
    [self.tabBar addSubview:viewContainer];
    viewContainer.tag = index;
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(itemClick:)];
    [viewContainer addGestureRecognizer:tap];
    
    return viewContainer;
}
/**
 *  创建item的内容 图标加文字的师徒
 *
 *  @param containers item的容器字典
 */
-(void)createCustomIcons:(NSDictionary *)containers{
    
    if (self.tabBar.items)
    {
        int index = 0;
        for (UITabBarItem * item in self.tabBar.items)
        {
            if (!item.image)
            {
                return;
            }
            UIView * container = (UIView *) containers[[NSString stringWithFormat:@"container%d",index]];
            if (containers)
            {
                container.tag = index;
                
                CGFloat imageW = 42 * KScreenUnit;
                CGFloat imageX = (kScreenWidth / self.tabBar.items.count - imageW  ) *0.5;
                CGFloat imageY = 16 * KScreenUnit;
                CGFloat imageH = 42 * KScreenUnit;
                
                UIImageView * icon = [[ UIImageView alloc] init];
                icon.frame = CGRectMake(imageX, imageY, imageW, imageH);
                icon.image  = item.image;
                icon.tintColor = [UIColor clearColor];
                [container addSubview:icon];
                
                UILabel * textLabel = [[UILabel alloc] init];
                textLabel.frame = CGRectMake(0, 64 * KScreenUnit,kScreenWidth / self.tabBar.items.count  , 17 * KScreenUnit);
                textLabel.backgroundColor = [UIColor clearColor];
                textLabel.text = item.title;
                textLabel.font = [UIFont systemFontOfSize:20 *KScreenUnit];
                textLabel.textColor = [UIColor grayColor    ];
                textLabel.textAlignment = NSTextAlignmentCenter;
                [container addSubview:textLabel];
                
                IconContain * itemClass = [[IconContain alloc] init];
                itemClass.icon  = icon;
                itemClass.textLabel = textLabel;
                [self.iconsView addObject:itemClass];
                
                item.image = nil;
                item.title = @"";

                if (index == 0) {
                    self.selectedIndex = 0;
#pragma mark -- 选中
                    [self selectIem:0];
                }
                                index++;
            }
            
        }
    }
    
}
/**
 *  item的点击事件
 */
-(void)itemClick:(UIGestureRecognizer *) reco{
    
}


#pragma mark -- 父类方法
-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    [self setSelectedIndexFrom:(int)self.selectedIndex to:(int)item.tag];
}

-(void) selectIem:(int)index{
    IconContain * iconContain = self.iconsView[index];
    UIImageView * selectIcon = iconContain.icon;
    selectIcon.image = [UIImage imageNamed:self.iconsSelectedImageName[index]];
    AnimationTabBarItem * item = (AnimationTabBarItem *) self.tabBar.items[index];
    [item.animation selectStateWithIcon:selectIcon textLabel:iconContain.textLabel];
}

-(void)setSelectedIndexFrom:(int)from to:(int)to{
    self.selectedIndex = to;
    AnimationTabBarItem * item = (AnimationTabBarItem *) self.tabBar.items[from];
    AnimationTabBarItem * toItem = (AnimationTabBarItem *)self.tabBar.items[to];
    
    IconContain * fromContain = self.iconsView[from];
    UIImageView * fromIcon = fromContain.icon;
    fromIcon.image = [UIImage imageNamed:self.iconsImageName[from]];
    
    [item.animation deselectAnimationWithIcon:fromIcon textLabel:fromContain.textLabel defaultTextColor:[UIColor grayColor]];
    
    IconContain * toContain = self.iconsView[to];
    UIImageView * toIcon = toContain.icon;
    toIcon.image  = [UIImage imageNamed:self.iconsSelectedImageName[to]];
    [toItem.animation playAnimationWithIcon:toIcon textLabel:toContain.textLabel];
    
}


@end

/**
 *动画基类
 */
#pragma mark -- 动画基类
@implementation ItemAnimation

-(void)playAnimationWithIcon:(UIImageView *)icon textLabel:(UILabel *)textLabel{

}

-(void)deselectAnimationWithIcon:(UIImageView *)icon textLabel:(UILabel *)textLabel defaultTextColor:(UIColor *)defaultTextColor{

}

-(void)selectStateWithIcon:(UIImageView *)icon textLabel:(UILabel *)textLabel{
    
}
@end

/**
 *  弹跳动画
 */
#pragma mark -- 弹跳动画


@implementation BounceAnimation


-(void)playAnimationWithIcon:(UIImageView *)icon textLabel:(UILabel *)textLabel{
    [self playBounceAnimation:icon];
    textLabel.textColor = self.textSelectedColor;
}
-(void)deselectAnimationWithIcon:(UIImageView *)icon textLabel:(UILabel *)textLabel defaultTextColor:(UIColor *)defaultTextColor{
    textLabel.textColor = defaultTextColor;
    
    if (icon.image) {
        UIImage* renderImage = [icon.image imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
        icon.image = renderImage;
        icon.tintColor = defaultTextColor;
    }
}
-(void)selectStateWithIcon:(UIImageView *)icon textLabel:(UILabel *)textLabel{
    textLabel.textColor = self.textSelectedColor;
    
    if (icon.image) {
        UIImage* renderImage = [icon.image imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
        icon.image = renderImage;
        icon.tintColor = self.textSelectedColor;
    }
}

-(void) playBounceAnimation:(UIImageView *)icon{
    CAKeyframeAnimation * bounceAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    bounceAnimation.values = @[@(1.0) ,@(1.4) , @(0.9) , @(1.15) , @(0.95) ,  @(1.02),  @(1.0)];
    bounceAnimation.duration = self.duration;
    bounceAnimation.calculationMode = kCAAnimationCubic;
    [icon.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
    
    if (icon.image) {
        UIImage* renderImage = [icon.image imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
        icon.image = renderImage;
        icon.tintColor = self.textSelectedColor;
    }
}
@end



/**
 *  带有动画的tabbaritem
 */
#pragma mark -- 带有动画的tabbaritem


@implementation AnimationTabBarItem

-(void)playAnimation:(UIImageView *) icon textLabel:(UILabel *)textLabel{
    if (self.animation) {
        [self.animation playAnimationWithIcon:icon textLabel:textLabel];
    }
}

-(void) deselectAnimation:(UIImageView *)icon textLabel:(UILabel *)textLabel{
    [self.animation deselectAnimationWithIcon:icon textLabel:textLabel defaultTextColor:self.textColor];
}
-(void)selectedState:(UIImageView *) icon textLabel:(UILabel *) textLabel{
    [self.animation selectStateWithIcon:icon textLabel:textLabel];
}

@end


#pragma mark -- IconContain


@implementation IconContain



@end
