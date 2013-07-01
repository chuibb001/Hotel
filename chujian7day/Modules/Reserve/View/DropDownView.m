//
//  DropDownView.m
//  Public
//
//  Created by 01 developer on 12-9-15.
//  Copyright (c) 2012年 Sun Yat-sen University. All rights reserved.
//

#import "DropDownView.h"

@implementation DropDownView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.listData=[[NSArray alloc] initWithObjects:@"价格从低到高",@"评价从高到低",@"距离从近到远", nil];
        [self initTableView];
        self.backgroundColor=[UIColor clearColor];
    }
    return self;
}

-(void)initTableView
{
    table=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) style:UITableViewStylePlain];
    
    //把背景设置成透明色
    table.backgroundColor=[UIColor clearColor];
    UIView *tmpView=[[UIView alloc] init];
    table.backgroundView=tmpView;
    
    [table setTableFooterView:tmpView];
    
    table.dataSource=self;
    table.delegate=self;
    [self addSubview:table];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (dropDownOpen)
    {
        return 3;
    }
    else
    {
        return 0;
    }
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *DropDownCellIdentifier = @"DropDownCell";
            
    DropDownCell *cell = (DropDownCell*) [tableView dequeueReusableCellWithIdentifier:DropDownCellIdentifier];
    
    if (cell == nil)  //创建新的cell
    {
        //这句是什么意思？
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"DropDownCell" owner:nil options:nil];
        
        for(id currentObject in topLevelObjects)
        {
            if([currentObject isKindOfClass:[DropDownCell class]])
            {
                cell = (DropDownCell *)currentObject;
                break;
            }
        }
    }
    //隐藏那个标志
    [cell setImageHidden];
    NSString *label = [self.listData objectAtIndex: [indexPath row]];
    
    [[cell textLabel] setText:label];
    
    cell.backgroundColor=[UIColor blackColor];
    //cell.alpha=0.5;
    // Configure the cell.
    return cell;

}

-(void)action
{
    //增加这几行
    NSIndexPath *path0 = [NSIndexPath indexPathForRow:0 inSection:0];
    NSIndexPath *path1 = [NSIndexPath indexPathForRow:1 inSection:0];
    NSIndexPath *path2 = [NSIndexPath indexPathForRow:2 inSection:0];
    
    NSArray *indexPathArray = [NSArray arrayWithObjects:path0, path1, path2, nil];
    //如果列表打开了
    if (dropDownOpen)
    {
        dropDownOpen=NO;
        //把那几行删掉
        [table deleteRowsAtIndexPaths:indexPathArray withRowAnimation:UITableViewRowAnimationTop];
    }
    //如果列表是关闭的
    else
    {
        dropDownOpen=YES;
        //加入那几行
        [table insertRowsAtIndexPaths:indexPathArray withRowAnimation:UITableViewRowAnimationTop];
    }

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //记录下选中的是哪一行
    selected = [[[tableView cellForRowAtIndexPath:indexPath] textLabel] text];
    
    NSIndexPath *path = [NSIndexPath indexPathForRow:0 inSection:[indexPath section]];
    DropDownCell *cell = (DropDownCell*) [tableView cellForRowAtIndexPath:path];
    
    [[cell textLabel] setText:selected];
    
    //关闭下拉列表
    NSIndexPath *path0 = [NSIndexPath indexPathForRow:0 inSection:[indexPath section]];
    NSIndexPath *path1 = [NSIndexPath indexPathForRow:1 inSection:[indexPath section]];
    NSIndexPath *path2 = [NSIndexPath indexPathForRow:2 inSection:[indexPath section]];
    
    NSArray *indexPathArray = [NSArray arrayWithObjects:path0, path1, path2, nil];
    [cell setClosed];
    dropDownOpen = [cell isOpen];
    [tableView deleteRowsAtIndexPaths:indexPathArray withRowAnimation:UITableViewRowAnimationTop];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 32;
}
- (void)drawRect:(CGRect)rect {
    // Drawing code.
}

@end
