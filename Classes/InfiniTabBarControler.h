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
}
@property (nonatomic, retain) InfiniTabBar *tabBar;
@end
