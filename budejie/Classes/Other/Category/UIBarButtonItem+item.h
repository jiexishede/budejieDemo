//
//  UIBarButtonItem+item.h
//  budejie
//
//  Created by 李龙龙 on 28/10/2016.
//  Copyright © 2016 banmaqishi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (item)
// 快速创建UIBarButtonItem 高亮状态图片
+ (UIBarButtonItem *)itemWithImage:(UIImage *)image hightImage:(UIImage *)highImage target:(id)target action:(SEL)action;

// 快速创建UIBarButtonItem 选中状态图片
+ (UIBarButtonItem *)itemWithImage:(UIImage *)image selImage: (UIImage *)selImage target:(id)target action:(SEL)action;
// 返回按钮
+ (UIBarButtonItem *)backItemWithImage:(UIImage *)image hightImage:(UIImage *)highImage target:(id)target action:(SEL)action string:(NSString *)backString;

@end
