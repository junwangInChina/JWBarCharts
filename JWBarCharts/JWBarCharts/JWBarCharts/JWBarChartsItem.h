//
//  JWBarChartsItem.h
//  JWBarCharts
//
//  Created by wangjun on 2018/11/14.
//  Copyright © 2018年 wangjun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JWBarChartsItem : NSObject

@property (nonatomic, assign, readonly) CGFloat itemValuesSum;          // 柱子堆叠时，需要知道所有总柱子高度
@property (nonatomic, assign, readonly) CGFloat itemMultiplied;         // 柱子堆叠时，需要知道所有总柱子高度比例
@property (nonatomic, assign, readonly) CGFloat itemValuesMax;          // 柱子横向并列时，需要知道最高的一根柱子
@property (nonatomic, strong, readonly) NSArray *itemMultipliedArray;   // 柱子横向并列时，需要知道每根柱子的高度比例
@property (nonatomic, assign, readonly) CGFloat itemValueLabelWidth;

@property (nonatomic, assign) CGFloat itemValueMax;
@property (nonatomic, strong) NSArray *itemValues;

@property (nonatomic, copy) NSString *itemValueLabelText;
@property (nonatomic, strong) UIFont *itemValueLabelFont;                    // default Arial 13
@property (nonatomic, strong) UIFont *itemValueLabelSelectedFont;            // default Arial 13
@property (nonatomic, strong) UIColor *itemValueLabelTextColor;              // default #333333
@property (nonatomic, strong) UIColor *itemValueLabelSelectedTextColor;      // default #333333

@property (nonatomic, assign) BOOL itemValueLableHide;               // default NO

@property (nonatomic, strong) NSArray *itemBackgroundColors;                 // default @[#9b9caa 0.8]
@property (nonatomic, strong) NSArray *itemSelectedBackgroundColors;         // default @[#9b9caa 0.8]

@property (nonatomic, copy) NSString *itemXaisText;
@property (nonatomic, strong) UIFont *itemXaisLabelFont;                    // default Arial 13
@property (nonatomic, strong) UIFont *itemXaisLabelSelectedFont;            // default Arial 13
@property (nonatomic, strong) UIColor *itemXaisLabelTextColor;              // default #333333
@property (nonatomic, strong) UIColor *itemXaisLabelSelectedTextColor;      // default #333333

@property (nonatomic, copy) NSString *itemMaskText;                 // default itemValueLabelText
@property (nonatomic, strong) UIFont *itemMaskLabelFont;            // default Arial 13
@property (nonatomic, strong) UIColor *itemMaskLabelTextColor;      // default #333333

@property (nonatomic, assign) CGFloat itemWidthMultiplied;

@property (nonatomic, assign) BOOL itemIsStacking;               // 柱子是否堆叠

@property (nonatomic, assign) BOOL itemIsRadius;                 // 柱子是否圆角

@property (nonatomic, assign) BOOL itemIsShadow;                 // 柱子是否开启阴影效果


@end
