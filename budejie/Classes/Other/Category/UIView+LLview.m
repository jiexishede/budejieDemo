//
//  UIView+LLview.m
//  budejie
//
//  Created by 李龙龙 on 27/10/2016.
//  Copyright © 2016 banmaqishi. All rights reserved.
//

#import "UIView+LLview.h"

@implementation UIView (LLview)

- (void)setLl_x:(CGFloat)ll_x{
    CGRect rect = self.frame;
    rect.origin.x =ll_x;
    self.frame = rect;
}

- (CGFloat)ll_x{
    return self.frame.origin.x;
}

- (void)setLl_y:(CGFloat)ll_y {
    CGRect rect = self.frame;
    rect.origin.y = ll_y;
    self.frame = rect;
}
- (CGFloat)ll_y {
    return self.frame.origin.y;
}
- (void)setLl_width:(CGFloat)ll_width {
    CGRect rect = self.frame;
    rect.size.width = ll_width;
    self.frame = rect;
}
- (CGFloat)ll_width {
    return self.frame.size.width;
}

- (void)setLl_height:(CGFloat)ll_height {
    CGRect rect = self.frame;
    rect.size.height = ll_height;
    self.frame = rect;
}

- (CGFloat)ll_height {
    return self.frame.size.height;
}
@end
