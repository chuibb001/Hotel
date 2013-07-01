//
//  Goods.h
//  chujian7day
//
//  Created by simon on 13-5-20.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Goods : NSObject
{
    NSString *_goodsName;
    int _quantiry;
    float _price;
}

@property (nonatomic ,strong) NSString *goodsName;
@property (nonatomic ,assign) int quantiry;
@property (nonatomic ,assign) float price;

@end
