//
//  JWBarChartsItem.m
//  JWBarCharts
//
//  Created by wangjun on 2018/11/14.
//  Copyright © 2018年 wangjun. All rights reserved.
//

#import "JWBarChartsItem.h"

@implementation JWBarChartsItem

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.itemLabelFont = [UIFont fontWithName:@"Arial" size:13];
        self.itemLabelTextColor = [UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1.0];
        self.itemBackgroundColors = @[[UIColor colorWithRed:155.0/255.0 green:156.0/255.0 blue:170.0/255.0 alpha:0.8]];
    }
    return self;
}

@end
