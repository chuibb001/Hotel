//
//  ThriftService.h
//  chujian7day
//
//  跟服务器通讯
//
//  Created by yan kai on 13-4-23.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ISevenDaysService.h"
#import "HotelDetail.h"
#import "SVProgressHUD.h"

@class MemberDetail;

@interface ThriftService : NSObject
{
    NSString* host;
    int port;
    
    //ISevenDaysServiceClient* client;
}

+(ThriftService*)shared;

-(void)searchHotel:(SearchRequest*)request success:(void (^)(NSArray* hotelList))success failed:(void (^)(NSString* error))failed;
-(void)getHotelDetail:(HotelRequest*)request success:(void (^)(HotelDetail*))success failed:(void (^)(NSString* error)) failed;

-(void)useLogin:(Signture*)request success:(void (^)(MemberDetail *))success failed:(void (^)(NSString *error))failed;

@end

