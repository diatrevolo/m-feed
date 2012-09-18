//
//  simpleFeedAppDelegate.h
//  simpleFeed
//
//  Created by Roberto J. Osorio-Goenaga on 3/30/09.
//  Copyright Malloc Media, LLC 2009. All rights reserved.
//

#define ATOM_FEED 0
#define RSS_FEED 1

#import "Reachability.h"
#import "ConfigurationController.h"

@interface iRSSAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
	//ConfigurationController *configurationController;
	//NSUInteger loadFromIndex;
	NSMutableArray *entries;
	NSInteger globalFeedType;
	NSURL *url;
	BOOL firstRun;
	NetworkStatus remoteHostStatus;
	NetworkStatus internetConnectionStatus;
	NetworkStatus localWiFiConnectionStatus;
}

@property (nonatomic, strong) IBOutlet UIWindow *window;
@property (nonatomic, strong) IBOutlet UINavigationController *navigationController;
//@property (nonatomic, retain) IBOutlet ConfigurationController *configurationController;
@property (nonatomic, strong) NSMutableArray *entries;
@property NetworkStatus remoteHostStatus;
@property NetworkStatus internetConnectionStatus;
@property NetworkStatus localWiFiConnectionStatus;
@property NSInteger globalFeedType;
@property (nonatomic, strong) NSURL *url;
@property BOOL firstRun;
//@property NSUInteger loadFromIndex;

- (void)updateStatus;

@end

