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
@synthesize viewControllers;
@synthesize currentViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    
    self.tabBar=nil;
    self.viewControllers=nil;
    self.currentViewController=nil;
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
    self.tabBar = [[InfiniTabBar alloc] initWithFrame:self.view.frame];
    // Don't show scroll indicator
	self.tabBar.showsHorizontalScrollIndicator = NO;
	self.tabBar.infiniTabBarDelegate = self;
	self.tabBar.bounces = YES;
    [self.view addSubview:self.tabBar];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    if (self.currentViewController){
        [self.currentViewController.view removeFromSuperview]; 
        self.currentViewController=nil;
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
- (void)addViewControllers:(NSArray *)aviewControllers animated:(BOOL)animated{
    self.viewControllers=[NSMutableArray arrayWithArray:aviewControllers]; // add the view controlers
      self.currentViewController = [self.viewControllers objectAtIndex:0];
    [self.view addSubview:self.currentViewController.view];
    [self.view bringSubviewToFront:self.currentViewController.view]; 
}

#pragma mark delegate
- (void)infiniTabBar:(InfiniTabBar *)tabBar didScrollToTabBarWithTag:(int)tag {
    //nop
}

- (void)infiniTabBar:(InfiniTabBar *)tabBar didSelectItemWithTag:(int)tag {
    if (self.viewControllers){
        if (self.currentViewController){
            [self.currentViewController.view removeFromSuperview]; 
            self.currentViewController=nil;
            
        }
        if (tag < self.viewControllers.count){
           
            self.currentViewController = [self.viewControllers objectAtIndex:tag];
            
           [self.view addSubview:self.currentViewController.view];
            [self.view bringSubviewToFront:self.currentViewController.view]; 
        }
    }
      //nop
}



@end
