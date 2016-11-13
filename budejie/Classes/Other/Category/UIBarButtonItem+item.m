//
//  UIBarButtonItem+item.m
//  budejie
//
//  Created by 李龙龙 on 28/10/2016.
//  Copyright © 2016 banmaqishi. All rights reserved.
//

#import "UIBarButtonItem+item.h"

@implementation UIBarButtonItem (item)

// 快速创建UIBarButtonItem
+ (UIBarButtonItem *)itemWithImage:(UIImage *)image hightImage:(UIImage *)highImage target:(id)target action:(SEL)action{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:highImage forState:UIControlStateHighlighted];
    [btn sizeToFit];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIView *containView = [[UIView alloc] initWithFrame:btn.bounds];
    [containView addSubview:btn];
    
    return [[UIBarButtonItem alloc] initWithCustomView:containView];
}

+ (UIBarButtonItem *)backItemWithImage:(UIImage *)image hightImage:(UIImage *)highImage target:(id)target action:(SEL)action string:(NSString *)backString{
    UIButton * backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setImage:image forState:UIControlStateNormal];
    [backButton setImage:highImage forState:UIControlStateHighlighted];
    [backButton setTitle:backString forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [backButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [backButton sizeToFit]; // 不设置 这一点，button 没有大小，不显示
    backButton.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    return [[UIBarButtonItem  alloc]initWithCustomView:backButton];
}

+ (UIBarButtonItem *)itemWithImage:(UIImage *)image selImage: (UIImage *)selImage target:(id)target action:(SEL)action{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:selImage forState:UIControlStateSelected];
    [btn sizeToFit];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchDown];
    UIView *containView = [[UIView alloc] initWithFrame:btn.bounds];
    [containView addSubview:btn]; // 加一个 containView : 能让 按钮自适应大小
    return [[UIBarButtonItem alloc] initWithCustomView:containView];
}

@end
