//
//  HotelPicCell.h
//  chujian7day
//
//  Created by simon on 13-4-19.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HotelPicCell : UITableViewCell
{
    UIScrollView *_imageScrollView;
    float _height;
    NSArray *_images;
    NSMutableArray *_imageviews;
}

@property (nonatomic ,assign) Boolean isOpen;
@property (nonatomic ,assign) float height;
//@property (nonatomic ,strong) UIScrollView *imageScrollView;

-(id)initWithImages:(NSArray *)images;

@end
