//
//  AssetCell.m
//  chujian7day
//
//  Created by 王 瑞 on 13-4-26.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import "AssetCell.h"

@implementation AssetCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _title=[[UILabel alloc] initWithFrame:CGRectMake(5, 5, 125, 30)];
        _title.font=[UIFont systemFontOfSize:12.0];
        _title.textColor=TitleColor;
        [self addSubview:_title];
        
        _count=[[UILabel alloc] initWithFrame:CGRectMake(5, 40, 125, 30)];
        _count.textColor=[UIColor blueColor];
        _count.font=[UIFont systemFontOfSize:15.0];
        [self addSubview:_count];
    }
    return self;
}

-(void)setTitle:(NSString *)aTitle setCount:(NSString *)aCount{
    _title.text=aTitle;
    _count.text=aCount;
    [self setNeedsDisplay];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
