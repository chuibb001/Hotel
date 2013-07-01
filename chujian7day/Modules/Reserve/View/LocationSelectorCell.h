//
//  CitySelectorCell.h
//  chujian7day

//  城市和区域选择的View

//  Created by simon on 13-5-10.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LocationSelectorCell : UITableViewCell
{
    UILabel *_keyLabel;
    UILabel *_valueLabel;
}

@property (nonatomic,strong) UILabel *keyLabel;
@property (nonatomic,strong) UILabel *valueLabel;

@end
