//
//  GuideViewController.m
//  chujian7day
//
//  新手指引
//
//  Created by yan kai on 13-4-6.
//  Copyright (c) 2013年 chujian. All rights reserved.
//

#import "GuideViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation GuideViewController

@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)initStartImages:(NSArray*)imageNameList
{
    if(imageNameList && imageNameList.count>0) {
        CGFloat pageWidth = self.view.frame.size.width;
        CGFloat pageHeight = self.view.frame.size.height;
        
        CGRect frame = CGRectMake(0, 0, pageWidth, pageHeight);
        scrollView = [[UIScrollView alloc] initWithFrame:frame];
        scrollView.backgroundColor = [UIColor clearColor];
        scrollView.showsVerticalScrollIndicator = NO;
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.pagingEnabled = YES;
        scrollView.directionalLockEnabled = YES;
        scrollView.delegate = self;
        
        CGFloat maxHeight = 1;
        int len = imageNameList.count;
        int n = 0;
        UIImageView* lastView = nil;
        for(NSString* imageName in imageNameList) {
            UIImage* image = [UIImage imageNamed:imageName];
            UIImageView* imageView = [[UIImageView alloc] initWithImage:image];
            [imageView setFrame:CGRectMake(0, 0, pageWidth, pageHeight)];
            imageView.contentMode = UIViewContentModeScaleToFill;
            CGFloat height = 0;
            if(image.size.width > pageWidth) {
                height = image.size.height * pageWidth / image.size.width;
                imageView.frame = CGRectMake(pageWidth*n, 0, pageWidth, height);
            } else {
                height = image.size.height;
                imageView.frame = CGRectMake(pageWidth*n+(pageWidth-image.size.width)/2, 0, image.size.width, height);
            }
            
            if(maxHeight < height) {
                maxHeight = height;
            }
            
            [scrollView addSubview:imageView];
            n++;
            
            if(n==len) {
                lastView = imageView;
            }
        }
        
        CGFloat contentWidth = pageWidth * len;
        [scrollView setContentSize:CGSizeMake(contentWidth, maxHeight)];
        [self.view addSubview:scrollView];
        
        pageControl.numberOfPages = len;
        pageControl.backgroundColor = [UIColor whiteColor];
        pageControl.currentPage = 1;
        pageControl.enabled = YES;
        [self.view addSubview:pageControl];
        
        /* 初始化“开始体验“按钮 */
        CGFloat btnWidth = 100;
        CGFloat btnHeight = 50;
        CGFloat btnStartX = (pageWidth-btnWidth)/2 + pageWidth * (len-1);
        CGFloat btnStartY = pageHeight - btnHeight - 50;
        
        btnStart = [[UIButton alloc] initWithFrame:CGRectMake(btnStartX, btnStartY, btnWidth, btnHeight)];
        btnStart.backgroundColor = [UIColor whiteColor];
        [btnStart addTarget:self action:@selector(btnStartPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        btnStartLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, btnWidth, btnHeight)];
        btnStartLabel.backgroundColor = [UIColor clearColor];
        btnStartLabel.textAlignment = UITextAlignmentCenter;
        btnStartLabel.text = @"开始体验"; 
        [btnStart addSubview:btnStartLabel];
        
        [scrollView addSubview:btnStart];
        
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma -
#pragma mark button event
-(void)btnStartPressed:(id)sender
{
    [UIView animateWithDuration:1.0 animations:^{
        self.view.alpha = 0;
    } completion:^(BOOL finished){
        [self.view removeFromSuperview];
        
        if(delegate) {
            [delegate dismissGuide];
        }
    }];
}

@end
