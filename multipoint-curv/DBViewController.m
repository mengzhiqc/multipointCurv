//
//  DBViewController.m
//  multipoint-curv
//
//  Created by 孟 智 on 14-4-21.
//  Copyright (c) 2014年 LenyeStudio. All rights reserved.
//

#import "DBViewController.h"
#import "DBMultiPointCurvChartView.h"

@interface DBViewController ()

@end

@implementation DBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    DBMultiPointCurvChartView *curv = [[DBMultiPointCurvChartView alloc]initWithFrame:CGRectMake(20, 20, 320, 400)];
    curv.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:curv];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
