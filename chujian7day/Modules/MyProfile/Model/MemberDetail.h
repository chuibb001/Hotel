//
//  MemberDetail.h
//  chujian7day
//
//  Created by 王 瑞 on 13-4-27.
//  Copyright (c) 2013年 chujian. All rights reserved.
//



#import <Foundation/Foundation.h>
#import "ThriftService.h"
@interface MemberDetail : NSObject

@property (nonatomic, strong)NSString *memberid;
@property (nonatomic, strong)NSString *name;
@property (nonatomic, strong)NSString *birthday;
@property (nonatomic, strong)NSString *idCard;
@property (nonatomic, strong)NSString *memberCard;
@property (nonatomic, strong)NSString *phone;
@property (nonatomic) BOOL phoneVerified;
@property (nonatomic, strong)NSString *email;
@property (nonatomic, strong)NSString *level;
@property (nonatomic) BOOL isMale;
@property (nonatomic) NSUInteger memberType;
@property (nonatomic) BOOL isPayTrain;

-(id)initWithMember:(Member *)aMember;
@end
