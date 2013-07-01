//
//  RegisteIDCell.h
//  chujian7day
//
//  Created by 王 瑞 on 13-5-20.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisteIDCell : UITableViewCell<UIActionSheetDelegate>

@property (strong, nonatomic) UILabel *title;
@property (nonatomic)NSUInteger count;
@property (nonatomic,strong)UIActionSheet *sheets;
@property (nonatomic)NSUInteger jump;
@end
