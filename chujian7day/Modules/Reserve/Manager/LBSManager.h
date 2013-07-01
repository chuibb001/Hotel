//
//  LBSManager.h
//  chujian7day
//
//  Created by simon on 13-5-14.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface LocationObject : NSObject
{
    CLLocationCoordinate2D _position;
}

@property (nonatomic,assign) CLLocationCoordinate2D position;

@end


@interface LBSManager : NSObject <CLLocationManagerDelegate>
{
    CLLocationManager *_locationManager;
    LocationObject *_object;
}

@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) LocationObject *object;

+(LBSManager *)sharedLBSManager;

- (void)startLocate;
- (void)cancleLocate;
- (BOOL)isAbleLocate;

@end
