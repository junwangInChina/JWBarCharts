//
//  JWBarChartsView.h
//  JWBarCharts
//
//  Created by wangjun on 2018/11/14.
//  Copyright © 2018年 wangjun. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JWBarChartsItem;

@interface JWBarChartsView : UIView

@property (nonatomic, assign) CGFloat yMax;
@property (nonatomic, assign) NSInteger yMin;            // default 0
@property (nonatomic, assign) NSInteger yLabelCount;     // default 5
@property (nonatomic, strong) NSArray *yLabelTexts;
@property (nonatomic, strong) UIFont *yLabelTextFont;    // default Arial 13
@property (nonatomic, strong) UIColor *yLabelTextColor;  // default #333333
@property (nonatomic, strong) UIColor *yAxisColor;       // default #333333
@property (nonatomic, assign) BOOL yHide;                // default NO

@property (nonatomic, strong) UIFont *xLabelTextFont;       // default Arial 13
@property (nonatomic, strong) UIColor *xLabelTextColor;     // default #333333
@property (nonatomic, assign) BOOL xHide;                   // default NO
@property (nonatomic, strong) UIColor *xAxisColor;          // default #333333

@property (nonatomic, strong) NSArray *items;

@property (nonatomic, copy) void(^barTouch)(JWBarChartsItem *item);
@property (nonatomic, copy) void(^barDidScroll)(JWBarChartsItem *leftItem, JWBarChartsItem *rightItem);

- (void)reloadCharts;

@end
