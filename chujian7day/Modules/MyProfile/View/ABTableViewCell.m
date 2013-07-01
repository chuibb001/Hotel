

#import "ABTableViewCell.h"

@interface ABTableViewCellView : UIView
@end

@implementation ABTableViewCellView

- (void)drawRect:(CGRect)r
{
	[(ABTableViewCell *)[self superview] drawContentView:r];
}

@end



@implementation ABTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
		contentView = [[ABTableViewCellView alloc]initWithFrame:CGRectZero];
		contentView.opaque = YES;
        contentView.backgroundColor=[UIColor whiteColor];
		[self addSubview:contentView];
	}
	return self;
}


- (void)setFrame:(CGRect)f
{
	[super setFrame:f];
	CGRect b = [self bounds];
	b.size.height -= 1; // leave room for the seperator line
	[contentView setFrame:b];
}

- (void)setNeedsDisplay
{
	[super setNeedsDisplay];
	[contentView setNeedsDisplay];
}

- (void)drawContentView:(CGRect)r
{
	
}

@end
