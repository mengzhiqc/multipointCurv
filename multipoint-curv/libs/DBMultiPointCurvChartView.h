//
//  DBMultiPointCurv.h
//  multipoint-curv
//
//  Created by 孟 智 on 14-4-21.
//  Copyright (c) 2014年 LenyeStudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DBMultiPointCurvChartView;

@protocol DBMultiPointCurvDataSource <NSObject>


@end
@interface DBMultiPointCurvChartView : UIView
@property (nonatomic) NSArray *points;
@property (nonatomic) float prevDegree;
@end
