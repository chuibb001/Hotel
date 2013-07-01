//
//  HotelMapViewController.m
//  chujian7day
//
//  Created by simon on 13-4-20.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import "HotelMapViewController.h"
#import "LBSManager.h"
#import "HotelListManager.h"
#import "Holder2ViewController.h"

@interface HotelMapViewController ()

@end

@implementation HotelMapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self initMapView];
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    HotelListManager *manager=[HotelListManager sharedInstance];
    hotels=[manager currentHotels];
    
    [self configureAnnotations];
}
-(void)initMapView
{
    map = [[MKMapView alloc]initWithFrame:CGRectMake(0, 24, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:map];
    [map setDelegate:self];
    
    
    
}

-(void)configureAnnotations
{
    NSMutableArray *annotations=[[NSMutableArray alloc] init];
    
    int _tag=0;
    for(Hotel *hotel in hotels)
    {
        HotelAnnotation *ann = [[HotelAnnotation alloc] init];
        CLLocationCoordinate2D coordinate=CLLocationCoordinate2DMake(hotel.latitude,hotel.longitude);
        ann.coordinate=coordinate;
        ann.title = hotel.name;
        ann.tag=_tag;
        
        // subtitle
        NSString *vacantStr;
        if(hotel.vacant)
            vacantStr=@"有房";
        else
            vacantStr=@"已住满";
        
        int price=(int)hotel.price;
        
        NSString *subTitle=[NSString stringWithFormat:@"%@   ￥%d起",vacantStr,price];
        ann.subtitle = subTitle;
        
        [annotations addObject:ann];
        
        _tag++;
    }
    
    [map addAnnotations:annotations];
    
    
    HotelAnnotation *first =[annotations objectAtIndex:0];
    
    [map setRegion:MKCoordinateRegionMake(first.coordinate, MKCoordinateSpanMake(0.5,0.5))];
    
    [map selectAnnotation:first animated:YES];
}
#pragma mark delegate
-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{

    MKPinAnnotationView *pinView = nil;
    
    static NSString *defaultPinID = @"com.invasivecode.pin";
    
    pinView = (MKPinAnnotationView *)[map dequeueReusableAnnotationViewWithIdentifier:defaultPinID];
    
    if ( pinView == nil ) pinView = [[MKPinAnnotationView alloc]
                                     
                                     initWithAnnotation:annotation reuseIdentifier:defaultPinID] ;
    
    pinView.pinColor = MKPinAnnotationColorRed;
    
    pinView.canShowCallout = YES;
    
    pinView.animatesDrop = YES;
    
    HotelAnnotation *ann=annotation;
    pinView.tag=ann.tag;
    
    UIButton *accessoryButton=[UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    
    pinView.rightCalloutAccessoryView=accessoryButton;
    
    return pinView;
}

-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    int index=view.tag;
    // save hotel id to singleton
    Hotel *h=[hotels objectAtIndex:index];
    [ReserveData sharedReserveData].selectedHotel=h;
    [self.delegate Push];
}
@end
