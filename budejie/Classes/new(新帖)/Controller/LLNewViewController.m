//
//  LLNewViewController.m
//  budejie
//
//  Created by 李龙龙 on 23/10/2016.
//  Copyright © 2016 banmaqishi. All rights reserved.
//

#import "LLNewViewController.h"

@interface LLNewViewController ()

@end

@implementation LLNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupNavigationBar];
}

-(void) setupNavigationBar {
    UIBarButtonItem * xiaoLeftButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"MainTagSubIcon"] hightImage:[UIImage imageNamed:@"MainTagSubIconClick"] target:self action:@selector(tagSubIcon)];
    self.navigationItem.leftBarButtonItem = xiaoLeftButtonItem;
    self.navigationItem.titleView =[[UIImageView alloc] initWithImage: [UIImage imageNamed:@"MainTitle"]];
}

- (void)tagSubIcon {
    NSLog(@"%s", __func__);
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
