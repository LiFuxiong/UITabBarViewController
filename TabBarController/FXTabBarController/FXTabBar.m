//
//  FXTabBar.m
//  TabBarController
//
//  Created by apple on 16/4/27.
//  Copyright © 2016年 LFX. All rights reserved.
//

#import "FXTabBar.h"
#import "FXTabBarItem.h"

@interface FXTabBar ()

@property (strong, nonatomic) FXTabBarItem  *selectedItem; //选中标签按钮

@end

@implementation FXTabBar

/**
 *  添加按钮
 *
 */
- (void)addTabBarItmeWithNomalImageName:(NSString *)imageName selcetedImageName:(NSString *)selectImageName {
    FXTabBarItem *itme = [FXTabBarItem buttonWithType:UIButtonTypeCustom];
    
    // 设置图片
    [itme setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [itme setImage:[UIImage imageNamed:selectImageName] forState:UIControlStateSelected];
    
    [self addSubview:itme];
    
    // 添加点击事件
    [itme addTarget:self action:@selector(tabBarItemAction:) forControlEvents:UIControlEventTouchUpInside];
    if (self.subviews.count == 1) {
        [self tabBarItemAction:itme];
    }
}


#pragma mark
#pragma mark -- 按钮点击事件
- (void)tabBarItemAction:(FXTabBarItem *)item {
    if ([self.delegate respondsToSelector:@selector(tabBar:fromViewController:toViewController:)]) {
        [self.delegate tabBar:self fromViewController:self.selectedItem.tag toViewController:item.tag];
    }
    
    //清除之前选中的按钮状态
    self.selectedItem.selected = NO;
    
    //记录选中按钮
    self.selectedItem = item;
    
    //让按钮选中
    self.selectedItem.selected = YES;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    
    NSInteger count = self.subviews.count;
    for (NSInteger i = 0; i < count; i ++) {
        FXTabBarItem *item = self.subviews[i];
        item.tag = i;
        
        CGFloat itemH = self.frame.size.height;;
        CGFloat itmeW = self.frame.size.width / count;
        CGFloat itmeX = i * itmeW;
        CGFloat itmeY = 0;
        item.frame = CGRectMake(itmeX, itmeY, itmeW, itemH);
    }
}

@end
