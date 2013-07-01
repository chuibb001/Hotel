//
//  RegionSelectorCell.m
//  chujian7day
//
//  Created by simon on 13-5-10.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import "KeywordSelectorCell.h"

@implementation KeywordSelectorCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        UILabel *keyLabel=[[UILabel alloc] initWithFrame:CGRectMake(20, 10, 70, 30)];
        keyLabel.backgroundColor=[UIColor clearColor];
        keyLabel.text=@"关键词:";
        [self addSubview:keyLabel];
        _keywordTextField=[[UITextField alloc] initWithFrame:CGRectMake(85, 15, 200, 30)];
        _keywordTextField.backgroundColor=[UIColor clearColor];
        _keywordTextField.placeholder=@"商圈/景点";
        _keywordTextField.returnKeyType=UIReturnKeyDone;
        [self addSubview:_keywordTextField];
        
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
