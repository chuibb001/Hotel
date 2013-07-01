//
//  HotelPicCell.m
//  chujian7day
//
//  Created by simon on 13-4-19.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import "HotelPicCell.h"

@implementation HotelPicCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.imageScrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        [self addSubview:self.imageScrollView];
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
