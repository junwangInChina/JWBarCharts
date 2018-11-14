//
//  JWYAxisView.h
//  JWBarCharts
//
//  Created by wangjun on 2018/11/14.
//  Copyright © 2018年 wangjun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JWYAxisView : UIView

- (void)reloadYaxis:(CGFloat)max
                min:(CGFloat)min
         labelCount:(NSInteger)labelCount
         labelTexts:(NSString *)labelTexts;

@end
