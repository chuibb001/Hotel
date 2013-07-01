//
//  HotelListManager.m
//  chujian7day
//
//  Created by simon on 13-5-14.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import "HotelListManager.h"
@implementation CacheData
-(id)init
{
    self=[super init];
    if(self)
    {
        _page=1;
        _hotelList=[[NSMutableArray alloc] init];
    }
    return self;
}

-(Boolean)isEmpty
{
    return [_hotelList count]==0;
}
@end

static HotelListManager *instance;

@implementation HotelListManager
-(id)init
{
    self=[super init];
    if(self)
    {
        _count=10;
        _caches=[[NSMutableArray alloc] init];
        
        for(int i=0;i<3;i++)
        {
            CacheData *newData=[[CacheData alloc] init];
            [_caches addObject:newData];
        }

        _data=[ReserveData sharedReserveData];
    }
    return self;
}

#pragma mark 对外接口
+(HotelListManager *)sharedInstance
{
    if(instance==nil)
        instance=[[HotelListManager alloc] init];
    
    return instance;
}

-(void)requestWithType:(SortType)type
{
    _currentType=type;
    
    CacheData *data=[_caches objectAtIndex:type];
    
    // request for data
    if([data isEmpty])
    {
        _currentPage=data.page;
        
        // 重新load数据
        [self requestForData];
    }
    else
    {
        // 用delegate把list传回vc
        _currentPage=data.page;
        [self.delegate hotelList:data.hotelList];
    }
}
-(void)requestNextPageWithType
{
    CacheData *data=[_caches objectAtIndex:_currentType];
    data.page++;
    _currentPage=data.page;
    
    // request
    [self requestForData];
}

-(NSMutableArray *)currentHotels  // for map vc
{
    CacheData *data=[_caches objectAtIndex:_currentType];
    return data.hotelList;
}

-(void)clearCaches
{
    for(CacheData *data in _caches)
    {
        [data.hotelList removeAllObjects];
        data.page=1;
    }
}
#pragma mark request
-(void)requestForData
{
    SearchRequest *request=[self configRequest];
    ThriftService *service = [ThriftService shared];
    [service searchHotel:request success:^(NSArray *hotel)
    {
        NSLog(@"%@",hotel);
        CacheData *data=[_caches objectAtIndex:_currentType];
        NSMutableArray *arr=data.hotelList;
        [arr addObjectsFromArray:hotel];
        NSLog(@"current count %d",[arr count]);
        [self.delegate hotelList:arr];
        
    } failed:^(NSString *error){ NSLog(@"%@",error);}];
}

-(SearchRequest *)configRequest
{
    int64_t checkinTimeStamp=[_data.startTime timeStamp] * 1000;
    int64_t checkoutTimeStamp=[_data.endTime timeStamp] * 1000;
    //NSLog(@"checkinTimeStamp %lld",checkinTimeStamp);
    //NSLog(@"checkoutTimeStamp %lld",checkoutTimeStamp);
    
    SearchRequest *request=[[SearchRequest alloc] initWithCityId:1 regionId:1 keyword:nil checkinTime:checkinTimeStamp checkoutTime:checkoutTimeStamp latitude:0 longitude:0 radius:0 pageIndex:_currentPage pageSize:_count sortBy:_currentType+1];
    return request;
}
@end
