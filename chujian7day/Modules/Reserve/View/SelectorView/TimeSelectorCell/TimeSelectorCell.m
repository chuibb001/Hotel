//
//  TimeSelectorView.m
//  chujian7day
//
//  Created by simon on 13-5-10.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import "TimeSelectorCell.h"

@implementation TimeSelectorCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        _keyLabel=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 80, 30)];
        _keyLabel.backgroundColor=[UIColor clearColor];
        _keyLabel.text=@"住    晚:";
        [self addSubview:_keyLabel];
        _numberLabel=[[UILabel alloc] initWithFrame:CGRectMake(38, 10, 30, 30)];
        _numberLabel.backgroundColor=[UIColor clearColor];
        [self addSubview:_numberLabel];
        // 入住时间
        _startTimeLabel=[[UILabel alloc] initWithFrame:CGRectMake(80, 5, 50, 20)];
        _startTimeLabel.font=[UIFont systemFontOfSize:15.0];
        _startTimeLabel.backgroundColor=[UIColor clearColor];
        [self addSubview:_startTimeLabel];
        // 入住星期
        _startWeekLabel=[[UILabel alloc] initWithFrame:CGRectMake(80, 20, 50, 20)];
        _startWeekLabel.backgroundColor=[UIColor clearColor];
        _startWeekLabel.font=[UIFont systemFontOfSize:13.0];
        [self addSubview:_startWeekLabel];
        // “入住”
        UILabel *checkInLabel=[[UILabel alloc] initWithFrame:CGRectMake(110, 20, 50, 20)];
        checkInLabel.backgroundColor=[UIColor clearColor];
        checkInLabel.font=[UIFont systemFontOfSize:13.0];
        checkInLabel.text=@"入住";
        checkInLabel.textColor=[UIColor blueColor];
        [self addSubview:checkInLabel];
        // 选择入住时间
        _startBtn=[UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        _startBtn.center=CGPointMake(150, 25);
        [self addSubview:_startBtn];
        
        // 离店时间
        _endTimeLabel=[[UILabel alloc] initWithFrame:CGRectMake(200, 5, 50, 20)];
        _endTimeLabel.backgroundColor=[UIColor clearColor];
        _endTimeLabel.font=[UIFont systemFontOfSize:15.0];
        [self addSubview:_endTimeLabel];
        // 离店星期
        _endWeekLabel=[[UILabel alloc] initWithFrame:CGRectMake(200, 20, 50, 30)];
        _endWeekLabel.backgroundColor=[UIColor clearColor];
        _endWeekLabel.font=[UIFont systemFontOfSize:13.0];
        [self addSubview:_endWeekLabel];
        // “离店”
        UILabel *checkOutLabel=[[UILabel alloc] initWithFrame:CGRectMake(230, 20, 50, 20)];
        checkOutLabel.backgroundColor=[UIColor clearColor];
        checkOutLabel.font=[UIFont systemFontOfSize:13.0];
        checkOutLabel.textColor=[UIColor blueColor];
        checkOutLabel.text=@"离店";
        [self addSubview:checkOutLabel];
        // 选择离店时间
        _endBtn=[UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        _endBtn.center=CGPointMake(275, 25);
        [self addSubview:_endBtn];
        
        _startBtnClicked=NO;
        _endBtnClicked=NO;
        
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    return self;
}

@end
