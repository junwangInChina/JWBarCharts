# JWBarCharts
项目中自研的一款柱状体，使用简单

![123](https://github.com/junwangInChina/JWBarCharts/blob/master/JWBarCharts/JWBarCharts/screenshot/1.png)
![123](https://github.com/junwangInChina/JWBarCharts/blob/master/JWBarCharts/JWBarCharts/screenshot/3.png)
![123](https://github.com/junwangInChina/JWBarCharts/blob/master/JWBarCharts/JWBarCharts/screenshot/2.png)


```
JWBarChartsView *tempBarView = [JWBarChartsView new];
tempBarView.yMax = 24;
tempBarView.backgroundColor = [UIColor whiteColor];
tempBarView.marginTop = 10;
tempBarView.marginBottom = 20;
tempBarView.maskHide = YES;
tempBarView.yHide = YES;
tempBarView.xSeparatorHide = NO;
tempBarView.maskTextAlignment = NSTextAlignmentLeft;
tempBarView.barType = JWBarChartsBarTypeStacking;
tempBarView.barWidthMultiplied = 0.6;
tempBarView.barDefaultWidth = 50;
tempBarView.chartOpenItemSelected = YES;
[self.view addSubview:tempBarView];
```
