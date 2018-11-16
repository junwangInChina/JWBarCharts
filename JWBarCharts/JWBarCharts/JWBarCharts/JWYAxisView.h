//
//  JWYAxisView.h
//  JWBarCharts
//
//  Created by wangjun on 2018/11/14.
//  Copyright © 2018年 wangjun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JWYAxisView : UIView

@property (nonatomic, assign) CGFloat maxValue;
@property (nonatomic, assign) NSInteger minValue;
@property (nonatomic, strong) UIFont *labelTextFont;
@property (nonatomic, strong) UIColor *labelTextColor;
@property (nonatomic, strong) NSArray *labelTexts;
@property (nonatomic, strong) UIColor *bgColor;

- (void)reloadYaxis;

@end
