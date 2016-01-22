//
//  ViewController.m
//  CarbonKitExample2
//
//  Created by 최완복 on 2015. 11. 25..
//  Copyright © 2015년 Ermal Kaleci. All rights reserved.
//

#import "ViewController.h"
#import "CarbonKit.h"
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//Then use any Hex value


@interface ViewController ()<CarbonTabSwipeNavigationDelegate>
{
	NSArray *items;
	CarbonTabSwipeNavigation *carbonTabSwipeNavigation;
}

@property (weak, nonatomic) IBOutlet UIToolbar *toolBar;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	//_toolBar.barTintColor = [UIColor redColor];
	_toolBar.barTintColor = UIColorFromRGB(0x1e1a36);

	self.title = @"CarbonKit";
	
    items = @[ @"Movies", @"TV Shows",
               @"LiveTV",
               @"Recommended"];
	
	carbonTabSwipeNavigation = [[CarbonTabSwipeNavigation alloc]
								initWithItems:items
								toolBar:_toolBar
								delegate:self initialIndex:1];
	[carbonTabSwipeNavigation insertIntoRootViewController:self
											 andTargetView:self.view];
	[_toolBar.superview bringSubviewToFront:_toolBar];
	
	[self style];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)style {
	
	UIColor *color = [UIColor colorWithRed:24.0/255 green:75.0/255 blue:152.0/255 alpha:1];
	self.navigationController.navigationBar.translucent = NO;
	self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
	self.navigationController.navigationBar.barTintColor = color;
	self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
	
	carbonTabSwipeNavigation.toolbar.translucent = NO;
	[carbonTabSwipeNavigation setIndicatorColor:[UIColor whiteColor]];
	[carbonTabSwipeNavigation setTabExtraWidth:30];

	
	// Custimize segmented control
	[carbonTabSwipeNavigation setNormalColor:[UIColorFromRGB(0xaaaaaa) colorWithAlphaComponent:0.6]
										font:[UIFont boldSystemFontOfSize:14]];
	[carbonTabSwipeNavigation setSelectedColor:UIColorFromRGB(0xffffff)
										  font:[UIFont boldSystemFontOfSize:14]];
}

# pragma mark - CarbonTabSwipeNavigation Delegate
// required
- (nonnull UIViewController *)carbonTabSwipeNavigation:(nonnull CarbonTabSwipeNavigation *)carbontTabSwipeNavigation
								 viewControllerAtIndex:(NSUInteger)index {
	UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
	switch (index) {
		case 0:
			return [storyboard instantiateViewControllerWithIdentifier:@"ViewControllerOne"];
			
		case 1:
			return [storyboard instantiateViewControllerWithIdentifier:@"ViewControllerOne"];
			
		default:
			return [storyboard instantiateViewControllerWithIdentifier:@"ViewControllerOne"];
	}
}

// optional
- (void)carbonTabSwipeNavigation:(nonnull CarbonTabSwipeNavigation *)carbonTabSwipeNavigation
				 willMoveAtIndex:(NSUInteger)index {
	switch(index) {
//		case 0:
//			self.title = @"Movies";
//			break;
//		case 1:
//			self.title = @"TV Shows";
//			break;
//		case 2:
//			self.title = @"LiveTV";
//			break;
//        case 2:
//            self.title = @"Recommended";
//            break;
		default:
			self.title = items[index];
			break;
	}
}

- (void)carbonTabSwipeNavigation:(nonnull CarbonTabSwipeNavigation *)carbonTabSwipeNavigation
				  didMoveAtIndex:(NSUInteger)index {
	NSLog(@"Did move at index: %ld", index);
}

- (UIBarPosition)barPositionForCarbonTabSwipeNavigation:(nonnull CarbonTabSwipeNavigation *)carbonTabSwipeNavigation {
	return UIBarPositionTop; // default UIBarPositionTop
}

@end
