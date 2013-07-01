//
//  MemberDetail.m
//  chujian7day
//
//  Created by 王 瑞 on 13-4-27.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

// NEXT: 13
//struct Member {
//    1:i64 memberId,
//    2:string name,
//    3:string birthday,
//    4:string idCard,
//    5:string memberCard,
//    6:string phone,
//    9:bool phoneVerified,
//    7:string email,
//    8:string level,
//    10:bool isMale,
//    11:i32 memberType,
//    12:bool isPayTrain,
//}


#import "MemberDetail.h"

@implementation MemberDetail

-(id)initWithMember:(Member *)aMember{
    self = [super init];
    if(self){
    self.memberid = [[NSString alloc] initWithFormat:@"%lld",aMember.memberId];
    self.name = aMember.name;
    self.birthday = aMember.birthday;
    self.idCard = aMember.idCard;
    self.memberCard = aMember.memberCard;
    self.phone =aMember.phone;
    self.phoneVerified = aMember.phoneVerified;
    self.email = aMember.email;
    self.level = aMember.level;
    self.isMale = aMember.isMale;
    self.memberType = aMember.memberType;
    self.isPayTrain = aMember.isPayTrain;
    }
    return self;
}
@end
