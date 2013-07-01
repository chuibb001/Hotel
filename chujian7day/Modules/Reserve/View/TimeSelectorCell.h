//
//  TimeSelectorView.h
//  chujian7day

//  选择时间段的View

//  Created by simon on 13-5-10.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeSelectorCell : UITableViewCell
{
    UILabel *_keyLabel;
    UILabel *_numberLabel;
    UILabel *_startTimeLabel;
    UILabel *_startWeekLabel;
    UILabel *_endTimeLabel;
    UILabel *_endWeekLabel;
    UIButton *_startBtn;
    UIButton *_endBtn;
}

@property (nonatomic,strong) UILabel *keyLabel;
@property (nonatomic,strong) UILabel *numberLabel;
@property (nonatomic,strong) UILabel *startTimeLabel;
@property (nonatomic,strong) UILabel *startWeekLabel;
@property (nonatomic,strong) UILabel *endTimeLabel;
@property (nonatomic,strong) UILabel *endWeekLabel;
@property (nonatomic,strong) UIButton *startBtn;
@property (nonatomic,strong) UIButton *endBtn;

@end
