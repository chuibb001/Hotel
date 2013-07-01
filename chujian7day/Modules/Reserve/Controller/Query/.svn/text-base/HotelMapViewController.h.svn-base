//
//  HotelMapViewController.h
//  chujian7day
//
//  Created by simon on 13-4-20.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "HotelAnnotation.h"
#import "ReserveQueryResultViewController.h"
#import "PushHelperProtocol.h"

@protocol PushHelperProtocol;

@interface HotelMapViewController : UIViewController<MKMapViewDelegate>
{
    MKMapView *map;
    NSMutableArray *hotels;
}

@property (nonatomic,weak) id<PushHelperProtocol> delegate;

@end
