//
//  LLNavigationController.m
//  budejie
//
//  Created by 李龙龙 on 28/10/2016.
//  Copyright © 2016 banmaqishi. All rights reserved.
//

#import "LLNavigationController.h"

@interface LLNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation LLNavigationController

+ (void)load {
    //TODO  这个方法为什么这样写来着 ？
    UINavigationBar * navBar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    // 只要是通过模型设置，都是通过富文本设置
    // 设置导航条  =》  UINavigationBar
    NSMutableDictionary *attrs  = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
    [navBar setTitleTextAttributes:attrs];
    // 设置导航栏的背景色为白色 即使UIView的背景颜色是 红色的，导航栏也没有半红色的透明效果
    [navBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
}


- (void) pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    // 设置返回按钮,只有非根控制器
    if(self.childViewControllers.count > 0){
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem backItemWithImage:[UIImage imageNamed:@"navigationButtonReturn"] hightImage: [UIImage imageNamed:@"navigationButtonReturnClick"] target:self action:@selector(backToLastController) string:@"返回"];
    }
    [super pushViewController:viewController animated:animated];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    return self.childViewControllers.count > 1;
}

- (void)backToLastController {
    [self popViewControllerAnimated:YES];
}
/**
  LLLog(@"%@", self.interactivePopGestureRecognizer);
 UIScreenEdgePanGestureRecognizer: 0x7ffa68a03f60; state = Possible; delaysTouchesBegan = YES; view = <UILayoutContainerView 0x7ffa68b081c0>; target= <(action=handleNavigationTransition:, target=<_UINavigationInteractiveTransition 0x7ffa68a03e20>)>>
 2016-11-12 19:26:09.714 budejie[7281:345801]
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /**
     * 全屏幕滑动版本
     */
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransition:)];
    [self.view addGestureRecognizer:pan];
    self.interactivePopGestureRecognizer.enabled = NO;
    
    /**
     * 边缘滑动版本
     *  同样需要代理让 默认的 navigationContrller 的 自控制器 的数量不能为 小于1的值 让他们响应，要不然 跟控制器 会出现假死状态；
     */
//    self.interactivePopGestureRecognizer.delegate = self;
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
