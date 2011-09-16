//
//  ViewController.m
//  Created by http://github.com/iosdeveloper
//

#import "ViewController.h"
#import "UIViewControlerForTest.h"
@implementation ViewController





- (void)viewDidLoad {
    [super viewDidLoad];
	
	// Items
	UITabBarItem *favorites = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:0];
	UITabBarItem *topRated = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemTopRated tag:1];
	UITabBarItem *featured = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFeatured tag:2];
	UITabBarItem *recents = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemRecents tag:3];
	UITabBarItem *contacts = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:4];
	UITabBarItem *history = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemHistory tag:5];
	UITabBarItem *bookmarks = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemBookmarks tag:6];
	UITabBarItem *search = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemSearch tag:7];
	UITabBarItem *downloads = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemDownloads tag:8]; downloads.badgeValue = @"M";
	UITabBarItem *mostRecent = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMostRecent tag:9];
	UITabBarItem *mostViewed = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMostViewed tag:10];
	
	// Tab bar
	
	 
    [self.tabBar setItems:[NSArray arrayWithObjects:favorites,
                           topRated,
                           featured,
                           recents,
                           contacts,
                           history,
                           bookmarks,
                           search,
                           downloads,
                           mostRecent,mostViewed,
                             nil] animated:YES];
    

   
	[favorites release];
	[topRated release];
	[featured release];
	[recents release];
	[contacts release];
	[history release];
	[bookmarks release];
	[search release];
	[downloads release];
	[mostRecent release];
	[mostViewed release];
	
    
        
    UIViewControlerForTest *vctrl1 =[[UIViewControlerForTest alloc] initWithNibName:@"UIViewControlerForTest" bundle:nil];
    [vctrl1 changeTexte:@"0"];
    
    
    UIViewControlerForTest *vctrl2 =[[UIViewControlerForTest alloc] initWithNibName:@"UIViewControlerForTest" bundle:nil];
    [vctrl2 changeTexte:@"1"];
    
    UIViewControlerForTest *vctrl3 =[[UIViewControlerForTest alloc] initWithNibName:@"UIViewControlerForTest" bundle:nil];
    [vctrl3 changeTexte:@"2"];
    
    UIViewControlerForTest *vctrl4 =[[UIViewControlerForTest alloc] initWithNibName:@"UIViewControlerForTest" bundle:nil];
    [vctrl4 changeTexte:@"3"];
    
    UIViewControlerForTest *vctrl5 =[[UIViewControlerForTest alloc] initWithNibName:@"UIViewControlerForTest" bundle:nil];
    [vctrl5 changeTexte:@"4"];
    
     
    [self addViewControllers:[NSArray arrayWithObjects:vctrl1,
                              vctrl2,
                              vctrl3,
                              vctrl4,
                              vctrl5,
                              nil] animated:YES];

     
     /////////
    // UI
		
	
	
	
	

	
	UIButton *fButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
	[fButton addTarget:self action:@selector(scrollToPreviousTabBar) forControlEvents:UIControlEventTouchUpInside];
	fButton.transform = CGAffineTransformMakeRotation(M_PI);
	fButton.frame = CGRectMake(17.0, 364.0, 29.0, 31.0);
	
	[vctrl1.view addSubview:fButton];
	
	UIButton *gButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
	[gButton addTarget:self action:@selector(scrollToNextTabBar) forControlEvents:UIControlEventTouchUpInside];
	gButton.frame = CGRectMake(274.0, 364.0, 29.0, 31.0);
	
	[vctrl1.view addSubview:gButton];

    
    /////////
    
    
   
    [vctrl1 release];
	[vctrl2 release];
	[vctrl3 release];
	[vctrl4 release];
	[vctrl5 release];
	// Don't show scroll indicator
	self.tabBar.showsHorizontalScrollIndicator = NO;
	self.tabBar.bounces = NO;
	
	
	
   
	}

- (void)bounces:(UISwitch *)sender {
	self.tabBar.bounces = sender.on;
}

- (void)showsScrollIndicator:(UISwitch *)sender {
	self.tabBar.showsHorizontalScrollIndicator = sender.on;
}



- (void)scrollToTabBar3 {
	[self.tabBar scrollToTabBarWithTag:2 animated:NO];
}

- (void)scrollAnimatedToTabBar1 {
	[self.tabBar scrollToTabBarWithTag:0 animated:YES];
}

- (void)selectItem8 {
	[self.tabBar selectItemWithTag:7];
}

- (void)scrollToPreviousTabBar {
	[self.tabBar scrollToTabBarWithTag:self.tabBar.currentTabBarTag - 1 animated:YES];
}

- (void)scrollToNextTabBar {
	[self.tabBar scrollToTabBarWithTag:self.tabBar.currentTabBarTag + 1 animated:YES];
}

- (void)infiniTabBar:(InfiniTabBar *)atabBar didScrollToTabBarWithTag:(int)tag {
    [super infiniTabBar:atabBar didScrollToTabBarWithTag:tag];
}
 
- (void)infiniTabBar:(InfiniTabBar *)atabBar didSelectItemWithTag:(int)tag {
    [super infiniTabBar:atabBar didSelectItemWithTag:tag];
    if (self.currentViewController){
        NSString *str =[NSString stringWithFormat:@"tag=%i",tag];
        [self.currentViewController changeTexte:str];
    }
}

- (void)dealloc {
	// UI
	
	
    [super dealloc];
}

@end