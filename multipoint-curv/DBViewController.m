//
//  DBViewController.m
//  multipoint-curv
//
//  Created by 孟 智 on 14-4-21.
//  Copyright (c) 2014年 LenyeStudio. All rights reserved.
//

#import "DBViewController.h"

@interface DBViewController ()

@end

@implementation DBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    DBMultiPointCurvChartView *curv = [[DBMultiPointCurvChartView alloc]initWithFrame:CGRectMake(20, 20, 320, 400)];
    curv.dataSource = self;
    curv.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:curv];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *)dataSourceOfcurvChartView:(DBMultiPointCurvChartView *)curvChartView{
    return @[@0.0,@50.0,@25,@50,@50,@60,@75,@60,@100,@75,@125,@80,@150,@70,@175,@80,@200,@90,@225,@100,@250,@300];
}


@end
