//
//  FXTabBar.h
//  TabBarController
//
//  Created by apple on 16/4/27.
//  Copyright © 2016年 LFX. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FXTabBar;

@protocol FXTabBarDelegate <NSObject>

- (void)tabBar:(FXTabBar *)tabBar fromViewController:(NSInteger)formVC toViewController:(NSInteger)toVC;

@end

@interface FXTabBar : UIView

//代理
@property (weak, nonatomic) id<FXTabBarDelegate>  delegate;


/**
 *  添加按钮
 *
 *  @param imageName       图片名称
 *  @param selectImageName 选中图片名称
 */
- (void)addTabBarItmeWithNomalImageName:(NSString *)imageName selcetedImageName:(NSString *)selectImageName;

@end
