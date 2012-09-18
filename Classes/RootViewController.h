//
//  RootViewController.h
//  simpleFeed
//
//  Created by Roberto J. Osorio-Goenaga on 3/30/09.
//  Copyright Malloc Media, LLC 2009. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "Atom.h"
#import "DetailViewController.h"
#import "ConfigurationController.h"

#define ATOM_FEED 0
#define RSS_FEED 1
#define kFilename		@"data.plist"

@class iRSSAppDelegate;

@interface RootViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource, UIPopoverControllerDelegate> {
	iRSSAppDelegate *appDelegate;
	IBOutlet ConfigurationController *configurationController;
	UIPopoverController *popoverController;
	BOOL configControllerShowing;
}

@property (nonatomic, strong) IBOutlet ConfigurationController *configurationController;
@property (nonatomic, strong) UIPopoverController *popoverController;
@property BOOL configControllerShowing;

- (NSString *)dataFilePath;
- (void)applicationWillTerminate:(NSNotification *)notification;

@end
