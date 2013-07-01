//
//  searchHotel.m
//  chujian7day
//
//  Created by simon on 13-4-27.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import "searchHotel.h"
#import "ISevenDaysService.h"
#import "THotel.h"
#import "ThriftService.h"

@implementation searchHotel

-(void)requestForList
{
    SearchRequest *request=[[SearchRequest alloc] initWithCityId:1 regionId:1 keyword:nil checkinTime:0 checkoutTime:0 latitude:23.059 longitude:113.307 radius:0 pageIndex:1 pageSize:10 sortBy:0];
    [[ThriftService shared] searchHotel:request
                                success:^(NSArray* hotelList){
                                    NSLog(@"查询酒店结果：%@", hotelList);
                                }
                                 failed:^(NSString* error) {
                                     NSLog(@"查询酒店失败：%@", error);
                                 }];
}


@end
