//
//  HotelDetailCell.m
//  chujian7day
//
//  Created by simon on 13-4-19.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import "HotelDetailCell.h"

@implementation HotelDetailCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.detailLabel=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        self.detailLabel.font=[UIFont boldSystemFontOfSize:15.0];
        self.detailLabel.backgroundColor=[UIColor clearColor];
        self.detailLabel.text=self.detailString;
        [self addSubview:self.detailLabel];
        self.isOpen=YES;
        self.height=100.0;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
