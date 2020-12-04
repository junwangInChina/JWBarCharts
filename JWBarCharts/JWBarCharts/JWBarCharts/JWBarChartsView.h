//
//  JWBarChartsView.h
//  JWBarCharts
//
//  Created by wangjun on 2018/11/14.
//  Copyright © 2018年 wangjun. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JWBarChartsItem;

typedef NS_ENUM(NSInteger, JWBarChartsBarType) {
    JWBarChartsBarTypeStacking = 0,         /* 多根柱子堆成一根 */
    JWBarChartsBarTypeJuxtaposition,        /* 多根柱子横向排列 */
};

@interface JWBarChartsView : UIView

@property (nonatomic, assign) JWBarChartsBarType barType;   // default is JWBarChartsBarTypeStacking

@property (nonatomic, assign) CGFloat yMax;
@property (nonatomic, assign) NSInteger yMin;            // default 0
@property (nonatomic, assign) NSInteger yLabelCount;      // default is 5
@property (nonatomic, strong) NSArray *yLabelTexts;
@property (nonatomic, strong) UIFont *yLabelTextFont;    // default Arial 13
@property (nonatomic, strong) UIColor *yLabelTextColor;  // default #333333
@property (nonatomic, strong) UIColor *yAxisColor;       // default #333333
@property (nonatomic, assign) BOOL yHide;                // default NO

@property (nonatomic, assign) CGFloat barWidthMultiplied;   // default is 0.5
@property (nonatomic, assign) CGFloat barDefaultWidth;             // default is 0


@property (nonatomic, strong) UIFont *xLabelTextFont;       // default Arial 13
@property (nonatomic, strong) UIColor *xLabelTextColor;     // default #333333
@property (nonatomic, assign) BOOL xHide;                   // default NO
@property (nonatomic, strong) UIColor *xAxisColor;          // default #333333

@property (nonatomic, assign) BOOL xSeparatorHide;          // default YES
@property (nonatomic, strong) UIColor *xSeparatorColor;     // default #333333

@property (nonatomic, strong) UIFont *maskTextFont;       // default Arial 13
@property (nonatomic, strong) UIColor *maskTextColor;     // default #333333
@property (nonatomic, assign) NSTextAlignment maskTextAlignment; // default NSTextAlignmentCenter
@property (nonatomic, assign) BOOL maskHide;              // default YES

@property (nonatomic, assign) CGFloat marginTop;          // default 0
@property (nonatomic, assign) CGFloat marginBottom;       // default 0

@property (nonatomic, strong) UIFont *emptyTextFont;        // default Arial 13
@property (nonatomic, strong) UIColor *emptyTextColor;      // default #333333
@property (nonatomic, copy) NSString *emptyText;            // default 暂无数据

@property (nonatomic, assign) BOOL chartOpenItemSelected;        // 是否开启选中功能，默认不开启
@property (nonatomic, assign) BOOL chartItemRadius;         // 柱子是否保持圆角，默认不圆角
@property (nonatomic, assign) BOOL chartItemShadow;         // 柱子是否开启阴影效果，默认不开启


@property (nonatomic, strong) NSArray *items;

@property (nonatomic, copy) void(^barTouch)(NSInteger touchIndex, JWBarChartsItem *item);
@property (nonatomic, copy) void(^barDidScroll)(NSInteger leftIndex, JWBarChartsItem *leftItem,NSInteger rightIndex, JWBarChartsItem *rightItem);
@property (nonatomic, copy) void(^barItemMinX)(CGFloat x);

- (void)reloadCharts;

- (void)scrollToBar:(NSInteger)index;

- (void)seleteToBar:(NSInteger)index;

@end
