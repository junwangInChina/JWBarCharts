//
//  JWXSepartorView.m
//  JWBarCharts
//
//  Created by wangjun on 2018/11/16.
//  Copyright © 2018年 wangjun. All rights reserved.
//

#import "JWXSepartorView.h"

#import "JWBarChartsDefine.h"
#import <Masonry/Masonry.h>

#pragma mark ============================================================= JWXSepartorLineView

@interface JWXSepartorLineView : UIView

@property (nonatomic, strong) UIColor *separtorColor;

@end


@implementation JWXSepartorLineView

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self configLineView];
}

- (void)configLineView
{
    UIBezierPath *tempPath = [UIBezierPath bezierPath];
    [tempPath moveToPoint:CGPointMake(0, 0)];
    [tempPath addLineToPoint:CGPointMake(CGRectGetWidth(self.frame), 0)];
    [tempPath setLineWidth:CGRectGetHeight(self.frame)];
    
    
    CAShapeLayer *tempLayer = [CAShapeLayer layer];
    tempLayer.strokeColor = self.separtorColor.CGColor;
    tempLayer.fillColor = [UIColor clearColor].CGColor;
    tempLayer.lineWidth = CGRectGetHeight(self.frame);
    tempLayer.path = tempPath.CGPath;
    tempLayer.lineDashPattern = @[@5,@5];
    [self.layer addSublayer:tempLayer];
}

@end

#pragma mark ============================================================= JWXSepartorView

@implementation JWXSepartorView

#pragma mark - Lazy loading
- (void)drawSepartorLine
{
    for (UIView *tempView in self.subviews)
    {
        if ([tempView isKindOfClass:[JWXSepartorLineView class]])
        {
            [tempView removeFromSuperview];
        }
    }
    
    JW_BC_WS(this)
    for (NSInteger i = 0; i < JW_BARCHARTS_X_SEPARTOR_NUM; i++)
    {
        JWXSepartorLineView *tempLineView = [[JWXSepartorLineView alloc] init];
        tempLineView.separtorColor = self.separtorColor;
        [self addSubview:tempLineView];
        [tempLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(this);
            make.height.mas_equalTo(1.0/JW_BARCHARTS_SCREEN_SCALE);
            if (i == 0)
            {
                make.top.equalTo(this);
            }
            else
            {
                CGFloat tempM = ((i * 10/ 10.0) * 2) / ((JW_BARCHARTS_X_SEPARTOR_NUM - 1) + 1); // 2i/n
                make.centerY.equalTo(this).multipliedBy(tempM);
            }
        }];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
