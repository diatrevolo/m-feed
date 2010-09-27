//
//  ConfigurationController.h
//  simpleFeed
//
//  Created by Roberto J. Osorio-Goenaga on 10/18/09.
//  Copyright 2009 Malloc Media, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <libxml/HTMLparser.h>
#import <libxml/xmlreader.h>
#import "iRSSAppDelegate.h"



@class iRSSAppDelegate;
//C crap
//int doNotRunAgain = 0;
//char* FindLinks(htmlNodePtr element);

@interface ConfigurationController : UIViewController {
	iRSSAppDelegate *appDelegate;
	IBOutlet UITextField *textField;
	IBOutlet UIButton *button;
	IBOutlet UIButton *mallocMedia;
	NSNotificationCenter *sendToOthers;
}

@property (nonatomic, retain) IBOutlet UITextField *textField;
@property (nonatomic, retain) IBOutlet UIButton *button;
@property (nonatomic, retain) IBOutlet UIButton *mallocMedia;

- (IBAction)makeURL:(id)sender;
- (IBAction)goToMallocMedia:(id)sender;
- (void)findLinks:(htmlNodePtr)element;


@end
