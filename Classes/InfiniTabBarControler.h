//
//  InfiniTabBarControler.h
//  InfiniTabBar
//
//  Created by jdivol on 15/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InfiniTabBar.h"

@interface InfiniTabBarControler : UIViewController <InfiniTabBarDelegate> {
    InfiniTabBar *tabBar;
    
     NSMutableArray         *viewControllers;
     UIViewController       *selectedViewController;
    id                      delegate; //compatbility and future use
    NSArray                * customizableViewControllers; // unusedhere added for compatibility with UITabBarController
    UINavigationController *moreNavigationController; // unused here added for compatibility with UITabBarController
    NSUInteger selectedIndex; // added for compatibility with UITabBarController
}
@property (nonatomic, retain) InfiniTabBar *tabBar;
@property (nonatomic, retain) NSMutableArray *viewControllers;
@property (nonatomic, retain) UIViewController       *selectedViewController;
@property (nonatomic, assign) id delegate;
@property(nonatomic,copy) NSArray                * customizableViewControllers;
@property(nonatomic,readonly) UINavigationController *moreNavigationController;
@property(nonatomic) NSUInteger selectedIndex;

- (void)setViewControllers:(NSArray *)aviewControllers animated:(BOOL)animated;
@end
