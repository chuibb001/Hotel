//
//  GuideViewController.h
//  chujian7day
//
//  Created by yan kai on 13-4-6.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GuideViewControllerDelegate <NSObject>

-(void)dismissGuide;

@end

@interface GuideViewController : UIViewController<UIScrollViewDelegate>
{
    UIScrollView* scrollView;
    UIPageControl* pageControl;
    
    UIButton* btnStart;
    UILabel* btnStartLabel;
    
    id <GuideViewControllerDelegate> delegate;
}

@property(nonatomic) id <GuideViewControllerDelegate> delegate;

-(void)btnStartPressed:(id)sender;
-(void)initStartImages:(NSArray*)imageNameList;

@end
