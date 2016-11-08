//
//  LLFriendTrendViewController.m
//  budejie
//
//  Created by 李龙龙 on 23/10/2016.
//  Copyright © 2016 banmaqishi. All rights reserved.
//

#import "LLFriendTrendViewController.h"

@interface LLFriendTrendViewController ()

@end

@implementation LLFriendTrendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupNavBar];

}

- (void)setupNavBar {
    //左边按钮
    // 把UIButton 包装成UIBarButtonItem. 就导致按钮点击区域扩大
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"friendsRecommentIcon"] selImage:[UIImage imageNamed:@"friendsRecommentIcon-click"] target:self action:@selector(friendsRecomment)];
    // titleView
    self.navigationItem.title = @"我的关注";
}

- (void)friendsRecomment {
    LLFunc;
    NSLog(@"点击了关注");
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
