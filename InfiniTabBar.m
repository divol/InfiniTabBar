//
//  InfiniTabBar.m
//  Created by http://github.com/iosdeveloper
//

#import "InfiniTabBar.h"

@implementation InfiniTabBar

@synthesize infiniTabBarDelegate;
@synthesize tabBars;
@synthesize aTabBar;
@synthesize bTabBar;


-(UIImage*)makeTriangle:(CGRect)rect where:(int)where{
    
    CGSize size = CGSizeMake(rect.size.width, rect.size.height);
	UIGraphicsBeginImageContext(size);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    
    switch(where){
        case 0:
            //nop
            break;
        case 1:
            //bot
            CGContextBeginPath(ctx);
            CGContextMoveToPoint(ctx,0.0,0.0);
            CGContextAddLineToPoint(ctx,size.width/2.0,size.height);
            CGContextAddLineToPoint(ctx,size.width,0.0);
            CGContextClosePath(ctx);
            
            break;
        case 2:
            //right
            CGContextBeginPath(ctx);
            CGContextMoveToPoint(ctx,0.0,size.height);
            CGContextAddLineToPoint(ctx,size.width,size.height/2.0);
            CGContextAddLineToPoint(ctx,0.0,0.0);
            CGContextClosePath(ctx);

            break;
        case 4:
            //up
            CGContextBeginPath(ctx);
            CGContextMoveToPoint(ctx,0.0,size.height);
            CGContextAddLineToPoint(ctx,size.width/2.0,0.0);
            CGContextAddLineToPoint(ctx,size.width,size.height);
            CGContextClosePath(ctx);
            break;
        case 8:
            //left
            
            CGContextBeginPath(ctx);
            CGContextMoveToPoint(ctx,0.0,size.height/2.0);
            CGContextAddLineToPoint(ctx,size.width,size.height);
            CGContextAddLineToPoint(ctx,size.width,0.0);
            CGContextClosePath(ctx);

            break;
            
    }
    
    
    
    CGContextSetStrokeColorWithColor(ctx, [[UIColor darkGrayColor] CGColor]);
    CGContextSetLineWidth(ctx, 2.0);
    CGContextSetFillColor(ctx, CGColorGetComponents([[UIColor darkGrayColor] CGColor]));
    CGContextStrokePath(ctx);
    UIImage* result = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
    
    return result;

    

}
- (void)didMoveToSuperview{
    [super didMoveToSuperview];
    
    [self arrowDecoration];
}

-(void)arrowDecoration{
    
    int position = [self currentTabBarTag];
    UIScreen *screen = [UIScreen mainScreen];
	CGRect sbounds = screen.applicationFrame;
    
    if (imageviewleft){
        [imageviewleft removeFromSuperview];
        [imageviewleft release];
        imageviewleft=NULL;
    }
    if (imageviewright){
        [imageviewright removeFromSuperview];
        [imageviewright release];
        imageviewright=NULL;
    }
    if (self.tabBars !=0){
        
        int way = 0;
        if (position > 0){
            way = 8;
            
            UIImage * image = [self makeTriangle:CGRectMake(1, 1,9,48) where:way];
            imageviewleft = [[UIImageView alloc]initWithImage: image];
            
            imageviewleft.alpha = 0.0;  
            imageviewleft.frame = CGRectMake(4, sbounds.size.height- 49.0,10,49);
            //imageviewleft.bounds = CGRectMake(0, 0,25,49);
            [self.superview addSubview:imageviewleft];
            
            [UIView animateWithDuration:0.3 animations:^{
                imageviewleft.alpha = 1.0;
            }];
        }
        if (position < self.tabBars.count-1){
            way = 2;
            
            UIImage * image = [self makeTriangle:CGRectMake(1, 1,9,48) where:way];
            imageviewright = [[UIImageView alloc]initWithImage: image];
            
            imageviewright.alpha = 0.0;  
            imageviewright.frame = CGRectMake(sbounds.size.width-14, sbounds.size.height- 49.0,10,49);
            // imageviewright.bounds = CGRectMake(290, 0,25,49);
            [self.superview addSubview:imageviewright];
            [UIView animateWithDuration:0.3 animations:^{
                imageviewright.alpha = 1.0;
            }];
        }
        
    }

}
- (id)initWithFrameAndItems:(CGRect)frame items:(NSArray *)items {
	//self = [super initWithFrame:CGRectMake(0.0, 411.0, 320.0, 49.0)];
	// TODO:
	
	UIScreen *screen = [UIScreen mainScreen];
	CGRect sbounds = screen.applicationFrame;
	self = [super initWithFrame:CGRectMake(0, sbounds.size.height - 49.0, sbounds.size.width, 49.0)];
	// Doesn't work. self is nil at this point.
	
    if (self) {
		self.indicatorStyle=UIScrollViewIndicatorStyleWhite;
		self.pagingEnabled = YES;
		self.delegate = self;
		
		self.tabBars = [[[NSMutableArray alloc] init] autorelease];
		
		float x = 0.0;
		
		for (double d = 0; d < ceil(items.count / 5.0); d ++) {
			UITabBar *tabBar = [[UITabBar alloc] initWithFrame:CGRectMake(x, 0.0, sbounds.size.width, 49.0)];
			tabBar.delegate = self;
			
			int len = 0;
			
			for (int i = d * 5; i < d * 5 + 5; i ++)
				if (i < items.count)
					len ++;
			
			tabBar.items = [items objectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(d * 5, len)]];
			
			[self addSubview:tabBar];
			
			[self.tabBars addObject:tabBar];
			
			[tabBar release];
			
			x += self.frame.size.width;
		}
		
		self.contentSize = CGSizeMake(x, 49.0);
        
	}
	 
    return self;
}
//320
- (void)setBounces:(BOOL)bounces {
	if (bounces) {
		int count = self.tabBars.count;
		
		if (count > 0) {
			if (self.aTabBar == nil)
				self.aTabBar = [[[UITabBar alloc] initWithFrame:CGRectMake(-1*self.frame.size.width, 0.0, self.frame.size.width, 49.0)]autorelease];
			
			[self addSubview:self.aTabBar];
			
			if (self.bTabBar == nil)
				self.bTabBar = [[[UITabBar alloc] initWithFrame:CGRectMake(count * self.frame.size.width, 0.0, self.frame.size.width, 49.0)] autorelease];
			
			[self addSubview:self.bTabBar];
		}
	} else {
		[self.aTabBar removeFromSuperview];
		[self.bTabBar removeFromSuperview];
	}
	
	[super setBounces:bounces];
}

- (void)setItems:(NSArray *)items animated:(BOOL)animated {
	for (UITabBar *tabBar in self.tabBars) {
		int len = 0;
		
		for (int i = [self.tabBars indexOfObject:tabBar] * 5; i < [self.tabBars indexOfObject:tabBar] * 5 + 5; i ++)
			if (i < items.count)
				len ++;
		
		[tabBar setItems:[items objectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange([self.tabBars indexOfObject:tabBar] * 5, len)]] animated:animated];
	}
	
	self.contentSize = CGSizeMake(ceil(items.count / 5.0) * self.frame.size.width, 49.0);
}

- (int)currentTabBarTag {
	return self.contentOffset.x / self.frame.size.width;
}

- (int)selectedItemTag {
	for (UITabBar *tabBar in self.tabBars)
		if (tabBar.selectedItem != nil)
			return tabBar.selectedItem.tag;
	
	// No item selected
	return 0;
}

- (BOOL)scrollToTabBarWithTag:(int)tag animated:(BOOL)animated {
	for (UITabBar *tabBar in self.tabBars)
		if ([self.tabBars indexOfObject:tabBar] == tag) {
			UITabBar *tabBar = [self.tabBars objectAtIndex:tag];
			
			[self scrollRectToVisible:tabBar.frame animated:animated];
			
			if (animated == NO)
				[self scrollViewDidEndDecelerating:self];
			
			return YES;
		}
	
	return NO;
}

- (BOOL)selectItemWithTag:(int)tag {
	for (UITabBar *tabBar in self.tabBars)
		for (UITabBarItem *item in tabBar.items)
			if (item.tag == tag) {
				tabBar.selectedItem = item;
				
				[self tabBar:tabBar didSelectItem:item];
				
				return YES;
			}
	
	return NO;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
	[infiniTabBarDelegate infiniTabBar:self didScrollToTabBarWithTag:scrollView.contentOffset.x / self.frame.size.width];
    
    [self arrowDecoration];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
	[self scrollViewDidEndDecelerating:scrollView];
}

- (void)tabBar:(UITabBar *)cTabBar didSelectItem:(UITabBarItem *)item {
	// Act like a single tab bar
	for (UITabBar *tabBar in self.tabBars)
		if (tabBar != cTabBar)
			tabBar.selectedItem = nil;
	
	[infiniTabBarDelegate infiniTabBar:self didSelectItemWithTag:item.tag];
}

- (void)dealloc {
	[bTabBar release];
	[aTabBar release];
	[tabBars release];
    if (imageviewleft)
        [imageviewleft release];
    if (imageviewright)
        [imageviewright release];


	[super dealloc];
}

@end