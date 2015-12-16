//
//  simpleFeedAppDelegate.m
//  simpleFeed
//
//  Created by Roberto J. Osorio-Goenaga on 3/30/09.
//  Copyright Malloc Media, LLC 2009. All rights reserved.
//

#import "iRSSAppDelegate.h"
#import "RootViewController.h"
#import "XMLParser.h"

@interface iRSSAppDelegate()
@property (NS_NONATOMIC_IOSONLY, readonly, copy) NSString *hostName;
@end

@implementation iRSSAppDelegate

@synthesize window;
@synthesize navigationController, entries;
@synthesize remoteHostStatus;
@synthesize internetConnectionStatus;
@synthesize localWiFiConnectionStatus;
@synthesize globalFeedType;
@synthesize url;
@synthesize firstRun;


#pragma mark -
#pragma mark Application lifecycle

- (void)updateStatus
{
	// Query the SystemConfiguration framework for the state of the device's network connections.
	self.remoteHostStatus           = [[Reachability sharedReachability] remoteHostStatus];
	self.internetConnectionStatus	= [[Reachability sharedReachability] internetConnectionStatus];
	self.localWiFiConnectionStatus	= [[Reachability sharedReachability] localWiFiConnectionStatus];
}

- (void)reachabilityChanged:(NSNotification *)note
{
    [self updateStatus];
}

- (NSString *)hostName
{
	// Don't include a scheme. 'http://' will break the reachability checking.
	// Change this value to test the reachability of a different host.
	return @"www.apple.com";
}

- (void)applicationDidFinishLaunching:(UIApplication *)application {   // We'll probably want to move this out of the app delegate once we figure out the Feeds page
	firstRun = TRUE;
	
    // Override point for customization after app launch    
    window.rootViewController = navigationController;
	//[window addSubview:[navigationController view]];
    [window makeKeyAndVisible];
	
	
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
}


#pragma mark -
#pragma mark Memory management



@end

