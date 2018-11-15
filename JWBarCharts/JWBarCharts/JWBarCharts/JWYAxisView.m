//
//  JWYAxisView.m
//  JWBarCharts
//
//  Created by wangjun on 2018/11/14.
//  Copyright © 2018年 wangjun. All rights reserved.
//

#import "JWYAxisView.h"

#import "JWBarChartsDefine.h"
#import <Masonry/Masonry.h>

@implementation JWYAxisView

#pragma mark - Public Method
- (void)reloadYaxis
{
    while (self.subviews.count)
    {
        [self.subviews.lastObject removeFromSuperview];
    }
    
    JW_BC_WS(this)

    UIView *tempLineView = [UIView new];
    tempLineView.backgroundColor = self.bgColor;
    [self addSubview:tempLineView];
    [tempLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.equalTo(this);
        make.bottom.equalTo(this).with.offset(-JW_BARCHARTS_YAXIS_OUT);
        make.width.mas_equalTo(1.0/JW_BARCHARTS_SCREEN_SCALE);
    }];
    NSArray *tempArray = [[self.labelTexts reverseObjectEnumerator] allObjects];
    for (NSInteger i = 0; i < tempArray.count; i++)
    {
        NSString *tempStr = tempArray[i];
        UILabel *tempLabel = [UILabel new];
        tempLabel.backgroundColor = [UIColor clearColor];
        tempLabel.font = self.labelTextFont;
        tempLabel.textColor = self.labelTextColor;
        tempLabel.textAlignment = NSTextAlignmentRight;
        tempLabel.text = tempStr;
        [self addSubview:tempLabel];
        [tempLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(this).with.offset(-5);
            if (i == 0)
            {
                make.top.equalTo(this).with.offset(-5);
            }
            else if (i == tempArray.count - 1)
            {
                make.bottom.equalTo(this).with.offset(-JW_BARCHARTS_YAXIS_OUT + 5);
            }
            else
            {
                CGFloat tempM = ((i * 10/ 10.0) * 2) / ((self.labelTexts.count - 2) + 1); // 2n/n+1
                make.centerY.equalTo(this).multipliedBy(tempM).with.offset(-JW_BARCHARTS_YAXIS_OUT/2.0);
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
