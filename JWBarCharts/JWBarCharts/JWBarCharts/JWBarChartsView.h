//
//  JWBarChartsView.h
//  JWBarCharts
//
//  Created by wangjun on 2018/11/14.
//  Copyright © 2018年 wangjun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JWBarChartsView : UIView

@property (nonatomic, assign) NSInteger yMax;
@property (nonatomic, assign) NSInteger yMin;
@property (nonatomic, assign) NSInteger yLabelCount;
@property (nonatomic, strong) NSArray *yLabelTexts;
@property (nonatomic, strong) UIFont *yLabelTextFont;
@property (nonatomic, strong) UIColor *yLabelTextColor;
@property (nonatomic, assign) BOOL yHide;

@property (nonatomic, strong) NSArray *xLabelTexts;
@property (nonatomic, strong) UIFont *xLabelTextFont;
@property (nonatomic, strong) UIColor *xLabelTextColor;
@property (nonatomic, assign) BOOL xHide;

@property (nonatomic, strong) NSArray *items;

- (void)reloadCharts;

@end
