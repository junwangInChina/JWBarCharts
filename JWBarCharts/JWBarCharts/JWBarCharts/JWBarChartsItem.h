//
//  JWBarChartsItem.h
//  JWBarCharts
//
//  Created by wangjun on 2018/11/14.
//  Copyright © 2018年 wangjun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JWBarChartsItem : NSObject

@property (nonatomic, assign, readonly) CGFloat itemValuesSum;
@property (nonatomic, assign, readonly) CGFloat itemMultiplied;

@property (nonatomic, assign) CGFloat itemValueMax;
@property (nonatomic, strong) NSArray *itemValues;

@property (nonatomic, copy) NSString *itemValueLabelText;
@property (nonatomic, strong) UIFont *itemValueLabelFont;            // default Arial 13
@property (nonatomic, strong) UIColor *itemValueLabelTextColor;      // default #333333
@property (nonatomic, assign) BOOL itemValueLableHide;               // default YES

@property (nonatomic, strong) NSArray *itemBackgroundColors;         // default @[#9b9caa 0.8]

@property (nonatomic, copy) NSString *itemXaisText;
@property (nonatomic, strong) UIFont *itemXaisLabelFont;            // default Arial 13
@property (nonatomic, strong) UIColor *itemXaisLabelTextColor;      // default #333333

@end
