//
//  HotelDetailViewController.h
//  chujian7day

//  用户目前浏览的酒店的地图位置

//  Created by yanyu on 13-4-17.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "HotelAnnotation.h"
#import "ReserveData.h"

@interface HotelDetailViewController : UIViewController<MKMapViewDelegate>
{
    MKMapView *map;
}

@end
