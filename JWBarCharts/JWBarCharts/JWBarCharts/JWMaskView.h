//
//  JWMaskView.h
//  JWBarCharts
//
//  Created by wangjun on 2018/11/16.
//  Copyright © 2018年 wangjun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JWMaskView : UIView

@property (nonatomic, strong) UIFont *maskFont;
@property (nonatomic, strong) UIColor *maskTextColor;

- (void)reload:(NSString *)text;

@end
