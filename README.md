multipointCurv
==============

bezier multipoints curv


## How To Install

If you havn't used cocoapods, please visit [http://cocoapods.org/] to learn the basic usage.

* step1.  execute `pod init` in your command line and open your Podfile
* step2.  add `pod 'DB',:git=>'https://github.com/mengzhiqc/multipointCurv.git'` in your Podfile
* step3.  execute `pod install`


## How To Use 

* import the header file
    
    <pre>#import "DBMultiPointCurvChartView.h"</pre>

* init barChartView and set delegate to current view controller

<pre>

   DBMultiPointCurvChartView *curv = [[DBMultiPointCurvChartView alloc]initWithFrame:CGRectMake(20, 20, 320, 400)];
    curv.dataSource = self;
    curv.backgroundColor = [UIColor whiteColor];

</pre>

please don't forget to add `DBMultiPointCurvDataSource` in your header file.

* add this view as subview

<pre>
    [self.view addSubview:curv];
</pre>

* result as follow

![Alt Result](Docs/screenshot.png)

* we have provided some delegate so that you can change color and some other properties of chart view

<pre>
    - (NSArray *)dataSourceOfcurvChartView:(DBMultiPointCurvChartView *)curvChartView;
</pre>


