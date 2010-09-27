//
//  DetailViewController.h
//  simpleFeed
//
//  Created by Roberto J. Osorio-Goenaga on 4/3/09.
//  Copyright 2009 Malloc Media, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iRSSAppDelegate.h"
#import "WebViewController.h"
#import "RSS.h"

//@class iRSSAppDelegate;
@interface DetailViewController : UIViewController {
	IBOutlet UITextView *textView;
	NSString *storeText;
	//RSS *tempRSS;
	WebViewController *webViewController;
	NSString *url;
	//iRSSAppDelegate *appDelegate;
}

@property (nonatomic, retain) IBOutlet UITextView *textView;
@property (nonatomic, retain) NSString *storeText;
//@property (nonatomic, retain) RSS *tempRSS;
@property (nonatomic, retain) WebViewController *webViewController;
@property (nonatomic, retain) NSString *url;
//@property (nonatomic, retain) iRSSAppDelegate *delegate;

@end
