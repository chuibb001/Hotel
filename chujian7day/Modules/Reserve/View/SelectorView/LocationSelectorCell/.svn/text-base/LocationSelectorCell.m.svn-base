//
//  CitySelectorCell.m
//  chujian7day
//
//  Created by simon on 13-5-10.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import "LocationSelectorCell.h"

@implementation LocationSelectorCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        _keyLabel=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 50, 30)];
        _keyLabel.backgroundColor=[UIColor clearColor];
        [self addSubview:_keyLabel];
        
        _valueLabel=[[UILabel alloc] initWithFrame:CGRectMake(80, 10, 100, 30)];
        _valueLabel.backgroundColor=[UIColor clearColor];
        [self addSubview:_valueLabel];
        
        self.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
