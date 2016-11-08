//
//  LLTabBar.m
//  budejie
//
//  Created by 李龙龙 on 25/10/2016.
//  Copyright © 2016 banmaqishi. All rights reserved.
//

#import "LLTabBar.h"

@interface LLTabBar ()

@property (nonatomic, weak) UIButton * plusButton;

@end

@implementation LLTabBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (UIButton *)plusButton {
    
    if( _plusButton == nil) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateHighlighted];
        
        // 这个方法让图片的大小自适应图片的大小
        [btn sizeToFit];
        // 不把这个 btn 加在view 上， 这个 btn 创建后就小会了。
        [self addSubview:btn];
        
        _plusButton = btn;
    }
    
    return _plusButton;
}

- (void)layoutSubviews {
    // 这个方法 会把原始的 UITabbar 里面的子控件的位置调整好
    [super layoutSubviews];
    
    // 调整tabBarButton的位置
    
    //  这里 count 没有写死， 等于 它的 子控件的数量
    NSInteger count = self.items.count;
    CGFloat btnW = self.ll_width /(count + 1);
    CGFloat btnH = self.ll_height;
    CGFloat x = 0;
    int i = 0;
    // 私有类: 打印出来有这个类，但是敲出来没有，说明这个类是系统私有类
    /// 遍历子控件  调整布局
    for( UIView *tabBarButton in self.subviews) {
        if( [tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            if( i == 2) {
                i = i + 1;
            }
            x = i * btnW;
            tabBarButton.frame = CGRectMake(x, 0, btnW, btnH);
            i++;
        }
    }
    
    // 调整发布按钮位置
    // 注意 这里不能使用 _plusButton , 因为只用 _plusButton ,就不会走  懒加载的方法了不走  set get 方法了吧。（好像）
    self.plusButton.center = CGPointMake(self.ll_width * 0.5, self.ll_height * 0.5);
    
}

@end
