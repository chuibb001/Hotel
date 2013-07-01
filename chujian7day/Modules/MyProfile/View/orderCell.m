//
//  orderCell.m
//  chujian7day
//
//  Created by 王 瑞 on 13-4-20.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import "orderCell.h"

@implementation orderCell

static UIFont *titleFont=nil;
static UIColor *titleColor;


+(void) initialize
{
    titleFont=[UIFont systemFontOfSize:12];
    titleColor=[UIColor colorWithRed:128.0/255.0 green:128.0/255.0 blue:128.0/255.0 alpha:1.0];
}
-(void)setOrderNo:(NSString *)aOrderNo address:(NSString *)aAddress date:(NSString *)aDate{
    if (_orderNo!=aOrderNo) {
        _orderNo=aOrderNo;
    }
    if (_address!=aAddress) {
        _address=aAddress;
    }
    if (_orderDate!=aDate) {
        _orderDate=aDate;
    }
    
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
-(void)drawContentView:(CGRect)r
{
    CGContextRef context=UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextFillRect(context, CGRectMake(0, 0, self.frame.size.width, self.frame.size.height));
    
    [titleColor set];
    [_orderNo drawAtPoint:CGPointMake(10, 5) forWidth:200.0f withFont:titleFont fontSize:12 lineBreakMode:UILineBreakModeTailTruncation baselineAdjustment:UIBaselineAdjustmentAlignCenters];
     [_address drawAtPoint:CGPointMake(10, 20) forWidth:200.0f withFont:titleFont fontSize:12 lineBreakMode:UILineBreakModeTailTruncation baselineAdjustment:UIBaselineAdjustmentAlignCenters];
     [_orderDate drawAtPoint:CGPointMake(10, 35) forWidth:200.0f withFont:titleFont fontSize:12 lineBreakMode:UILineBreakModeTailTruncation baselineAdjustment:UIBaselineAdjustmentAlignCenters];
}


@end
