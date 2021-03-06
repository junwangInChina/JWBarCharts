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
@property (nonatomic, assign, readwrite) CGFloat itemValuesMax;
@property (nonatomic, assign, readwrite) CGFloat itemMultiplied;
@property (nonatomic, strong, readwrite) NSArray *itemMultipliedArray;
@property (nonatomic, assign, readwrite) CGFloat itemValueLabelWidth;

@end

@implementation JWBarChartsItem

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.itemXaisLabelFont = self.itemValueLabelFont = self.itemXaisLabelSelectedFont = self.itemValueLabelSelectedFont = [UIFont fontWithName:@"Arial" size:13];
        self.itemXaisLabelTextColor = self.itemValueLabelTextColor = self.itemXaisLabelSelectedTextColor = self.itemValueLabelSelectedTextColor = [UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1.0];
        self.itemBackgroundColors = self.itemSelectedBackgroundColors = @[[UIColor colorWithRed:155.0/255.0 green:156.0/255.0 blue:170.0/255.0 alpha:0.8]];
        self.itemValueLableHide = NO;
        
        self.itemMaskLabelFont = [UIFont fontWithName:@"Arial" size:13];
        self.itemMaskLabelTextColor = [UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1.0];
        
        self.itemIsStacking = YES;
        self.itemIsRadius = NO;
        self.itemIsShadow = NO;
    }
    return self;
}

- (void)setItemValues:(NSArray *)itemValues
{
    _itemValues = itemValues;
    
//    if (self.itemIsStacking)
//    {
//        NSNumber *sum = [itemValues valueForKeyPath:@"@sum.floatValue"];
//        self.itemValuesSum = [sum floatValue];
//    }
//    else
//    {
//        NSNumber *max = [itemValues valueForKeyPath:@"@max.floatValue"];
//        self.itemValuesSum = [max floatValue];
//    }
}

- (void)setItemIsStacking:(BOOL)itemIsStacking
{
    _itemIsStacking = itemIsStacking;
    
    if (self.itemIsStacking)
    {
        NSNumber *sum = [self.itemValues valueForKeyPath:@"@sum.floatValue"];
        self.itemValuesSum = [sum floatValue];
    }
    else
    {
        NSNumber *max = [self.itemValues valueForKeyPath:@"@max.floatValue"];
        self.itemValuesSum = [max floatValue];
    }
}

- (void)setItemValueMax:(CGFloat)itemValueMax
{
    _itemValueMax = itemValueMax;
    
    self.itemMultiplied = itemValueMax == 0 ? 0 : self.itemValuesSum / self.itemValueMax;
    
    NSMutableArray *tempArray = [NSMutableArray array];
    for (NSInteger i = 0; i < self.itemValues.count; i++)
    {
        CGFloat tempValue = [self.itemValues[i] floatValue];
        CGFloat tempMulti = self.itemValuesSum == 0 ? 0 : tempValue / self.itemValuesSum;
        [tempArray addObject:@(tempMulti)];
    }
    self.itemMultipliedArray = tempArray;
}

- (void)setItemValueLabelText:(NSString *)itemValueLabelText
{
    _itemValueLabelText = itemValueLabelText;
    
    [self calculationLableValueWidth];

    if (self.itemMaskText.length <= 0)
    {
        self.itemMaskText = itemValueLabelText;
    }
}

- (void)setItemValueLabelFont:(UIFont *)itemValueLabelFont
{
    _itemValueLabelFont = itemValueLabelFont;
    _itemValueLabelSelectedFont = itemValueLabelFont;
    
    [self calculationLableValueWidth];
}

- (void)setItemValueLabelTextColor:(UIColor *)itemValueLabelTextColor
{
    _itemValueLabelTextColor = itemValueLabelTextColor;
    _itemValueLabelSelectedTextColor = itemValueLabelTextColor;
}

- (void)setItemXaisLabelFont:(UIFont *)itemXaisLabelFont
{
    _itemXaisLabelFont = itemXaisLabelFont;
    _itemXaisLabelSelectedFont = itemXaisLabelFont;
}

- (void)setItemXaisLabelTextColor:(UIColor *)itemXaisLabelTextColor
{
    _itemXaisLabelTextColor = itemXaisLabelTextColor;
    _itemXaisLabelSelectedTextColor = itemXaisLabelTextColor;
}

- (void)setItemBackgroundColors:(NSArray *)itemBackgroundColors
{
    _itemBackgroundColors = itemBackgroundColors;
    _itemSelectedBackgroundColors = itemBackgroundColors;
}

- (void)calculationLableValueWidth
{
    if (self.itemValueLabelText.length > 0 && self.itemValueLabelFont != nil)
    {
        NSDictionary *tempAttrs = @{NSFontAttributeName:self.itemValueLabelFont};
        
        CGSize tempSize = [self.itemValueLabelText boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT)
                                                                options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                                             attributes:tempAttrs
                                                                context:nil].size;
        self.itemValueLabelWidth = tempSize.width;
    }
}

@end
