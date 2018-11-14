//
//  JWBarChartsItem.h
//  JWBarCharts
//
//  Created by wangjun on 2018/11/14.
//  Copyright © 2018年 wangjun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JWBarChartsItem : NSObject

@property (nonatomic, strong) NSArray *itemValues;
@property (nonatomic, copy) NSString *itemLabelText;
@property (nonatomic, strong) UIFont *itemLabelFont;            // default Arial 13
@property (nonatomic, strong) UIColor *itemLabelTextColor;      // default #333333
@property (nonatomic, strong) NSArray *itemBackgroundColors;    // default @[#9b9caa 0.8]

@end
