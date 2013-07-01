//
//  ReserveData.h
//  chujian7day
//
//  Created by simon on 13-4-19.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ReserveData : NSObject

+(ReserveData *)sharedReserveData;

@property (nonatomic,strong) NSString *startTimeString;
@property (nonatomic,strong) NSString *startWeekString;
@property (nonatomic,strong) NSString *endTimeString;
@property (nonatomic,strong) NSString *endWeekString;

@end
