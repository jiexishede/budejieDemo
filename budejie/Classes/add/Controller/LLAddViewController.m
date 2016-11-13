//
//  LLAddViewController.m
//  budejie
//
//  Created by 李龙龙 on 13/11/2016.
//  Copyright © 2016 banmaqishi. All rights reserved.
//

#import "LLAddViewController.h"

@interface LLAddViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *launchImageView;
@property (weak, nonatomic) IBOutlet UIView *adView;
@property (weak, nonatomic) IBOutlet UIButton *timeButton;

@end

@implementation LLAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setLaunchImageView];
    
}

- (void)setLaunchImageView {
    if(iphone4){
        self.launchImageView.image = [UIImage imageNamed:@"LaunchImage@2x"];
    }else if(iphone5) {
        self.launchImageView.image = [UIImage imageNamed:@"LaunchImage-700-568h@2x"];
    } else if (iphone6){
        self.launchImageView.image = [UIImage imageNamed:@"LaunchImage-800-667h@2x"];
    } else if (iphone6P){
        self.launchImageView.image = [UIImage imageNamed:@"LaunchImage-800-Portrait-736h@3x.png"];
    }
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
