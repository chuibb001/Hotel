//
//  ReserveData.m
//  chujian7day
//
//  Created by simon on 13-4-19.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import "ReserveData.h"

@implementation ReserveData

static ReserveData *reserveData=nil;

+(ReserveData *)sharedReserveData
{
    if(!reserveData)
        reserveData=[[ReserveData alloc] init];
    
    return reserveData;
}


@end
