//
//  ThriftService.m
//  chujian7day
//
//  Created by yan kai on 13-4-23.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import "ThriftService.h"
#import "TSocketClient.h"
#import "TBinaryProtocol.h"
#import "THTTPClient.h"
#import "HotelDetail.h"
#import "MemberDetail.h"

@implementation ThriftService

+ (ThriftService*)shared
{
    static ThriftService* _instance;
    if(_instance == nil) {
        _instance = [[ThriftService alloc] init];
    }
    return _instance;
}

- (id)init
{
    self = [super init];
    if(self) {
#ifdef _debug_
        host = @"121.199.12.17";  //58.61.218.78：8182  //121.199.12.17:7200
        port = 7200;
        //host = @"58.61.218.78";
        //port = 8182;
#else
        host = @"";
        port = 8009;
#endif
        
        //client = [self getClient];
    }
    
    return self;
}

- (ISevenDaysServiceClient*)getSocketClient
{
    TSocketClient* transport = [[TSocketClient alloc] initWithHostname:host port:port];
    TBinaryProtocol *protocol = [[TBinaryProtocol alloc] initWithTransport:transport strictRead:YES strictWrite:YES];
    return [[ISevenDaysServiceClient alloc] initWithProtocol:protocol];
}

- (ISevenDaysServiceClient*)getHttpClient
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@:%d/sevendays", host, port]];
    THTTPClient *transport = [[THTTPClient alloc] initWithURL:url];
    TBinaryProtocol *protocol = [[TBinaryProtocol alloc]
                                 initWithTransport:transport
                                 strictRead:YES
                                 strictWrite:YES];
    return [[ISevenDaysServiceClient alloc] initWithProtocol:protocol];
}

- (ISevenDaysServiceClient*)getClient
{
    return [self getHttpClient];
}

#pragma mark 查询酒店
-(void)searchHotel:(SearchRequest*)request success:(void (^)(NSArray* hotelList))success failed:(void (^)(NSString* error))failed
{
    @try {
        ISevenDaysServiceClient* client = [self getClient];
        NSArray* hotelList =  [client search:request];
        success(hotelList);
    }
    @catch (NSException* e) {
        failed([NSString stringWithFormat:@"查询酒店失败:%@", e]);
    }
}

- (void)getHotelDetail:(HotelRequest*)request success:(void (^)(HotelDetail*))success failed:(void (^)(NSString* error)) failed
{
    @try {
        ISevenDaysServiceClient* client = [self getClient];
        Hotel* hotel = [client getHotelDetails:request];
        HotelDetail* hotelDetail = [[HotelDetail alloc] initWithHotel:hotel];
        success(hotelDetail);
    }
    @catch (NSException* e) {
        failed([NSString stringWithFormat:@"获取酒店详情失败:%@", e]);
    }
}

#pragma  mark- Member
-(void)useLogin:(Signture*)request success:(void (^)(MemberDetail *))success failed:(void (^)(NSString *error))failed{
    @try{
        ISevenDaysServiceClient *client = [self getClient];
        Credential *memberLogin = [client login:request];
        [[NSUserDefaults standardUserDefaults] setObject:memberLogin.token forKey:@"token"];
        NSLog(@"%@",memberLogin.token);
        MemberDetail *detail = [[MemberDetail alloc] initWithMember:memberLogin.member];
        
//        NSDictionary *dictOfUser = [[NSDictionary alloc] init];
//        [dictOfUser setValue:detail.name forKey:@"name"];
//        [dictOfUser setValue:detail.memberid forKey:@"memberID"];
//        [dictOfUser setValue:detail.birthday forKey:@"birthday"];
//        [dictOfUser setValue:detail.idCard forKey:@"idCard"];
//        [dictOfUser setValue:detail.memberCard forKey:@"memberCard"];
//        [dictOfUser setValue:detail.phone forKey:@"phone"];
//        if (detail.phoneVerified) {
//            [dictOfUser setValue:@"0" forKey:@"phoneVerified"];
//        }else{
//            [dictOfUser setValue:@"1" forKey:@"phoneVerified"];
//        }
//        [dictOfUser setValue:detail.email forKey:@"email"];
//        [dictOfUser setValue:detail.level forKey:@"level"];
//        if (detail.isMale) {
//            [dictOfUser setValue:@"0" forKey:@"isMale"];
//        }else{
//            [dictOfUser setValue:@"1" forKey:@"isMale"];
//        }
//        [dictOfUser setValue:[NSString stringWithFormat:@"%d",detail.memberType] forKey:@"memberType"];
//        if (detail.isPayTrain) {
//            [dictOfUser setValue:@"0" forKey:@"isPayTrain"];
//        }else{
//            [dictOfUser setValue:@"1" forKey:@"isPayTrain"];
//        }
        NSDictionary *dictOfUser = [[NSDictionary alloc] initWithObjectsAndKeys:detail.name,@"name",detail.memberid,@"memberID",detail.level,@"level",nil];
        NSLog(@"%@",dictOfUser);
        NSLog(@"%@",detail.level);
        [[NSUserDefaults standardUserDefaults] setObject:dictOfUser forKey:@"userDetail"];
        success(detail);
    }
    @catch (NSException *e) {
        failed([NSString stringWithFormat:@"用户登录失败:%@", e]);
        [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"userDetail"];
        [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"token"];
    }
}
@end
