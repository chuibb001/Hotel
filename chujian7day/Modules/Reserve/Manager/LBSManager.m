//
//  LBSManager.m
//  chujian7day
//
//  Created by simon on 13-5-14.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import "LBSManager.h"
@implementation LocationObject
@end

@implementation LBSManager

static LBSManager *instance = nil;

// singleton
+(LBSManager*)sharedLBSManager
{
    if (instance == nil) {
        instance = [[LBSManager alloc] init];
    }
	return instance;
}

-(id)init
{
    self = [super init];
    if (self) {
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        _locationManager.distanceFilter = 1000.0f;
    }
    return self;
}

#pragma mark - 定位
-(void)startLocate
{
    [_locationManager startUpdatingLocation];
}

-(void)cancleLocate
{
    [_locationManager stopUpdatingLocation];
}

-(BOOL)isAbleLocate
{
    return YES;
}

#pragma mark - location Delegate
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"定位出错");
}

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    if (!newLocation) {
        [self locationManager:manager didFailWithError:(NSError *)NULL];
        return;
    }
    
    if (signbit(newLocation.horizontalAccuracy)) {
		[self locationManager:manager didFailWithError:(NSError *)NULL];
		return;
	}
    
    [manager stopUpdatingLocation];
    
    NSLog(@"%f,%f",newLocation.coordinate.latitude,newLocation.coordinate.longitude);
    _object.position = newLocation.coordinate;

}
@end
