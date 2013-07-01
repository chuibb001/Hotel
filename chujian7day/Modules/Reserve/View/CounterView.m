//
//  CounterView.m
//  chujian7day
//
//  Created by simon on 13-4-22.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import "CounterView.h"

#define maxNum 3
#define minNum 1

@implementation CounterView
@synthesize count=_count;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initData];
        [self initButton];
    }
    return self;
}

-(void)initData
{
    self.count=1;
}

-(void)initButton
{
    float height=self.frame.size.height;
    float width=self.frame.size.width;
    float buttonSize=height-10;
    
    // 减
    _minusButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    _minusButton.frame=CGRectMake(5, 5, buttonSize, buttonSize);
    [_minusButton setTitle:@"-" forState:UIControlStateNormal];
    [self addSubview:_minusButton];
    
    // 加
    _addButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    _addButton.frame=CGRectMake(width-buttonSize-5, 5, buttonSize, buttonSize);
    [_addButton setTitle:@"+" forState:UIControlStateNormal];
    [self addSubview:_addButton];
    
    // 值标签
    _counterLabel=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, buttonSize, buttonSize)];
    _counterLabel.center=CGPointMake(width/2, height/2);
    _counterLabel.backgroundColor=[UIColor clearColor];
    _counterLabel.textAlignment=UITextAlignmentCenter;
    [_counterLabel setText:[NSString stringWithFormat:@"%d",_count]];
    [self addSubview:_counterLabel];
    
}

-(Boolean)Add
{
    if(_count>=3)
        return NO;
    else
    {
        _count++;
        [_counterLabel setText:[NSString stringWithFormat:@"%d",_count]];
        return YES;
    }
}
-(Boolean)Minus
{
    if(_count<=1)
        return NO;
    else
    {
        _count--;
        [_counterLabel setText:[NSString stringWithFormat:@"%d",_count]];
        return YES;
    }
}

@end
