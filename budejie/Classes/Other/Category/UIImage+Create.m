//
//  UIImage+Create.m
//  budejie
//
//  Created by 李龙龙 on 23/10/2016.
//  Copyright © 2016 banmaqishi. All rights reserved.
//

#import "UIImage+Create.h"

@implementation UIImage (Create)

+ (UIImage *)imageOriginalWithName:(NSString *) imageName{
    
    UIImage *image = [UIImage imageNamed:imageName];
    return  [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

@end
