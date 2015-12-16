//
//  DetailViewController.m
//  simpleFeed
//
//  Created by Roberto J. Osorio-Goenaga on 4/3/09.
//  Copyright 2009 Malloc Media, LLC. All rights reserved.
//

#import "DetailViewController.h"
#import "iRSSAppDelegate.h"
#include <libxml/HTMLparser.h>


@implementation DetailViewController
@synthesize textView, storeText, webViewController, url;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
		// Initialization code
		//iRSSAppDelegate *delegate = [[UIApplication sharedApplication] delegate]; //delegate];
		//[delegate.navigationController.rightBarButt
		//[delegate.navigationController pushViewController:detailViewController animated:YES];
	}
	return self;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	//appDelegate = (iRSSAppDelegate *)[[UIApplication sharedApplication] delegate];
	//self.title = 
	NSLog(@"Text is %@", storeText);
	//HTMLparser *htmlParse = [[HTMLparser alloc] init];
	NSLog(@"Link is %@", url);
	webViewController = [[WebViewController alloc] init];
	UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Web View", @"")
																   style:UIBarButtonItemStyleBordered
																  target:self
																  action:@selector(addAction:)];
	self.navigationItem.rightBarButtonItem = addButton;
	textView.text = [self flattenHTML:self.storeText];
	//textView.text = [[[NSString alloc] init] flattenHTML:self.storeText];
	
	//urlReq = [[NSURLRequest alloc] initWithURL:[[NSURL alloc] initWithString:tempRSS.link]];
    [super viewDidLoad];
	//[addButton release];
}

- (NSString *)flattenHTML:(NSString *)html {
	
    NSScanner *theScanner;
    NSString *text = nil;
	
    theScanner = [NSScanner scannerWithString:html];
	
    while ([theScanner isAtEnd] == NO) {
		
        // find start of tag
        [theScanner scanUpToString:@"<" intoString:NULL] ; 
		
        // find end of tag
        [theScanner scanUpToString:@">" intoString:&text] ;
		
        // replace the found tag with a space
        //(you can filter multi-spaces out later if you wish)
        html = [html stringByReplacingOccurrencesOfString:
				[ NSString stringWithFormat:@"%@>", text]
											   withString:@""];
		
    } // while //
    
    return html;
	
}

- (IBAction)addAction:(id)sender
{
	//NSLog(@"%@", self.tempRSS);
	webViewController.urlString = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
	iRSSAppDelegate *delegate = [[UIApplication sharedApplication] delegate]; //delegate];
	[delegate.navigationController pushViewController:webViewController animated:YES];
}



// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    if (!(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad))
		return (interfaceOrientation == UIInterfaceOrientationPortrait);
	else 
		return(interfaceOrientation == UIInterfaceOrientationPortrait || interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight || interfaceOrientation == UIDeviceOrientationPortraitUpsideDown);
			   
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
    [super viewDidUnload];
}




@end
