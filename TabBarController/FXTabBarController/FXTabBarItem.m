//
//  FXTabBarItme.m
//  TabBarController
//
//  Created by apple on 16/4/27.
//  Copyright © 2016年 LFX. All rights reserved.
//

#import "FXTabBarItem.h"

@implementation FXTabBarItem


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}


/**
 *  复写此方法可以取消高亮状态
 *
 *  @param highlighted 是否高亮
 */
- (void)setHighlighted:(BOOL)highlighted {
//    [super setHighlighted:highlighted];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
