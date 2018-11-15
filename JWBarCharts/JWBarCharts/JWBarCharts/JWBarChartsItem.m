//
//  JWBarChartsItem.m
//  JWBarCharts
//
//  Created by wangjun on 2018/11/14.
//  Copyright © 2018年 wangjun. All rights reserved.
//

#import "JWBarChartsItem.h"

@interface JWBarChartsItem ()

@property (nonatomic, assign, readwrite) CGFloat itemValuesSum;
@property (nonatomic, assign, readwrite) CGFloat itemMultiplied;

@end

@implementation JWBarChartsItem

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.itemXaisLabelFont = self.itemValueLabelFont = [UIFont fontWithName:@"Arial" size:13];
        self.itemXaisLabelTextColor = self.itemValueLabelTextColor = [UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1.0];
        self.itemBackgroundColors = @[[UIColor colorWithRed:155.0/255.0 green:156.0/255.0 blue:170.0/255.0 alpha:0.8]];
        self.itemValueLableHide = YES;
    }
    return self;
}

- (void)setItemValues:(NSArray *)itemValues
{
    _itemValues = itemValues;
    
    NSNumber *sum = [itemValues valueForKeyPath:@"@sum.floatValue"];
    self.itemValuesSum = [sum floatValue];
}

- (void)setItemValueMax:(CGFloat)itemValueMax
{
    _itemValueMax = itemValueMax;
    
    self.itemMultiplied = itemValueMax == 0 ? 0 : self.itemValuesSum / self.itemValueMax;
}

@end
