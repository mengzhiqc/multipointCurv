//
//  DBMultiPointCurv.m
//  multipoint-curv
//
//  Created by 孟 智 on 14-4-21.
//  Copyright (c) 2014年 LenyeStudio. All rights reserved.
//

#import "DBMultiPointCurv.h"

#define SHOW_CONTROL_POINT NO

@interface DBMultiPointCurv()

@property (nonatomic) float k;
@property (nonatomic) float controlPointX;
@property (nonatomic) float controlPointY;
@property (nonatomic,strong) NSMutableArray *controlPoints;

@end

@implementation DBMultiPointCurv

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    self.points = @[@0.0,@50.0,@25,@50,@50,@60,@75,@60,@100,@75,@125,@80,@150,@70,@175,@80,@200,@90,@225,@100,@250,@100];
    if (self) {
        // Initialization code
        self.k = 0;
        self.controlPoints = [NSMutableArray array];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0);
    CGContextSetLineCap(context, kCGLineCapRound);
    
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGFloat components[] = {0.0,0.0,1.0,1.0};
    CGColorRef  color = CGColorCreate(colorspace, components);
    
    CGContextSetStrokeColorWithColor(context, color);
    
    
    CGContextMoveToPoint(context,[self.points[0] floatValue],[self.points[1] floatValue]);
    CGContextAddArc(context, [self.points[0] floatValue], [self.points[1] floatValue], 2, 0, 2*M_PI, 0);

    
    for (int i=1; i<self.points.count/2; i++) {
        NSLog(@"正在绘制第 %d 个点",i+1);
        float currentPointY = [self.points[i*2+1] floatValue];
        float prePointY = [self.points[i*2-1] floatValue];
        float currentPointX = [self.points[i*2] floatValue];
        float prePointX = [self.points[(i-1)*2] floatValue];
        
        
        
        self.controlPointX = (prePointX + currentPointX)/2;
        if (prePointX < 0.001 && abs(currentPointY - prePointY) < 0.001) {
            self.k = 0;
        }
        
        float b = prePointY - self.k * prePointX;
        self.controlPointY = self.k * self.controlPointX + b;
        
        [self.controlPoints addObject:[NSValue valueWithCGPoint:CGPointMake(self.controlPointX, self.controlPointY)]];
        
        if (DEBUG) {
            NSLog(@"直线方程 y = %f*x+%f",self.k,b);
            NSLog(@"i=%d,self.k:%f   controlPointX:(%f, %f)",i,self.k,self.controlPointX,self.controlPointY);
        }
        

        
        if (i < (self.points.count/2-1)) {
            float nextPointX = [self.points[(i+1)*2] floatValue];
            float nextPointY = [self.points[(i+1)*2+1] floatValue];
            if (prePointX > 0) {
                if (DEBUG) {
                    NSLog(@"CurrentPoint:(%f,%f) NextPoint:(%f,%f)",currentPointX,currentPointY, nextPointX,nextPointY);
                    self.k = (currentPointY-self.controlPointY)/(currentPointX - self.controlPointX);
                }
                

            }

        }

        CGContextAddCurveToPoint(context, self.controlPointX, self.controlPointY, self.controlPointX, self.controlPointY, [self.points[i*2] floatValue], [self.points[i*2+1] floatValue]);
        CGContextAddArc(context, currentPointX, currentPointY, 2, 0, 2*M_PI, 0);
        

    }
    CGContextStrokePath(context);
    
    if (SHOW_CONTROL_POINT) {
        CGContextSaveGState(context);
        CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
        for (int j=0; j<self.controlPoints.count; j++) {
            
            CGPoint pointValue = [[self.controlPoints objectAtIndex:j] CGPointValue];
            CGContextMoveToPoint(context, pointValue.x, pointValue.y);
            CGContextAddArc(context, pointValue.x, pointValue.y, 2, 0, 2 * M_PI, 0);
        }
        CGContextStrokePath(context);
        CGContextFillPath(context);
        CGContextRestoreGState(context);
    }
    
    CGContextSetTextDrawingMode(context, kCGTextFill);
    //标注
    for (int k=0; k<self.points.count/2; k++) {
        NSString *toDraw = [NSString stringWithFormat:@"%@",self.points[k*2+1]];
        [toDraw drawAtPoint:CGPointMake([self.points[k*2] floatValue], [self.points[k*2+1] floatValue]-20) withAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"Helvetica" size:10],
                                                                                                                                        NSForegroundColorAttributeName:[UIColor redColor]
                                                                                                                                        }];
    }
    
}


@end
