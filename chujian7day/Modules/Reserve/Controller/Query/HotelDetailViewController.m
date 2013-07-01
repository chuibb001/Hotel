//
//  HotelDetailViewController.m
//  chujian7day
//
//  酒店详情
//
//  Created by yan kai on 13-4-17.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import "HotelDetailViewController.h"

@interface HotelDetailViewController ()

@end

@implementation HotelDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self initMapView];
}
-(void)initMapView
{
    map = [[MKMapView alloc]initWithFrame:CGRectMake(0, 24, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:map];
    [map setDelegate:self];
    
    ReserveData *data=[ReserveData sharedReserveData];
    HotelDetail *hd=data.detailData;
    
    CLLocationCoordinate2D coordinate=CLLocationCoordinate2DMake(hd.latitude,hd.longitude);
    
    HotelAnnotation *ann = [[HotelAnnotation alloc] init];
    //[map addAnnotation:ann];
    ann.coordinate=coordinate;
    ann.title = hd.name;
    ann.subtitle = hd.address;
    
    NSArray * arr =[[NSArray alloc] initWithObjects:ann, nil];
    
    [map addAnnotations:arr];
    
    [map setRegion:MKCoordinateRegionMake(ann.coordinate, MKCoordinateSpanMake(0.3,0.3))];
    [map selectAnnotation:ann animated:YES];
    
    //[map selectAnnotation:ann2 animated:YES];
}

#pragma mark delegate
-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    
    MKPinAnnotationView *pinView = nil;
    
    static NSString *defaultPinID = @"com.invasivecode.pin";
    
    pinView = (MKPinAnnotationView *)[map dequeueReusableAnnotationViewWithIdentifier:defaultPinID];
    
    if ( pinView == nil ) pinView = [[MKPinAnnotationView alloc]
                                     
                                     initWithAnnotation:annotation reuseIdentifier:defaultPinID] ;
    
    pinView.pinColor = MKPinAnnotationColorRed;
    
    pinView.canShowCallout = YES;
    
    pinView.animatesDrop = YES;
    
    //UIButton *accessoryButton=[UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    
    //pinView.rightCalloutAccessoryView=accessoryButton;
    
    return pinView;
}



@end
