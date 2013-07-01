//
//  RegisteIDCell.m
//  chujian7day
//
//  Created by 王 瑞 on 13-5-20.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import "RegisteIDCell.h"

@implementation RegisteIDCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.title = [[ UILabel alloc] initWithFrame:CGRectMake(20,11,200, 21)];
        [self addSubview:self.title];
        
        self.title.text=@"证件类型";
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.title.backgroundColor = [UIColor clearColor];
        self.sheets = [[UIActionSheet alloc] initWithTitle:@"证件类型" delegate:self cancelButtonTitle:@"驾驶证" destructiveButtonTitle:@"身份证" otherButtonTitles:nil];
        
        [self addSubview:self.sheets];
       
        self.count = -1;
        self.jump = 0;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{

    [super setSelected:selected animated:animated];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    if(_jump == 0){
      
        _jump++;
    }else{
          [self.sheets showInView:[UIApplication sharedApplication].keyWindow];
    }

    
}

#pragma mark action sheets
-(void)actionSheetCancel:(UIActionSheet *)actionSheet{
    self.count = 0;
    self.title.text=@"驾驶证";
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        self.count = 1;
        self.title.text=@"驾驶证";
    }else{
        self.count = 0;
        self.title.text=@"身份证";
    }
}
@end
