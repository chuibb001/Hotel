//
//  HotelDetailCell.m
//  chujian7day
//
//  Created by simon on 13-4-19.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import "HotelDetailCell.h"

#define maxWidth 300

@implementation HotelDetailCell

-(id)initWithContent:(NSString *)details
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    if (self) {
        // Initialization code
        self.detailString=details;
        NSLog(@"%@",self.detailString);
        self.isOpen=YES;
        self.height=100.0;
        [self initLabel];
    }
    return self;
}

-(void)initLabel
{
    UIFont *font=[UIFont systemFontOfSize:15.0];
    self.detailLabel=[[UILabel alloc] init];
    self.detailLabel.font=font;
    self.detailLabel.backgroundColor=[UIColor clearColor];
    self.detailLabel.text=self.detailString;
    //self.detailLabel.lineBreakMode=UILineBreakModeWordWrap;
    self.detailLabel.numberOfLines=0;
    CGSize size=[self.detailString sizeWithFont:font constrainedToSize:CGSizeMake(maxWidth, 1000)];
    self.detailLabel.frame=CGRectMake(5, 5, maxWidth, size.height);
    self.height=size.height+10;
    [self addSubview:self.detailLabel];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
