//
//  HeadCell.m
//  chujian7day
//
//  Created by 王 瑞 on 13-5-17.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import "HeadCell.h"

@implementation HeadCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    
}

-(void)setEverying{
    NSDictionary *dict = [[NSUserDefaults standardUserDefaults] objectForKey:@"userDetail"];
    self.name.text = [dict objectForKey:@"name"];
    
    if (![[dict objectForKey:@"isMale"] boolValue]) {
        self.gender.text=@"男";
    }else{
        self.gender.text=@"女";
    }
    
    if ([dict objectForKey:@"level"]) {
        self.level.text=[dict objectForKey:@"level"];
    }else{
        self.level.text=@"注册会员";
    }
}
@end
