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
#import "JWMaskView.h"
#import "JWXSepartorView.h"

#import "JWBarChartsDefine.h"

#import <Masonry/Masonry.h>

static NSString *kBarChartsCell = @"JWBarChartsViewCollectionViewCellIdentifier";

@interface JWBarChartsView() <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) JWYAxisView *yAxis;
@property (nonatomic, strong) JWMaskView *maskView;
@property (nonatomic, strong) UIView *xAxis;
@property (nonatomic, strong) UICollectionView *chartsCollectionView;
@property (nonatomic, assign) NSInteger firstBarIndex;

@property (nonatomic, assign) BOOL swipeCallback;

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
    self.yMaxScale = 1.1;
    self.yHide = NO;
    self.yLabelTextFont = [UIFont fontWithName:@"Arial" size:13];
    self.yLabelTextColor = [UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1.0];
    self.yAxisColor = [UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1.0];
    
    self.xLabelTextFont = [UIFont fontWithName:@"Arial" size:13];
    self.xLabelTextColor = [UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1.0];
    self.xAxisColor = [UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1.0];
    self.xHide = NO;
    
    self.xSeparatorHide = YES;
    self.xSeparatorColor = [UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1.0];
    
    self.maskTextFont = [UIFont fontWithName:@"Arial" size:13];
    self.maskTextColor = [UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1.0];
    self.maskHide = YES;
    self.maskView.hidden = YES;
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

- (void)setMaskTextFont:(UIFont *)maskTextFont
{
    _maskTextFont = maskTextFont;
    
    self.maskView.maskFont = maskTextFont;
}

- (void)setMaskTextColor:(UIColor *)maskTextColor
{
    _maskTextColor = maskTextColor;
    
    self.maskView.maskTextColor = maskTextColor;
}

- (void)setMaskHide:(BOOL)maskHide
{
    _maskHide = maskHide;
    
    self.maskView.hidden = maskHide;
}

- (void)setXSeparatorHide:(BOOL)xSeparatorHide
{
    _xSeparatorHide = xSeparatorHide;
    
    [self separator];
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

- (JWMaskView *)maskView
{
    if (!_maskView)
    {
        self.maskView = [JWMaskView new];
        _maskView.backgroundColor = [UIColor clearColor];
        _maskView.hidden = YES;
        [self addSubview:_maskView];
        
        JW_BC_WS(this)
        [self.maskView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(this);
        }];
    }
    return _maskView;
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
        _chartsCollectionView.backgroundColor = [UIColor clearColor];
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

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((JW_BARCHARTS_SCREEN_WIDTH - (!self.yHide && self.yLabelTexts.count > 0 ? JW_BARCHARTS_YAXIS_WIDTH : 0))/7.0,
                      CGRectGetHeight(self.frame));
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    JWBarChartsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kBarChartsCell forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor clearColor];
    if (self.items.count > indexPath.row)
    {
        [cell configItem:self.items[indexPath.row]];
    }
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.items.count <= indexPath.row) return;
    
    JWBarChartsItem *tempItem = self.items[indexPath.row];
    !self.barTouch?:self.barTouch(indexPath.row,tempItem);
    
    [self barDidSeleted:indexPath];
}

#pragma mark - UIScrollView Delegate & Datasource
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    self.maskView.hidden = YES;
    self.swipeCallback = YES;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x / ((JW_BARCHARTS_SCREEN_WIDTH - (!self.yHide && self.yLabelTexts.count > 0 ? JW_BARCHARTS_YAXIS_WIDTH : 0)) / 7.0);
    if (index < 0) index = 0;
    if (index == self.firstBarIndex) return;
    
    self.firstBarIndex = index;
    JWBarChartsItem *tempLeftItem = nil;
    JWBarChartsItem *tempRightItem = nil;
    
    if (self.items.count > index)
    {
        tempLeftItem = self.items[index];
    }
    if (self.items.count > (index + 6))
    {
        tempRightItem = self.items[(index + 6)];
    }
    if (self.swipeCallback)
    {
        !self.barDidScroll?:self.barDidScroll(index, tempLeftItem,(index + 6) ,tempRightItem);
    }
}

#pragma mark - Public Method
- (void)reloadCharts
{
    if (self.items.count <= 0)
    {
        [self.chartsCollectionView reloadData];
    }
    else
    {
        // 计算最大值
        [self calculationcMaxValue];
        
        // Y 轴
        if (!self.yHide && self.yLabelTexts.count > 0)
        {
            [self.yAxis reloadYaxis];
        }
        
        // 画柱状图
        for (JWBarChartsItem *tempItem in self.items)
        {
            tempItem.itemValueMax = self.yMax;
        }
        
        [self.chartsCollectionView reloadData];
        
        // X轴
        self.xAxis.hidden = self.xHide;
        
        // Y轴Size调整
        if (!self.yHide && self.yLabelTexts.count > 0)
        {
            [self bringSubviewToFront:self.yAxis];
        }
        JW_BC_WS(this)
        [self.yAxis mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo((!this.yHide && this.yLabelTexts.count > 0) ? JW_BARCHARTS_YAXIS_WIDTH : 0);
        }];
        // 通知页面，重新计算size
        [self layoutIfNeeded];
        // 自动滚动到最后
        [self.chartsCollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:(self.items.count-1)
                                                                              inSection:0]
                                          atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally
                                                  animated:YES];
        self.swipeCallback = NO;
    }
}

- (void)scrollToBar:(NSInteger)index
{
    if (self.items.count > index)
    {
        [self.chartsCollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:index
                                                                              inSection:0]
                                          atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally
                                                  animated:YES];
        self.maskView.hidden = YES;
        self.swipeCallback = NO;
    }
}

- (void)seleteToBar:(NSInteger)index
{
    if (self.items.count > index)
    {
        self.maskView.hidden = YES;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self barDidSeleted:[NSIndexPath indexPathForRow:index inSection:0]];
        });
    }
}

#pragma mark - Helper
- (void)calculationcMaxValue
{
    NSMutableArray *tempArray = [NSMutableArray array];
    for (JWBarChartsItem *tempItem in self.items)
    {
        [tempArray addObject:@(tempItem.itemValuesSum)];
    }
    CGFloat tempMax = [[tempArray valueForKeyPath:@"@max.floatValue"] floatValue] * self.yMaxScale;
    self.yMax = (self.yMax > tempMax) ? self.yMax : tempMax;
}

- (void)barDidSeleted:(NSIndexPath *)indexPath
{
    if (!self.maskHide)
    {
        JWBarChartsItem *tempItem = self.items[indexPath.row];

        // 获取选中的cell
        JWBarChartsCell *tempCell = (JWBarChartsCell *)[self.chartsCollectionView cellForItemAtIndexPath:indexPath];
        // 获取选中cell在表格中的坐标
        CGRect tempRectInChart = [self.chartsCollectionView convertRect:tempCell.frame toView:self.chartsCollectionView];
        // 获取选中cell在外层view上的相对坐标
        CGRect tempRectInSuper = [self.chartsCollectionView convertRect:tempRectInChart toView:self];
        // 刷新内容
        self.maskView.maskFont = tempItem.itemMaskLabelFont;
        self.maskView.maskTextColor = tempItem.itemMaskLabelTextColor;
        [self.maskView reload:tempItem.itemMaskText];
        
        // 计算
        CGFloat tempCenterX = tempRectInSuper.origin.x + tempRectInSuper.size.width / 2.0;
        CGFloat tempMultiplie = (tempCenterX / (CGRectGetWidth(self.frame) <= 0 ? JW_BARCHARTS_SCREEN_WIDTH : CGRectGetWidth(self.frame))) * 2;
        CGFloat tempY = tempRectInSuper.size.height * tempItem.itemMultiplied + 5;
        // 刷新位置
        JW_BC_WS(this)
        [UIView animateWithDuration:0.3 animations:^{
            [self.maskView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.center.equalTo(this).with.multipliedBy(tempMultiplie);
                make.bottom.equalTo(this).with.offset(-tempY);
            }];
            [self layoutIfNeeded];
        } completion:^(BOOL finished) {
            // 显示mask
            self.maskView.hidden = self.maskHide;
        }];
    }
}

- (void)separator
{
    for (UIView *tempView in self.subviews)
    {
        if ([tempView isKindOfClass:[JWXSepartorView class]])
        {
            [tempView removeFromSuperview];
        }
    }
    
    if (self.xSeparatorHide) return;
    
    for (NSInteger i = 0; i < JW_BARCHARTS_X_SEPARTOR_NUM; i++)
    {
        JWXSepartorView *tempLineView = [[JWXSepartorView alloc] init];
        tempLineView.separtorColor = self.xSeparatorColor;
        [self addSubview:tempLineView];
        
        JW_BC_WS(this)
        [tempLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(this);
            make.height.mas_equalTo(1.0/JW_BARCHARTS_SCREEN_SCALE);
            if (i == 0)
            {
                make.top.equalTo(this);
            }
            else
            {
                CGFloat tempM = ((i * 10/ 10.0) * 2) / ((JW_BARCHARTS_X_SEPARTOR_NUM - 1) + 1); // 2n/n+1
                make.centerY.equalTo(this).multipliedBy(tempM);
            }
        }];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
