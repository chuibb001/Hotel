//
//  OrderDetailCell0.m
//  chujian7day
//
//  Created by 王 瑞 on 13-4-21.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import "OrderDetailCell0.h"

@implementation OrderDetailCell0

static UIFont *titleFont=nil;
static UIColor *titleColor;

+(void) initialize
{
    titleFont=[UIFont systemFontOfSize:12];
    titleColor=[UIColor colorWithRed:128.0/255.0 green:128.0/255.0 blue:128.0/255.0 alpha:1.0];
}
- (void)drawContentView:(CGRect)r
{
	CGContextRef context=UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextFillRect(context, CGRectMake(0, 0, self.frame.size.width, self.frame.size.height));
    
    [titleColor set];
    [_OrderNum drawAtPoint:CGPointMake(10, 10) forWidth:150 withFont:titleFont fontSize:12 lineBreakMode:UILineBreakModeTailTruncation baselineAdjustment:UIBaselineAdjustmentAlignCenters];
    [_effect drawAtPoint:CGPointMake(200, 10) forWidth:50 withFont:titleFont fontSize:12 lineBreakMode:UILineBreakModeTailTruncation baselineAdjustment:UIBaselineAdjustmentAlignCenters];
    [_pay drawAtPoint:CGPointMake(250, 10) forWidth:50 withFont:titleFont fontSize:12 lineBreakMode:UILineBreakModeTailTruncation baselineAdjustment:UIBaselineAdjustmentAlignCenters];
}

-(void)setOrderNum:(NSString *)aNum effect:(NSString *)aAffect pay:(NSString *)aPay{
    if (_OrderNum!=aNum) {
        _OrderNum=aNum;
    }
    if (_effect!=aAffect) {
        _effect=aAffect;
    }
    if (_pay!=aPay) {
        _pay=aPay;
    }
    [self setNeedsDisplay];
}

@end
