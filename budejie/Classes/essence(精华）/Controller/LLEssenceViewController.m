//
//  LLEssenceViewController.m
//  budejie
//
//  Created by 李龙龙 on 23/10/2016.
//  Copyright © 2016 banmaqishi. All rights reserved.
//

#import "LLEssenceViewController.h"

@interface LLEssenceViewController ()

@end

@implementation LLEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    [self setupNavBar];
}
#pragma mark - 设置导航条
- (void)setupNavBar {
    // 左边按钮
    // 把UIButton包装成UIBarButtonItem. 就导致按钮点击区域扩大
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"nav_item_game_icon"] hightImage:[UIImage imageNamed:@"nav_item_game_click_icon"] target:self action:@selector(game)];
    // 右边按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"navigationButtonRandom"] selImage:[UIImage imageNamed:@"navigationButtonRandomClick"] target:self action:nil];
    //  titleView
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
}

- (void)game{
    
    LLFunc;
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
