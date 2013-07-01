//
//  HotelPicCell.m
//  chujian7day
//
//  Created by simon on 13-4-19.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import "HotelPicCell.h"
#import "UIImageView+WebCache.h"

#define imageWidth 150
#define imageHeight 100

@implementation HotelPicCell

-(id)initWithImages:(NSArray *)images
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    if (self) {
        // Initialization code
        _images=images;
        [self initData];
        [self initScrollView];
        [self initImageView];
    }
    return self;
}

#pragma mark init
-(void)initScrollView
{
    _imageScrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, _height)];
    int count=[_images count];
    // 四舍五入
    double dnumber=round((double)count/2);
    int number=(int)dnumber;
    
    [_imageScrollView setContentSize:CGSizeMake(number *320, _height)];
    _imageScrollView.pagingEnabled=YES;
    [self addSubview:_imageScrollView];
}

-(void)initData
{
    self.isOpen=YES;
    _height=115.0;
    _imageviews=[[NSMutableArray alloc] init];
}

-(void)initImageView
{
    int count=[_images count];
    UIImage *placeHolder=[UIImage imageNamed:@"placeholder.png"];
    for(int i=0;i<count;i++)
    {
        UIImageView *imageView=[[UIImageView alloc] initWithFrame:CGRectMake(5+(i*(imageWidth+10)), 5, imageWidth, imageHeight)];
        //NSLog(@"%@",[_images objectAtIndex:i]);
        [imageView setImageWithURL:[_images objectAtIndex:i] placeholderImage:placeHolder];
        [_imageviews addObject:imageView];
        [_imageScrollView addSubview:imageView];
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
