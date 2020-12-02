//
//  JWBarChartsCell.m
//  JWBarCharts
//
//  Created by wangjun on 2018/11/15.
//  Copyright © 2018年 wangjun. All rights reserved.
//

#import "JWBarChartsCell.h"

#import "JWBarChartsItem.h"
#import "JWBarChartsDefine.h"

#import <Masonry/Masonry.h>

@interface JWBarChartLineView : UIView

@property (nonatomic, strong) NSArray *values;
@property (nonatomic, strong) NSArray *colors;
@property (nonatomic, strong) NSArray *multiplieds;
@property (nonatomic, assign) BOOL isStacking;
@property (nonatomic, assign) BOOL isRadius;


@end

@implementation JWBarChartLineView

- (void)reloadChartLine
{
    while (self.subviews.count)
    {
        [self.subviews.lastObject removeFromSuperview];
    }
    
    UIColor *tempColor = self.colors.count > 0 ? [self.colors firstObject] : [UIColor colorWithRed:155.0/255.0 green:156.0/255.0 blue:170.0/255.0 alpha:0.8];
    MAS_VIEW *preView;
    JW_BC_WS(this)
    for (NSInteger i = 0; i < self.values.count; i++)
    {
        if (self.colors.count > i)
        {
            tempColor = self.colors[i];
        }
        
        UIView *tempView = [UIView new];
        tempView.backgroundColor = tempColor;
        if (self.isRadius)
        {
            tempView.layer.cornerRadius = 3;
        }
        [self addSubview:tempView];
        
        [tempView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            if (self.isStacking)
            {
                make.left.right.equalTo(this);
                make.height.mas_equalTo(this).with.multipliedBy([self.multiplieds[i] floatValue]);
                if (preView)
                {
                    make.bottom.equalTo(preView.mas_top);
                }
                else
                {
                    make.bottom.equalTo(this);
                }
                // 最后一个
                if (i == self.values.count - 1)
                {
                    if ([self.multiplieds[i] floatValue] > 0 && self.isRadius)
                    {
                        UIView *tempBottomCoverView = [UIView new];
                        tempBottomCoverView.backgroundColor = tempView.backgroundColor;
                        [tempView addSubview:tempBottomCoverView];
                        [tempBottomCoverView mas_makeConstraints:^(MASConstraintMaker *make) {
                            make.bottom.left.right.equalTo(tempView);
                            make.height.mas_equalTo(3);
                        }];
                    }
                    
                } else {
                    if ([self.multiplieds[i] floatValue] > 0 && self.isRadius)
                    {
                        UIView *tempTopCoverView = [UIView new];
                        tempTopCoverView.backgroundColor = tempView.backgroundColor;
                        [tempView addSubview:tempTopCoverView];
                        [tempTopCoverView mas_makeConstraints:^(MASConstraintMaker *make) {
                            make.top.left.right.equalTo(tempView);
                            make.height.mas_equalTo(3);
                        }];
                        
                        UIView *tempBottomCoverView = [UIView new];
                        tempBottomCoverView.backgroundColor = tempView.backgroundColor;
                        [tempView addSubview:tempBottomCoverView];
                        [tempBottomCoverView mas_makeConstraints:^(MASConstraintMaker *make) {
                            make.bottom.left.right.equalTo(tempView);
                            make.height.mas_equalTo(3);
                        }];
                    }
                }
            }
            else
            {
                make.bottom.equalTo(this);
                make.height.mas_equalTo(this).with.multipliedBy([self.multiplieds[i] floatValue]);
                make.width.mas_equalTo(this).with.multipliedBy(1.0/self.values.count);
                if (preView)
                {
                    make.left.equalTo(preView.mas_right);
                }
                else
                {
                    make.left.equalTo(this);
                }
                
                if ([self.multiplieds[i] floatValue] > 0 && self.isRadius)
                {
                    UIView *tempBottomCoverView = [UIView new];
                    tempBottomCoverView.backgroundColor = tempView.backgroundColor;
                    [tempView addSubview:tempBottomCoverView];
                    [tempBottomCoverView mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.bottom.left.right.equalTo(tempView);
                        make.height.mas_equalTo(3);
                    }];
                }
                
            }
        }];
        preView = tempView;
    }
}

@end

@interface JWBarChartsCell ()

@property (nonatomic, strong) JWBarChartLineView *barView;
@property (nonatomic, strong) UILabel *valueLabel;
@property (nonatomic, strong) UILabel *xAxisLabel;

@end

@implementation JWBarChartsCell

#pragma mark - Lazy loading
- (JWBarChartLineView *)barView
{
    if (!_barView)
    {
        self.barView = [JWBarChartLineView new];
        _barView.backgroundColor = self.backgroundColor;
        [self addSubview:_barView];
        
        JW_BC_WS(this)
        [self.barView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.centerX.equalTo(this);
            make.width.equalTo(this).with.multipliedBy(0.5);
        }];
    }
    return _barView;
}

- (UILabel *)valueLabel
{
    if (!_valueLabel)
    {
        self.valueLabel = [UILabel new];
        _valueLabel.backgroundColor = [UIColor clearColor];
        _valueLabel.textAlignment = NSTextAlignmentCenter;
        _valueLabel.numberOfLines = 0;
        [self addSubview:_valueLabel];
        
        JW_BC_WS(this)
        [self.valueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(this);
            make.left.right.lessThanOrEqualTo(this);
            make.bottom.equalTo(this.barView.mas_top).with.offset(-5);
        }];
    }
    return _valueLabel;
}

- (UILabel *)xAxisLabel
{
    if (!_xAxisLabel)
    {
        self.xAxisLabel = [UILabel new];
        _xAxisLabel.backgroundColor = [UIColor clearColor];
        _xAxisLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_xAxisLabel];
        
        JW_BC_WS(this)
        [self.xAxisLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(this);
            make.left.right.lessThanOrEqualTo(this);
            make.top.equalTo(this.mas_bottom).with.offset(5);
        }];
    }
    return _xAxisLabel;
}

#pragma mark - Public Method
- (void)configItem:(JWBarChartsItem *)item selected:(BOOL)selected
{
    self.valueLabel.hidden = item.itemValueLableHide;
    self.valueLabel.textColor = selected ? item.itemValueLabelSelectedTextColor : item.itemValueLabelTextColor;
    self.valueLabel.font = selected ? item.itemValueLabelSelectedFont : item.itemValueLabelFont;
    self.valueLabel.text = item.itemValueLabelText;
    self.valueLabel.textAlignment = (item.itemValueLabelWidth > CGRectGetWidth(self.frame)) ? NSTextAlignmentLeft : NSTextAlignmentCenter;
    
    self.xAxisLabel.textColor = selected ? item.itemXaisLabelSelectedTextColor : item.itemXaisLabelTextColor;
    self.xAxisLabel.font = selected ? item.itemXaisLabelSelectedFont : item.itemXaisLabelFont;
    self.xAxisLabel.text = item.itemXaisText;
    
    self.barView.values = item.itemValues;
    self.barView.colors = selected ? item.itemSelectedBackgroundColors : item.itemBackgroundColors;
    self.barView.multiplieds = item.itemMultipliedArray;
    self.barView.isStacking = item.itemIsStacking;
    self.barView.isRadius = item.itemIsRadius;
    [self.barView reloadChartLine];
    
    JW_BC_WS(this)
    [self.barView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.bottom.centerX.equalTo(this);
        make.width.equalTo(this).with.multipliedBy(item.itemWidthMultiplied);
        make.height.equalTo(this).with.multipliedBy(item.itemMultiplied);
    }];
}



@end


