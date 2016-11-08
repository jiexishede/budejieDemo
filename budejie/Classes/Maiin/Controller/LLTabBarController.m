//
//  LLTabBarController.m
//  budejie
//
//  Created by 李龙龙 on 23/10/2016.
//  Copyright © 2016 banmaqishi. All rights reserved.
//

#import "LLTabBarController.h"
#import "LLEssenceViewController.h"
#import "LLFriendTrendViewController.h"
#import "LLMeViewController.h"
#import "LLNewViewController.h"
#import "LLPublishViewController.h"
#import "UIImage+Create.h"
#import "LLTabBar.h"
#import "LLNavigationController.h"



@interface LLTabBarController ()

@end

@implementation LLTabBarController

#pragma mark - 生命周期方法

/**
 * 选中图片被渲染 -》iOS7 之后 默认 tabBar 图片被渲染  // 1 图片  //  代码
   选中标题颜色： 黑色 标题字体大
 *
 */

+ (void)load {
    /**
     * appearance  ： 为什么 UITabBarItem 可以敲出来 appearance 
       1 。 只要遵守了UIAppearance 协议， 还要实现这个方法才可以 . 一定要实现了这个协议才可以，记住。
       2 。 那些属性可以通过appearance 来设置，只有被  UI_APPEARANCE_SELECTOR宏修饰的属性，才能修饰;
     */
     ///不用做判断
    // 获取UITabBarItem
    // 注意 这个方法会改掉所有的 appearance -》 UITabBarItem
    // iOS 7 中， 发短信没有名字。所有外观都改掉了。
//    UITabBarItem * item =  [UITabBarItem appearance];
     // 获取那个类的外观
    UITabBarItem *item = [UITabBarItem appearanceWhenContainedIn:self, nil];
    // 设置按钮选中的颜色： 富文本：描述一个文字的颜色，字体，阴影，空心效果，图文混排。
    // 创建一个描述文本属性的字典
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    // 设置颜色
    attrs[NSForegroundColorAttributeName] = [UIColor redColor];
    [item setTitleTextAttributes:attrs forState:UIControlStateSelected];
    
    // 设置字体大小, 只有正常状态下才会有效果
    NSMutableDictionary *attrsNor = [NSMutableDictionary dictionary];
    // 设置颜色
        attrsNor[NSFontAttributeName] = [UIFont systemFontOfSize:16];
    [item setTitleTextAttributes:attrsNor forState:UIControlStateNormal];
    
}

// 注意 ： 可能调用多次
+ (void)initialize {
    if (self == [LLTabBarController class]){
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //  2.1 添加子控制器 (5 个子控制器)  -》 自定义控制器 -》 划分项目文件结构
    [self setupAllChildViewController];
    
    // 2 设置tabBar上按钮内容 -> 由对应的子控制器的tabBarItem属性
    [self setupAllTitleButton];
    
    // 3.自定义tabBar
    [self setupTabBar];
    
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"显示前有没有加载子控件，子控件的数量是%@", self.tabBar.subviews);
    [super viewWillAppear:animated];
    NSLog(@"显示后有没有加载子控件，子控件的数量是%@", self.tabBar.subviews);
}

#pragma mark - 自定义tabBar 

- (void)setupTabBar {
    
    LLTabBar * tabBar = [[LLTabBar alloc] init];
    // self.tabBar = tabBar; 会报错， 这个 tabBar 是readonly 属性 .
    [self setValue:tabBar forKey:@"tabBar"];
}

#pragma mark - 添加所有子控制器

- (void) setupAllChildViewController {
    
    //   tabarVc: 会把第0个子控制器的view 添加上去
    //  精华
    LLEssenceViewController * essenceVc = [[LLEssenceViewController alloc] init];
    LLNavigationController * nav = [[LLNavigationController alloc] initWithRootViewController:essenceVc];
    // 会把这个导航控制器 默认第0个 压入栈顶//
    [self addChildViewController:nav];
    
    // 新帖
    
    LLNewViewController * newVc = [[LLNewViewController alloc] init];
    LLNavigationController * nav1 = [[LLNavigationController alloc] initWithRootViewController:newVc];
    [self addChildViewController:nav1];
//    
//    //发布
//    LLPublishViewController * publishVC = [[LLPublishViewController alloc] init];
//    
//    [self addChildViewController:publishVC];
//    
    // 关注]
    
    LLFriendTrendViewController * ftVC = [[LLFriendTrendViewController alloc] init];
    LLNavigationController * nav3 = [[LLNavigationController alloc] initWithRootViewController:ftVC];
    // 会把这个导航控制器 压入栈顶//
    [self addChildViewController:nav3];
    
    // 我
    LLMeViewController * neVC = [[LLMeViewController alloc] init];
    LLNavigationController * nav4 = [[LLNavigationController alloc] initWithRootViewController:neVC];
    // 会把这个导航控制器 压入栈顶//
    [self addChildViewController:nav4];
    
}

- (void)setupAllTitleButton {
    
    //  2.2 设置好tabBar 上按钮的内容 -> 由对应的子控制器的tabBarItem属性
    // 0  nav
    UINavigationController *nav = self.childViewControllers[0];
    nav.tabBarItem.title = @"精华";
    nav.tabBarItem.image  = [UIImage imageNamed:@"tabBar_essence_icon"];
    //  快速的生成一个没有渲染的图片
    nav.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"tabBar_essence_click_icon"];
    
    UINavigationController *nav1 = self.childViewControllers[1];
    nav1.tabBarItem.title = @"新帖";
    nav1.tabBarItem.image  = [UIImage imageNamed:@"tabBar_new_icon"];
    nav1.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"tabBar_new_click_icon"];

    
    // ！！！系统方法 调整 按钮的布局，不过这个按钮没有 UIControlStateHighlighted 这个状态，系统的 只有 selected 选中的这个状态。 
    
//     LLPublishViewController   *publishVC = self.childViewControllers[2];
//    publishVC.tabBarItem.image  = [UIImage imageOriginalWithName:@"tabBar_publish_icon"];
//    publishVC.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"tabBar_publish_click_icon"];
//    // 这个按钮， 退回来 ，颜色还是按下的。  
////    publishVC.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);

    UINavigationController *nav3 = self.childViewControllers[2];
    nav3.tabBarItem.title = @"关注";
    nav3.tabBarItem.image  = [UIImage imageNamed:@"tabBar_friendTrends_icon"];
    nav3.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"tabBar_friendTrends_click_icon"];

    
     UINavigationController *nav4 = self.childViewControllers[3];
    nav4.tabBarItem.title = @"我";
    nav4.tabBarItem.image  = [UIImage imageNamed:@"tabBar_me_icon"];
    nav4.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"tabBar_me_click_icon"];

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
