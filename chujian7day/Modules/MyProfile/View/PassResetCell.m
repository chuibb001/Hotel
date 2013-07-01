//
//  PassResetCell.m
//  chujian7day
//
//  Created by 王 瑞 on 13-5-18.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import "PassResetCell.h"

@implementation PassResetCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    self.selectionStyle = UITableViewCellSelectionStyleNone;
}





-(void)setContents:(NSUInteger)i{
    self.title.font= [UIFont systemFontOfSize:14.0];
    self.pass.returnKeyType=UIReturnKeyDone;
    switch (i) {
        case 0:
            self.title.text=@"输入旧密码:";

            break;
        case 1:
            self.title.text=@"输入新密码:";
            
            break;
        case 2:
            self.title.text=@"确认新密码:";
           
            break;
        default:
            break;
    }
}

#pragma mark -
#pragma mark - TextField delegate

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}
@end
