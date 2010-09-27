//
//  FeedViewController.h
//  simpleFeed
//
//  Created by Roberto J. Osorio-Goenaga on 4/9/09.
//  Copyright Malloc Media, LLC 2009. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "Atom.h"
#import "DetailViewController.h"
#import "Reachability.h"

@class iRSSAppDelegate;

@interface FeedViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource> {
	iRSSAppDelegate *appDelegate;
	NetworkStatus remoteHostStatus;
	NetworkStatus internetConnectionStatus;
	NetworkStatus localWiFiConnectionStatus;
}

@end
