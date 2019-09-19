//
//  JWBarChartsCell.h
//  JWBarCharts
//
//  Created by wangjun on 2018/11/15.
//  Copyright © 2018年 wangjun. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JWBarChartsItem;

@interface JWBarChartsCell : UICollectionViewCell

- (void)configItem:(JWBarChartsItem *)item selected:(BOOL)selected;

@end
