//
//  HotelListManager.h
//  chujian7day

//  负责按类型拉取数据与缓存

//  Created by simon on 13-5-14.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ThriftService.h"
#import "ReserveData.h"

typedef enum
{
    PriceAscending=0, // 价格从低到高
    ValueDescending, // 评价从高到低
    DistanceAscending  // 距离从近到远
}
SortType;

/*---------------------
    cache data modal
 ---------------------*/
@interface CacheData : NSObject
{
    NSMutableArray *_hotelList;
    int _page;
}

@property (nonatomic,strong) NSMutableArray *hotelList;
@property (nonatomic,assign) int page;

-(Boolean)isEmpty;

@end


/*---------------------
        manager
 ---------------------*/
@protocol HotelListDelegate;
@interface HotelListManager : NSObject
{
    // config
    SortType _currentType;
    int _currentPage;
    int _count;
    
    // buffer list
    NSMutableArray *_caches;
    ReserveData *_data;
    
}

@property (nonatomic,weak) id<HotelListDelegate> delegate;

+(HotelListManager *)sharedInstance;
-(void)requestWithType:(SortType)type;
-(void)requestNextPageWithType;
-(NSMutableArray *)currentHotels; 
-(void)clearCaches;

@end

@protocol HotelListDelegate <NSObject>

-(void)hotelList:(NSMutableArray *)array;

@end