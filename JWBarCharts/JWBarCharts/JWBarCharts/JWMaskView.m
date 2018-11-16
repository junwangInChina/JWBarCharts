//
//  JWMaskView.m
//  JWBarCharts
//
//  Created by wangjun on 2018/11/16.
//  Copyright © 2018年 wangjun. All rights reserved.
//

#import "JWMaskView.h"

#import "JWBarChartsDefine.h"
#import <Masonry/Masonry.h>

@interface JWMaskView()

@property (nonatomic, strong) UILabel *maskLabel;

@end

@implementation JWMaskView

#pragma mark - Lazy loading
- (UILabel *)maskLabel
{
    if (!_maskLabel)
    {
        self.maskLabel = [UILabel new];
        _maskLabel.backgroundColor = [UIColor clearColor];
        _maskLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_maskLabel];
        
        JW_BC_WS(this)
        [self.maskLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(this);
            make.bottom.equalTo(this);
        }];
    }
    return _maskLabel;
}

- (void)setMaskFont:(UIFont *)maskFont
{
    _maskFont = maskFont;
    
    self.maskLabel.font = maskFont;
}

- (void)setMaskTextColor:(UIColor *)maskTextColor
{
    _maskTextColor = maskTextColor;
    
    self.maskLabel.textColor = maskTextColor;
}

#pragma mark - Public Method
- (void)reload:(NSString *)text
{
    self.maskLabel.text = text;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
