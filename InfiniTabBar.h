//
//  InfiniTabBar.h
//  Created by http://github.com/iosdeveloper
//

#import <UIKit/UIKit.h>

@protocol InfiniTabBarDelegate;

@interface InfiniTabBar : UIScrollView <UIScrollViewDelegate, UITabBarDelegate> {
	id <InfiniTabBarDelegate> infiniTabBarDelegate;
	NSMutableArray *tabBars;
	UITabBar *aTabBar;
	UITabBar *bTabBar;
    UIImageView *imageviewleft;
    UIImageView *imageviewright;
    UIImageView *arrow;
}

@property (nonatomic, assign) id infiniTabBarDelegate;
@property (nonatomic, retain) NSMutableArray *tabBars;
@property (nonatomic, retain) UITabBar *aTabBar;
@property (nonatomic, retain) UITabBar *bTabBar;
@property (nonatomic, retain) UIImageView *arrow;


-(void)arrowDecoration;
- (id)initWithFrameAndItems:(CGRect)frame items:(NSArray *)items;
- (void)setBounces:(BOOL)bounces;
// Don't set more items than initially
- (void)setItems:(NSArray *)items animated:(BOOL)animated;
- (int)currentTabBarTag;
- (int)selectedItemTag;
- (BOOL)scrollToTabBarWithTag:(int)tag animated:(BOOL)animated;
- (BOOL)selectItemWithTag:(int)tag;
- (void)positionArrowAnimated:(BOOL)animated;

@end

@protocol InfiniTabBarDelegate <NSObject>
- (void)infiniTabBar:(InfiniTabBar *)tabBar didScrollToTabBarWithTag:(int)tag;
- (BOOL)infiniTabBar:(InfiniTabBar *)tabBar willSelectItemWithTag:(int)tag;
- (void)infiniTabBar:(InfiniTabBar *)tabBar didSelectItemWithTag:(int)tag;
@end