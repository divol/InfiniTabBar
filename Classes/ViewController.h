//
//  ViewController.h
//  Created by http://github.com/iosdeveloper
//

#import <UIKit/UIKit.h>

#import "InfiniTabBarControler.h"


@interface ViewController : InfiniTabBarControler {
	
	
	// UI
	UILabel *dLabel;
	UILabel *fLabel;
}



// UI
@property (nonatomic, retain) UILabel *dLabel;
@property (nonatomic, retain) UILabel *fLabel;

@end