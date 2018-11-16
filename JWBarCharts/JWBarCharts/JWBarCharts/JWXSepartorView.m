//
//  JWXSepartorView.m
//  JWBarCharts
//
//  Created by wangjun on 2018/11/16.
//  Copyright © 2018年 wangjun. All rights reserved.
//

#import "JWXSepartorView.h"

@implementation JWXSepartorView

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
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
