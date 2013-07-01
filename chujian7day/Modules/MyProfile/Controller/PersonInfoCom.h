//
//  PersonInfoCom.h
//  chujian7day
//
//  Created by 王 瑞 on 13-5-17.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonInfoCom : UITableViewCell


@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UILabel *content;
@property (nonatomic, strong) UILabel *sign;
@property (nonatomic) NSUInteger count;
@property (nonatomic, strong) NSArray *list;
-(void)setContents:(NSUInteger)i;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier num:(NSUInteger)i;
@end
