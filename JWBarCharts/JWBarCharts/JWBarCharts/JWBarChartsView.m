//
//  JWBarChartsView.m
//  JWBarCharts
//
//  Created by wangjun on 2018/11/14.
//  Copyright © 2018年 wangjun. All rights reserved.
//

#import "JWBarChartsView.h"

#import "JWYAxisView.h"
#import "JWBarChartsItem.h"
#import "JWBarChartsCell.h"

#import "JWBarChartsDefine.h"

#import <Masonry/Masonry.h>

static NSString *kBarChartsCell = @"JWBarChartsViewCollectionViewCellIdentifier";

@interface JWBarChartsView() <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) JWYAxisView *yAxis;
@property (nonatomic, strong) UIView *xAxis;
@property (nonatomic, strong) UICollectionView *chartsCollectionView;

@end

@implementation JWBarChartsView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self configDefaultProperty];
    }
    return self;
}

- (void)configDefaultProperty
{
    self.yMin = 0;
    self.yHide = NO;
    self.yLabelCount = 5;
    self.yLabelTextFont = [UIFont fontWithName:@"Arial" size:13];
    self.yLabelTextColor = [UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1.0];
    self.yAxisColor = [UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1.0];
    
    self.xLabelTextFont = [UIFont fontWithName:@"Arial" size:13];
    self.xLabelTextColor = [UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1.0];
    self.xAxisColor = [UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1.0];
    self.xHide = NO;
}

- (void)setYMax:(CGFloat)yMax
{
    _yMax = yMax;
    
    self.yAxis.maxValue = yMax;
}

- (void)setYMin:(NSInteger)yMin
{
    _yMin = yMin;
    
    self.yAxis.minValue = yMin;
}

- (void)setYAxisColor:(UIColor *)yAxisColor
{
    _yAxisColor = yAxisColor;
    
    self.yAxis.bgColor = yAxisColor;
}

- (void)setYLabelCount:(NSInteger)yLabelCount
{
    _yLabelCount = yLabelCount;
    
    self.yAxis.labelCount = yLabelCount;
}

- (void)setYLabelTextFont:(UIFont *)yLabelTextFont
{
    _yLabelTextFont = yLabelTextFont;
    
    self.yAxis.labelTextFont = yLabelTextFont;
}

- (void)setYLabelTextColor:(UIColor *)yLabelTextColor
{
    _yLabelTextColor = yLabelTextColor;
    
    self.yAxis.labelTextColor = yLabelTextColor;
}

- (void)setYLabelTexts:(NSArray *)yLabelTexts
{
    _yLabelTexts = yLabelTexts;
    
    self.yAxis.labelTexts = yLabelTexts;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
    self.yAxis.backgroundColor = backgroundColor;
}

#pragma mark - Lazy loading
- (JWYAxisView *)yAxis
{
    if (!_yAxis)
    {
        self.yAxis = [JWYAxisView new];
        _yAxis.backgroundColor = self.backgroundColor;
        [self addSubview:_yAxis];
        
        JW_BC_WS(this)
        [self.yAxis mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(this);
            make.bottom.equalTo(this).with.offset(JW_BARCHARTS_YAXIS_OUT);
            make.width.mas_equalTo(JW_BARCHARTS_YAXIS_WIDTH);
        }];
    }
    return _yAxis;
}

- (UIView *)xAxis
{
    if (!_xAxis)
    {
        self.xAxis = [UIView new];
        _xAxis.backgroundColor = self.xAxisColor;
        [self addSubview:_xAxis];
        
        JW_BC_WS(this)
        [self.xAxis mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(this.chartsCollectionView);
            make.height.mas_equalTo(1.0/JW_BARCHARTS_SCREEN_SCALE);
        }];
    }
    return _xAxis;
}

- (UICollectionView *)chartsCollectionView
{
    if (!_chartsCollectionView)
    {
        UICollectionViewFlowLayout *tempLayout = [[UICollectionViewFlowLayout alloc] init];
        tempLayout.itemSize = CGSizeMake((JW_BARCHARTS_SCREEN_WIDTH - JW_BARCHARTS_YAXIS_WIDTH)/7.0,
                                         CGRectGetHeight(self.frame));
        tempLayout.minimumLineSpacing = 0;
        tempLayout.minimumInteritemSpacing = 0;
        tempLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        self.chartsCollectionView = [[UICollectionView alloc] initWithFrame:self.bounds
                                                       collectionViewLayout:tempLayout];
        _chartsCollectionView.backgroundColor = self.backgroundColor;
        _chartsCollectionView.delegate = self;
        _chartsCollectionView.dataSource = self;
        _chartsCollectionView.showsHorizontalScrollIndicator = NO;
        _chartsCollectionView.clipsToBounds = NO;
        [_chartsCollectionView registerClass:[JWBarChartsCell class] forCellWithReuseIdentifier:kBarChartsCell];
        [self addSubview:_chartsCollectionView];
        
        JW_BC_WS(this)
        [self.chartsCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(this.yAxis.mas_right);
            make.top.bottom.right.equalTo(this);
        }];
    }
    return _chartsCollectionView;
}

#pragma mark - UICollectionView Delegate & Datasource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    JWBarChartsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kBarChartsCell forIndexPath:indexPath];
    
    if (self.items.count > indexPath.row)
    {
        [cell configItem:self.items[indexPath.row]];
    }
    
    return cell;
}

#pragma mark - Public Method
- (void)reloadCharts
{
    if (self.items.count <= 0) return;
    
    if (!self.yHide && self.yLabelTexts.count > 0)
    {
        [self calculationcMaxValue];

        [self.yAxis reloadYaxis];
    }
    
    for (JWBarChartsItem *tempItem in self.items)
    {
        tempItem.itemValueMax = self.yMax;
    }
    
    [self.chartsCollectionView reloadData];
    
    self.xAxis.hidden = self.xHide;
    
    if (!self.yHide && self.yLabelTexts.count > 0)
    {
        [self bringSubviewToFront:self.yAxis];
    }
    JW_BC_WS(this)
    [self.yAxis mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo((!this.yHide && this.yLabelTexts.count > 0) ? JW_BARCHARTS_YAXIS_WIDTH : 0);
    }];
}

#pragma mark - Helper
- (void)calculationcMaxValue
{
    NSMutableArray *tempArray = [NSMutableArray array];
    for (JWBarChartsItem *tempItem in self.items)
    {
        [tempArray addObject:@(tempItem.itemValuesSum)];
    }
    CGFloat tempMax = [[tempArray valueForKeyPath:@"@max.floatValue"] floatValue];
    self.yMax = (self.yMax > tempMax) ? self.yMax : tempMax;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
