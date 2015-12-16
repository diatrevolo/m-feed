//
//  WebViewController.m
//  ESBPOD
//
//  Created by Roberto J. Osorio-Goenaga on 5/15/09.
//  Copyright 2009 Malloc Media, LLC. All rights reserved.
//

#import "WebViewController.h"


@implementation WebViewController
@synthesize webView, urlString;

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

- (void)viewDidLoad {
	
	//NSString *urlAddress = self.urlString;//@"http://www.google.com";
	
	//Create a URL object.
	//NSURL *url = [NSURL URLWithString:urlAddress];
	
	//URL Requst Object
	//NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
	
	//Load the request in the UIWebView.
	NSLog(@"Loading %@", urlString);
	[webView loadRequest:urlString];
    [super viewDidLoad];
}


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
	if (!(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad))
		return (interfaceOrientation == UIInterfaceOrientationPortrait || interfaceOrientation == UIInterfaceOrientationLandscapeRight || interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
	else 
		return(interfaceOrientation == UIInterfaceOrientationPortrait || interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight || interfaceOrientation == UIDeviceOrientationPortraitUpsideDown);
			   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}




@end
