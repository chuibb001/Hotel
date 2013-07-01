//
//  DisplayTableView.m
//  Timeline
//
//  Created by simon on 12-12-12.
//  Copyright (c) 2012年 Sun Yat-sen University. All rights reserved.
//

#import "DisplayTableView.h"

#define DEFAULT_HEIGHT_OFFSET 52.0f
@interface DisplayTableView ()

@end

@implementation DisplayTableView

@synthesize footerView;
@synthesize isDragging;
@synthesize isLoadingMore;
@synthesize canLoadMore;
@synthesize clearsSelectionOnViewWillAppear;
@synthesize disPlayDataSource;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initialize];
        //[self initNotification];
    }
    return self;
}
- (void) initialize
{
    canLoadMore = YES;
    
    clearsSelectionOnViewWillAppear = YES;
    
    // set the custom view for "load more". See DemoTableFooterView.xib.
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"DemoTableFooterView" owner:self options:nil];
    DemoTableFooterView *afooterView = (DemoTableFooterView *)[nib objectAtIndex:0];
       
    self.footerView = afooterView;
}


-(void)Stop
{
    /*处理视图复原*/
    if(isLoadingMore)
        [self loadMoreCompleted];
}

#pragma mark 滚动视图
- (void) beginScroll
{
    if (isLoadingMore)
        return;
    isDragging = YES;
}
 
- (void) Scrolling:(UIScrollView *)scrollView
{
    if (!isLoadingMore && canLoadMore) {
        //NSLog(@"2");
        CGFloat scrollPosition = scrollView.contentSize.height - scrollView.frame.size.height - scrollView.contentOffset.y;
        if (scrollPosition < [self footerLoadMoreHeight]) {
            [self loadMore];
                NSLog(@"Scrolling");
        }
    }
}

- (void)endScroll:(UIScrollView *)scrollView 
{
    isDragging = NO;
}

#pragma mark - Load More
/*setter*/
- (void) setFooterView:(UIView *)aView
{
    if (!self)
        return;
    
    self.tableFooterView = nil;
    //[footerView release]; footerView = nil;
    footerView=nil;
    if (aView) {
        //footerView = [aView retain];
        footerView=aView;
        self.tableFooterView = footerView;
    }
}

-(CGFloat)footerLoadMoreHeight
{
    if (footerView)
        return footerView.frame.size.height;
    else
        return DEFAULT_HEIGHT_OFFSET;
}

- (void) setFooterViewVisibility:(BOOL)visible
{
    if (visible && self.tableFooterView != footerView)
        self.tableFooterView = footerView;
    else if (!visible)
        self.tableFooterView = nil;
}

/*加载更多step1*/
- (BOOL) loadMore
{
    /*禁止上下拉*/
    canLoadMore=NO;
    
    if (isLoadingMore)
        return NO;
    
    /*一边转菊花*/
    [self willBeginLoadingMore];
    isLoadingMore = YES;  
    /*一边加载更多数据*/
    //[self performSelector:@selector(addItemsOnBottom) withObject:nil afterDelay:0.0];
    //[self performSelector:@selector(addItemsOnBottom)];
    [self addItemsOnBottom];
    return YES;
}

/*加载更多step2*/
- (void) willBeginLoadingMore
{
    DemoTableFooterView *fv = (DemoTableFooterView *)self.footerView;
    [fv.activityIndicator startAnimating];
}

/*加载更多step3*/
- (void) addItemsOnBottom
{
    /*调用delegate的加载更多*/
    [disPlayDataSource loadMoreData];
}

/*加载更多step4*/
- (void) loadMoreCompleted
{
    isLoadingMore = NO;
    
    DemoTableFooterView *fv = (DemoTableFooterView *)self.footerView;
    [fv.activityIndicator stopAnimating];
    
    /*if (!self.canLoadMore) {
        // Do something if there are no more items to load
        
        // We can hide the footerView by: [self setFooterViewVisibility:NO];
        
        // Just show a textual info that there are no more items to load
        fv.infoLabel.hidden = NO;
    }*/
    canLoadMore=YES;
}

@end
