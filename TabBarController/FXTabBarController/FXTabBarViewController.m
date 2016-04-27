//
//  FXTabBarViewController.m
//  TabBarController
//
//  Created by apple on 16/4/27.
//  Copyright © 2016年 LFX. All rights reserved.
//

#import "FXTabBarViewController.h"

#import "BaseNavigationController.h"
#import "FristViewController.h"
#import "SecondViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"

#import "FXTabBar.h"

@interface FXTabBarViewController ()<FXTabBarDelegate>


@property (strong, nonatomic) NSMutableArray *arrayControllers;
@end

@implementation FXTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 添加子控制器
    [self addUpChildViewController];
    
    // 添加标签按钮
    [self addTabBarItme];
}


/**
 *  添加子控制器
 */
- (void)addUpChildViewController {
    FristViewController *fristVC = [[FristViewController alloc] init];
    fristVC.view.backgroundColor = [UIColor redColor];
    fristVC.title = @"页面一";
    [self setNavgationControllWithViewController:fristVC];
    
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    secondVC.view.backgroundColor = [UIColor orangeColor];
    secondVC.title = @"页面二";
    [self setNavgationControllWithViewController:secondVC];
    
    ThreeViewController *threeVC = [[ThreeViewController alloc] init];
    threeVC.view.backgroundColor = [UIColor purpleColor];
    threeVC.title = @"页面三";
    [self setNavgationControllWithViewController:threeVC];
    
    FourViewController *fourVC = [[FourViewController alloc] init];
    fourVC.view.backgroundColor = [UIColor greenColor];
    fourVC.title = @"页面四";
    [self setNavgationControllWithViewController:fourVC];
    
    self.viewControllers = self.arrayControllers;
    
}


- (void)setNavgationControllWithViewController:(UIViewController *)viewController {
    //将控制器添加到导航控制器中去
    BaseNavigationController *baseNav = [[BaseNavigationController alloc] initWithRootViewController:viewController];
    [self.arrayControllers addObject:baseNav];
    
}


/**
 *  添加标签按钮
 */
- (void)addTabBarItme {
    FXTabBar *tabBar = [[FXTabBar alloc] init];
    tabBar.frame = self.tabBar.bounds;
    tabBar.backgroundColor = [UIColor whiteColor];
    tabBar.delegate = self;
    [self.tabBar addSubview:tabBar];
    
    
    // 2.添加对应个数的按钮
    NSInteger count = self.arrayControllers.count;
    for (int i = 0; i < count; i ++) {
        NSString *name = [NSString stringWithFormat:@"tabbar%d", i + 1];
        //        NSString *name = @"1080x1920通用-客服";
        NSString *selName = [NSString stringWithFormat:@"tabbar-highlight%d", i + 1];
        [tabBar addTabBarItmeWithNomalImageName:name selcetedImageName:selName];

    }
    
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];

}


#pragma mark
#pragma mark -- 懒加载
-(NSMutableArray*)arrayControllers {
    if (!_arrayControllers) {
        _arrayControllers  = [[NSMutableArray alloc] init];
    }
    
    return _arrayControllers;
}


#pragma mark
#pragma mark -- FXTabBarDelegate
- (void)tabBar:(FXTabBar *)tabBar fromViewController:(NSInteger)formVC toViewController:(NSInteger)toVC {
    self.selectedIndex = toVC;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
