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
@property (nonatomic, strong) NSArray *yLabelTexts;
@property (nonatomic, strong) UIFont *yLabelTextFont;    // default Arial 13
@property (nonatomic, strong) UIColor *yLabelTextColor;  // default #333333
@property (nonatomic, strong) UIColor *yAxisColor;       // default #333333
@property (nonatomic, assign) BOOL yHide;                // default NO

@property (nonatomic, strong) UIFont *xLabelTextFont;       // default Arial 13
@property (nonatomic, strong) UIColor *xLabelTextColor;     // default #333333
@property (nonatomic, assign) BOOL xHide;                   // default NO
@property (nonatomic, strong) UIColor *xAxisColor;          // default #333333

@property (nonatomic, assign) BOOL xSeparatorHide;          // default YES
@property (nonatomic, strong) UIColor *xSeparatorColor;     // default #333333

@property (nonatomic, strong) UIFont *maskTextFont;       // default Arial 13
@property (nonatomic, strong) UIColor *maskTextColor;     // default #333333
@property (nonatomic, assign) BOOL maskHide;              // default YES

@property (nonatomic, assign) CGFloat marginTop;          // default 0
@property (nonatomic, assign) CGFloat marginBottom;       // default 0

@property (nonatomic, strong) NSArray *items;

@property (nonatomic, copy) void(^barTouch)(NSInteger touchIndex, JWBarChartsItem *item);
@property (nonatomic, copy) void(^barDidScroll)(NSInteger leftIndex, JWBarChartsItem *leftItem,NSInteger rightIndex, JWBarChartsItem *rightItem);

- (void)reloadCharts;

- (void)scrollToBar:(NSInteger)index;

- (void)seleteToBar:(NSInteger)index;

@end
