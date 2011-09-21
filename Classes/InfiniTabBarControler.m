//
//  InfiniTabBarControler.m
//  InfiniTabBar
//
//  Created by jdivol on 15/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "InfiniTabBarControler.h"


@implementation InfiniTabBarControler
@synthesize tabBar;
@synthesize contentView;
@synthesize viewControllers;
@synthesize selectedViewController;
@synthesize delegate;
@synthesize customizableViewControllers;
@synthesize moreNavigationController;
@synthesize selectedIndex;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.tabBar = [[InfiniTabBar alloc] initWithFrame:self.view.frame];
    }
    return self;
}

- (void)dealloc
{
    
    self.tabBar=nil;
    self.viewControllers=nil;
    self.selectedViewController=nil;
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
 // Implement loadView to create a view hierarchy programmatically, without using a nib.
 - (void)loadView
 {
 }
 */


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    if (!self.tabBar)
        self.tabBar = [[InfiniTabBar alloc] initWithFrame:self.view.frame];
    
    // Don't show scroll indicator
	self.tabBar.showsHorizontalScrollIndicator = NO;
	self.tabBar.infiniTabBarDelegate = self;
	self.tabBar.bounces = YES;
    [self.view addSubview:self.tabBar];
    [self.view bringSubviewToFront:self.tabBar]; 
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    if (self.selectedViewController){
        [self.selectedViewController.view removeFromSuperview]; 
        self.selectedViewController=nil;
    }
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


// need to mimik some UITabBarControler features
- (void)setViewControllers:(NSArray *)aviewControllers animated:(BOOL)animated{
    UIScreen *screen = [UIScreen mainScreen];
	CGRect sbounds = screen.applicationFrame;
    unsigned int compteur=0;
    NSMutableArray *marray = [[[NSMutableArray alloc] init] autorelease];
    for ( UIViewController *ctrl in aviewControllers){
        if (!self.contentView)
             ctrl.view.frame = CGRectMake(0, 0, sbounds.size.width, sbounds.size.height- 49.0); // leave place to tabbar
        if (self.tabBar.tabBars.count ==0){
            ctrl.tabBarItem.tag=compteur;
            [marray addObject:ctrl.tabBarItem];
            compteur++;
        }
    }
    if (self.tabBar.tabBars.count ==0){
        [self.tabBar setItems:[NSArray arrayWithArray:marray] animated:YES];
    }
    
    self.viewControllers=[NSMutableArray arrayWithArray:aviewControllers]; // add the view controlers
    self.selectedViewController = [self.viewControllers objectAtIndex:0];
    [self.tabBar positionArrowAnimated:YES];
	if (!self.contentView){
        [self.view addSubview:self.selectedViewController.view];
        [self.view bringSubviewToFront:self.selectedViewController.view];

    }else{
        [self.contentView addSubview:self.selectedViewController.view];
        [self.contentView bringSubviewToFront:self.selectedViewController.view];
    }
    
}

#pragma mark delegate
- (void)infiniTabBar:(InfiniTabBar *)tabBar didScrollToTabBarWithTag:(int)tag {
    //nop
}

- (BOOL)infiniTabBar:(InfiniTabBar *)tabBar willSelectItemWithTag:(int)tag {
    //nop
    return (!self.selectedViewController.modalViewController);
}

- (void)infiniTabBar:(InfiniTabBar *)tabBar didSelectItemWithTag:(int)tag {
    if (self.viewControllers){
        if (self.selectedViewController){
            if (self.selectedViewController.modalViewController){
                [self.tabBar positionArrowAnimated:YES];
                return;
            }
            [self.selectedViewController.view removeFromSuperview]; 
            self.selectedViewController=nil;
            
        }
        if (tag < self.viewControllers.count){
            
            self.selectedViewController = [self.viewControllers objectAtIndex:tag];
            
            if (!self.contentView){
                [self.view addSubview:self.selectedViewController.view];
                [self.view bringSubviewToFront:self.selectedViewController.view];
                
            }else{
                [self.contentView addSubview:self.selectedViewController.view];
                [self.contentView bringSubviewToFront:self.selectedViewController.view];
            }        }
    }
    //nop
    self.selectedIndex  = tag;
}



@end
