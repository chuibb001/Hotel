//
//  VoucherDef.h
//  chujian7day
//
//  财富
//
//  Created by yan kai on 13-4-19.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 *  财富类型（券、储值等） --  不知道应该怎么归类这些东西
 */
enum WealthType {
    VouchersMoneyBack,   // 返现券
    VouchersDiscount,     // 抵用券
    DepositGift,    // 储值礼金
    DepositCash     // 储值现金
};

/**
 *  财富
 */
@interface Wealth : NSObject
{
    // 类型
    enum WealthType type;
    // 数量
    double amount;
}

@property(nonatomic) enum WealthType type;
@property(nonatomic) double amount;

@end
