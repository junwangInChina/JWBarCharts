//
//  ViewController.m
//  JWBarCharts
//
//  Created by wangjun on 2018/11/14.
//  Copyright © 2018年 wangjun. All rights reserved.
//

#import "ViewController.h"

#import "JWBarCharts/JWBarCharts.h"

#import <Masonry/Masonry.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self configBaseBarCharts];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configBaseBarCharts
{
    JWBarChartsView *tempBarView = [JWBarChartsView new];
    tempBarView.yMax = 24;
    tempBarView.backgroundColor = [UIColor whiteColor];
//    tempBarView.yLabelTexts = @[@"0",@"6",@"12",@"18",@"24"];
//    tempBarView.maskHide = NO;
//    tempBarView.xSeparatorHide = NO;
    [self.view addSubview:tempBarView];
    __weak __typeof(&*self)this = self;
    [tempBarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(this.view);
        make.top.equalTo(this.view).with.offset(100);
        make.height.mas_equalTo(400);
    }];
    
    tempBarView.barTouch = ^(JWBarChartsItem *item) {
        //NSLog(@"点击了 %@:",item.itemXaisText);
    };
    tempBarView.barDidScroll = ^(JWBarChartsItem *leftItem, JWBarChartsItem *rightItem) {
        //NSLog(@"滑动到 %@:",leftItem.itemXaisText);
    };
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        NSMutableArray *tempArray = [NSMutableArray array];
        JWBarChartsItem *tempItem = [JWBarChartsItem new];
        tempItem.itemValues = @[@(5),@(1)];
        tempItem.itemBackgroundColors = @[[UIColor colorWithRed:155.0/255.0 green:156.0/255.0 blue:170.0/255.0 alpha:0.8],[UIColor colorWithRed:255.0/255.0 green:137.0/255.0 blue:1.0/255.0 alpha:1.0]];
        tempItem.itemXaisText = @"08-01";
        tempItem.itemValueLabelText = @"6时";
        [tempArray addObject:tempItem];
        
        JWBarChartsItem *tempItem2 = [JWBarChartsItem new];
        tempItem2.itemValues = @[@(7),@(2)];
        tempItem2.itemBackgroundColors = @[[UIColor colorWithRed:155.0/255.0 green:156.0/255.0 blue:170.0/255.0 alpha:0.8],[UIColor colorWithRed:255.0/255.0 green:137.0/255.0 blue:1.0/255.0 alpha:1.0]];
        tempItem2.itemXaisText = @"08-02";
        tempItem2.itemValueLabelText = @"9时";
        [tempArray addObject:tempItem2];
        
        JWBarChartsItem *tempItem3 = [JWBarChartsItem new];
        tempItem3.itemValues = @[@(3),@(4)];
        tempItem3.itemBackgroundColors = @[[UIColor colorWithRed:155.0/255.0 green:156.0/255.0 blue:170.0/255.0 alpha:0.8],[UIColor colorWithRed:255.0/255.0 green:137.0/255.0 blue:1.0/255.0 alpha:1.0]];
        tempItem3.itemXaisText = @"08-03";
        tempItem3.itemValueLabelText = @"7时";
        [tempArray addObject:tempItem3];
        
        JWBarChartsItem *tempItem4 = [JWBarChartsItem new];
        tempItem4.itemValues = @[@(9),@(1)];
        tempItem4.itemBackgroundColors = @[[UIColor colorWithRed:155.0/255.0 green:156.0/255.0 blue:170.0/255.0 alpha:0.8],[UIColor colorWithRed:255.0/255.0 green:137.0/255.0 blue:1.0/255.0 alpha:1.0]];
        tempItem4.itemXaisText = @"08-04";
        tempItem4.itemValueLabelText = @"10时";
        [tempArray addObject:tempItem4];
        
        JWBarChartsItem *tempItem5 = [JWBarChartsItem new];
        tempItem5.itemValues = @[@(11),@(1)];
        tempItem5.itemBackgroundColors = @[[UIColor colorWithRed:155.0/255.0 green:156.0/255.0 blue:170.0/255.0 alpha:0.8],[UIColor colorWithRed:255.0/255.0 green:137.0/255.0 blue:1.0/255.0 alpha:1.0]];
        tempItem5.itemXaisText = @"08-05";
        tempItem5.itemValueLabelText = @"12时";
        [tempArray addObject:tempItem5];
        
        JWBarChartsItem *tempItem6 = [JWBarChartsItem new];
        tempItem6.itemValues = @[@(17),@(3)];
        tempItem6.itemBackgroundColors = @[[UIColor colorWithRed:155.0/255.0 green:156.0/255.0 blue:170.0/255.0 alpha:0.8],[UIColor colorWithRed:255.0/255.0 green:137.0/255.0 blue:1.0/255.0 alpha:1.0]];
        tempItem6.itemXaisText = @"08-06";
        tempItem6.itemValueLabelText = @"20时";
        [tempArray addObject:tempItem6];
        
        JWBarChartsItem *tempItem7 = [JWBarChartsItem new];
        tempItem7.itemValues = @[@(12),@(5)];
        tempItem7.itemBackgroundColors = @[[UIColor colorWithRed:155.0/255.0 green:156.0/255.0 blue:170.0/255.0 alpha:0.8],[UIColor colorWithRed:255.0/255.0 green:137.0/255.0 blue:1.0/255.0 alpha:1.0]];
        tempItem7.itemXaisText = @"08-07";
        tempItem7.itemValueLabelText = @"17时";
        [tempArray addObject:tempItem7];
        
        JWBarChartsItem *tempItem8 = [JWBarChartsItem new];
        tempItem8.itemValues = @[@(18),@(1)];
        tempItem8.itemBackgroundColors = @[[UIColor colorWithRed:155.0/255.0 green:156.0/255.0 blue:170.0/255.0 alpha:0.8],[UIColor colorWithRed:255.0/255.0 green:137.0/255.0 blue:1.0/255.0 alpha:1.0]];
        tempItem8.itemXaisText = @"08-08";
        tempItem8.itemValueLabelText = @"19时";
        [tempArray addObject:tempItem8];
        
        JWBarChartsItem *tempItem9 = [JWBarChartsItem new];
        tempItem9.itemValues = @[@(5),@(1)];
        tempItem9.itemBackgroundColors = @[[UIColor colorWithRed:155.0/255.0 green:156.0/255.0 blue:170.0/255.0 alpha:0.8],[UIColor colorWithRed:255.0/255.0 green:137.0/255.0 blue:1.0/255.0 alpha:1.0]];
        tempItem9.itemXaisText = @"08-09";
        tempItem9.itemValueLabelText = @"6时";
        [tempArray addObject:tempItem9];
        
        JWBarChartsItem *tempItem10 = [JWBarChartsItem new];
        tempItem10.itemValues = @[@(15),@(3)];
        tempItem10.itemBackgroundColors = @[[UIColor colorWithRed:155.0/255.0 green:156.0/255.0 blue:170.0/255.0 alpha:0.8],[UIColor colorWithRed:255.0/255.0 green:137.0/255.0 blue:1.0/255.0 alpha:1.0]];
        tempItem10.itemXaisText = @"08-10";
        tempItem10.itemValueLabelText = @"18时";
        [tempArray addObject:tempItem10];
        
        JWBarChartsItem *tempItem11 = [JWBarChartsItem new];
        tempItem11.itemValues = @[@(0),@(0)];
        tempItem11.itemBackgroundColors = @[[UIColor colorWithRed:155.0/255.0 green:156.0/255.0 blue:170.0/255.0 alpha:0.8],[UIColor colorWithRed:255.0/255.0 green:137.0/255.0 blue:1.0/255.0 alpha:1.0]];
        tempItem11.itemXaisText = @"08-11";
        tempItem11.itemValueLabelText = @"0时";
        [tempArray addObject:tempItem11];

        JWBarChartsItem *tempItem12 = [JWBarChartsItem new];
        tempItem12.itemValues = @[@(1),@(3)];
        tempItem12.itemBackgroundColors = @[[UIColor colorWithRed:155.0/255.0 green:156.0/255.0 blue:170.0/255.0 alpha:0.8],[UIColor colorWithRed:255.0/255.0 green:137.0/255.0 blue:1.0/255.0 alpha:1.0]];
        tempItem12.itemXaisText = @"08-12";
        tempItem12.itemValueLabelText = @"4时";
        [tempArray addObject:tempItem12];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            tempBarView.items = tempArray;
            [tempBarView reloadCharts];
            
            [tempBarView seleteToBar:[tempArray count] - 1];
        });
    });
}


@end
