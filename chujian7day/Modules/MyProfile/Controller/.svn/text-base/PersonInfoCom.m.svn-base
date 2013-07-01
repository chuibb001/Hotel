//
//  PersonInfoCom.m
//  chujian7day
//
//  Created by 王 瑞 on 13-5-17.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import "PersonInfoCom.h"

@implementation PersonInfoCom

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier num:(NSUInteger)i
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.count = i;
        [self initView];
        [self modify];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    
}

-(void)initView{
    if(self.count ==2 || self.count == 5 || self.count == 6){
        self.title = [[UILabel alloc] initWithFrame:CGRectMake(21, 11, 130, 21)];
    }else{
        self.title = [[UILabel alloc] initWithFrame:CGRectMake(21, 11, 65, 21)];
    }
    
    self.title.textAlignment = UITextAlignmentLeft;
    [self addSubview:self.title];
    
     if(self.count ==2 || self.count == 5 || self.count == 6){
         self.content = [[UILabel alloc] initWithFrame:CGRectMake(86+10, 11, 152, 21)];
     }else{
         self.content = [[UILabel alloc] initWithFrame:CGRectMake(66, 11, 152, 21)];
     }
    
         
    self.content.textAlignment = UITextAlignmentLeft;
    [self addSubview:self.content];
    
    self.sign = [[UILabel alloc] initWithFrame:CGRectMake(246, 11, 34, 21)];
    self.sign.textAlignment = UITextAlignmentRight;
    self.sign.textColor = [UIColor blueColor];
    self.sign.hidden = YES;
    self.sign.backgroundColor=[UIColor clearColor];
    self.sign.text=@"修改";
    [self addSubview:self.sign];
    
    self.title.backgroundColor = [UIColor clearColor];
    self.content.backgroundColor = [UIColor clearColor];
    
    _list=@[@"生日:",@"身份证号:",@"卡号:",@"手机:",@"电子邮箱:",@"注册时间:"];
}

-(void)modify{
    
    self.title.text = [_list objectAtIndex:(self.count-1)];

    
    NSDictionary *dict = [[NSUserDefaults standardUserDefaults] objectForKey:@"userDetail"];
   // NSLog(@"%@",);
    switch (self.count) {
        case 1:
            if ([dict objectForKey:@"birthday"]) {
                self.content.text=[dict objectForKey:@"birthday"];
            }else{
                self.content.text=@"未注册";
            }
            break;
        case 2:
            if ([dict objectForKey:@"idCard"]) {
                self.content.text=[dict objectForKey:@"idCard"];
            }else{
                self.content.text=@"未注册";
            }
            break;
        case 3:
            if ([dict objectForKey:@"memberCard"]) {
                self.content.text=[dict objectForKey:@"memberCard"];
            }else{
                self.content.text=@"未获取";
            }
            break;
        case 4:
            if ([dict objectForKey:@"phone"]) {
                self.content.text=[dict objectForKey:@"phone"];
            }else{
                self.content.text=@"未注册";
            }
            self.sign.hidden=NO;
            self.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
            break;
        case 5:
            if ([dict objectForKey:@"email"]) {
                self.content.text=[dict objectForKey:@"email"];
            }else{
                self.content.text=@"未注册";
            }
            self.sign.hidden=NO;
            self.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
            break;
        case 6:
            break;
        default:
            break;
    }
    
}
-(void)setContents:(NSUInteger)i{

    
}
@end
