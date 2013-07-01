//
//  DisplayTableView.h
//  Timeline
//
//  Created by simon on 12-12-12.
//  Copyright (c) 2012年 Sun Yat-sen University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DemoTableFooterView.h"
#import "DisPlayDataSource.h"
@interface DisplayTableView : UITableView 
{
    
@protected
    
    BOOL isDragging;
    
    BOOL isLoadingMore;
    
}

@property (nonatomic, assign) id<DisPlayDataSource> disPlayDataSource;


// The view used for "load more"
@property (nonatomic, retain) UIView *footerView;

@property (readonly) BOOL isDragging;
@property (readonly) BOOL isLoadingMore;
@property (readwrite) BOOL canLoadMore;

// Defaults to YES
@property (nonatomic) BOOL clearsSelectionOnViewWillAppear;

// Just a common initialize method
- (void) initialize;
-(void)Stop;



#pragma mark - Load More

// The value of the height starting from the bottom that the user needs to scroll down to in order
// to trigger -loadMore. By default, this will be the height of -footerView.
- (CGFloat) footerLoadMoreHeight;

// Override to perform fetching of next page of data. It's important to call and get the value of
// of [super loadMore] first. If it's NO, -loadMore should be aborted.
- (BOOL) loadMore;

// Called when all the conditions are met and -loadMore will begin.
- (void) willBeginLoadingMore;

// Call to signal that "load more" was completed. This should be called so -isLoadingMore is
// properly set to NO.
- (void) loadMoreCompleted;

// Helper to show/hide -footerView
- (void) setFooterViewVisibility:(BOOL)visible;

#pragma mark - 

// A helper method that calls refreshCompleted and/or loadMoreCompleted if any are active.
- (void) allLoadingCompleted;

#pragma mark - 

- (void) releaseViewComponents;

/*滚动视图包装函数*/
-(void)beginScroll;
-(void)Scrolling:(UIScrollView *)scrollView;
-(void)endScroll:(UIScrollView *)scrollView ;
@end
