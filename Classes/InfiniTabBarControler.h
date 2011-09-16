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
     UIViewController       *currentViewController;
}
@property (nonatomic, retain) InfiniTabBar *tabBar;
@property (nonatomic, retain) NSMutableArray *viewControllers;
@property (nonatomic, retain) UIViewController       *currentViewController;


- (void)addViewControllers:(NSArray *)aviewControllers animated:(BOOL)animated;
@end
