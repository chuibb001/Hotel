//
//  Detail2Cell.m
//  chujian7day
//
//  Created by 王 瑞 on 13-4-21.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import "Detail2Cell.h"

@implementation Detail2Cell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initView];
           }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    
}

-(void)initView{
    self.nameOfHotel=[[UILabel alloc] initWithFrame:CGRectMake(20, 5, 200, 15)];
    self.nameOfHotel.text=@"酒店名称 明珠大酒店";
   // self.nameOfHotel.textAlignment=UITextAlignmentLeft;
    self.nameOfHotel.textColor=TitleColor;
    self.nameOfHotel.backgroundColor=ClearColor;
    
    self.adressOfHotel=[[UILabel alloc] initWithFrame:CGRectMake(20, 25, 200, 15)];
    self.adressOfHotel.text=@"酒店地址 XX街XX路XX号";
    self.adressOfHotel.textColor=TitleColor;
    self.adressOfHotel.backgroundColor=ClearColor;
    
    self.phone=[[UILabel alloc] initWithFrame:CGRectMake(20, 45, 200, 15)];
    self.phone.textColor=TitleColor;
    self.phone.text=@"酒店电话 020-12123213";
    self.phone.backgroundColor=ClearColor;

    [self addSubview:self.nameOfHotel];
    [self addSubview:self.adressOfHotel];
    [self addSubview:self.phone];
}

@end
