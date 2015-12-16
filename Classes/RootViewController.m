//
//  RootViewController.m
//  simpleFeed
//
//  Created by Roberto J. Osorio-Goenaga on 3/30/09.
//  Copyright Malloc Media, LLC 2009. All rights reserved.
//

#import "RootViewController.h"
#import "iRSSAppDelegate.h"
#import "Atom.h"
#import "RSS.h"
#import "DetailViewController.h"
#import "XMLParser.h"

@implementation RootViewController

@synthesize configurationController;

@synthesize popoverController, configControllerShowing;


- (void)viewDidLoad {
	configControllerShowing = false;
	appDelegate = (iRSSAppDelegate *)[UIApplication sharedApplication].delegate;
	self.title = @"m-feed";
	UIBarButtonItem *setupButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Configure", @"")
																   style:UIBarButtonItemStyleBordered
																  target:self
																  action:@selector(configure:)];
	self.navigationItem.rightBarButtonItem = setupButton;
	
	UIApplication *app = [UIApplication sharedApplication];
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(applicationWillTerminate:)
												 name:UIApplicationWillTerminateNotification 
											   object:app];
	
    [super viewDidLoad];

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (IBAction)configure:(id)sender
{
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
	{
		if(!(self.popoverController).popoverVisible){//need to add feed check on back in iPad
			// The device is an iPad running iPhone 3.2 or later.
			configurationController = [[ConfigurationController alloc] initWithNibName: @"ConfigurationController" bundle: nil];
			//iRSSAppDelegate *delegate = [[UIApplication sharedApplication] delegate]; //delegate];
			//[delegate.navigationController pushViewController:configurationController animated:YES];
			
			
			//MyCustomViewController* content = [[MyCustomViewController alloc] init];
			UIPopoverController* aPopover = [[UIPopoverController alloc]
											 initWithContentViewController:configurationController];
			
			
			//CGSize sizeOfView = [configurationController.frame size];
			
			aPopover.delegate = self;
			
			// Store the popover in a custom property for later use.
			
			self.popoverController = aPopover;
			
			
			(self.popoverController).popoverContentSize = CGSizeMake(320, 460);
			
			[self.popoverController presentPopoverFromBarButtonItem:sender
									   permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
			NSLog(@"got to here");
		}
	}
	else
	{
		// The device is an iPhone or iPod touch.
	
		//NSLog(@"%@", self.tempRSS);
		//configurationController.urlString = [NSURLRequest requestWithURL:[NSURL URLWithString:self.url]];
		configurationController = [[ConfigurationController alloc] initWithNibName: @"ConfigurationController" bundle: nil];
		iRSSAppDelegate *delegate = [UIApplication sharedApplication].delegate; //delegate];
		[delegate.navigationController pushViewController:configurationController animated:YES];
	}
}

- (NSString *)dataFilePath
{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = paths[0];
	return [documentsDirectory stringByAppendingPathComponent:kFilename];
}
- (void)applicationWillTerminate:(NSNotification *)notification
{
	NSLog(@"m-feed is going south.");
	[[NSFileManager defaultManager] createFileAtPath:[self dataFilePath] contents:nil attributes:nil];
	NSMutableArray *array = [[NSMutableArray alloc] init];
	[array addObject:(appDelegate.url).absoluteString];
	[array writeToFile:[self dataFilePath] atomically:YES];
	if ([[NSFileManager defaultManager] fileExistsAtPath:[self dataFilePath]]){
		NSLog(@"Saved data: %@",array[0]);
	}
}


- (void)viewDidAppear:(BOOL)animated {
	[Reachability sharedReachability].hostName = @"www.apple.com";
	[appDelegate updateStatus];
	
	NSLog(@"Loaded RootViewController");
	
	if (appDelegate.remoteHostStatus == NotReachable) {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Internet Connection" message:@"You don't have a valid internet connection.  Try again later." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[alert show];
	} else {
		if (appDelegate.url==NULL){
			NSLog(@"It was NULL");
			appDelegate.url = [[NSURL alloc] initWithString:@"http://fxfeeds.mozilla.com/rss20.xml"];//http://www.atomenabled.org/atom.xml"];
		}
		if(appDelegate.firstRun){
			[self beginBackgroundTasks];
			appDelegate.firstRun = FALSE;
		} else {
			[NSThread detachNewThreadSelector:@selector(beginBackgroundTasks) toTarget:self withObject:nil];
		}
	}
		
    [super viewDidAppear:animated];
}

#pragma mark -

/*
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}
*/


 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
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
	// Release anything that can be recreated in viewDidLoad or on demand.
	// e.g. self.myOutlet = nil;
    [super viewDidUnload];
}


#pragma mark -
#pragma mark Table Data Source Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return (appDelegate.entries).count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//	NSUInteger row = [indexPath row];
	static NSString *TopLevelCellIdentifier = @"TopLevelCellIdentifier";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TopLevelCellIdentifier];
	if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TopLevelCellIdentifier];
	}
	// Configure the cell
	//NSUInteger row = [indexPath row];
	//RootViewController *controller = [appDelegate.entries objectAtIndex:row];
	
	
	
	//Atom *aAtom = [appDelegate.entries objectAtIndex:indexPath.row];  //HERE IS WHERE THE VALUES GET LOADED IN AND I CAN USE THEM (from appDelegate)
	if (appDelegate.globalFeedType == RSS_FEED) {
		RSS *aRSS = (appDelegate.entries)[indexPath.row];
		//cell.text = aListing.name;
		(cell.textLabel).text = [[NSString stringWithFormat:@"%@", aRSS.title] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
	} else if (appDelegate.globalFeedType == ATOM_FEED) {
		Atom *aAtom = (appDelegate.entries)[indexPath.row];
		(cell.textLabel).text = [NSString stringWithFormat:@"%@", aAtom.title];
	}
	
	//cell.image = controller.rowImage;
	
    //cell.textColor = [UIColor whiteColor];
	
	return cell;
}

- (void)viewWillAppear:(BOOL)animated {
	if(appDelegate.url == NULL){
		NSString *filePath = [self dataFilePath];
		if ([[NSFileManager defaultManager] fileExistsAtPath:filePath])
		{
			NSMutableArray *array = [[NSMutableArray alloc] initWithContentsOfFile:filePath];
			if(array[0] != NULL){
				appDelegate.url = [NSURL URLWithString:array[0]];
				NSLog(@"Just found some persistent data: %@", appDelegate.url);
			}
		} else {
			NSLog(@"file not found.");
		}
	}
	NSLog(@"Loading Feeds View");
	
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
	{
		[[NSNotificationCenter defaultCenter]
		 addObserver:self
		 selector:@selector(handleNotification:)
		 name:@"makeURLPressed"
		 object:nil];
		NSLog(@"Listener set.");
	}
	
    [super viewWillAppear:animated];
}

-(void)handleNotification:(NSNotification *)pNotification
{
	NSLog(@"Got a notification");
	if(appDelegate.url == NULL){
		NSString *filePath = [self dataFilePath];
		if ([[NSFileManager defaultManager] fileExistsAtPath:filePath])
		{
			NSMutableArray *array = [[NSMutableArray alloc] initWithContentsOfFile:filePath];
			if(array[0] != NULL){
				appDelegate.url = [NSURL URLWithString:array[0]];
				NSLog(@"Just found some persistent data: %@", appDelegate.url);
			}
		} else {
			NSLog(@"file not found.");
		}
	}
	NSLog(@"Loading Feeds View");
	
	////
	[Reachability sharedReachability].hostName = @"www.apple.com";
	[appDelegate updateStatus];
	
	NSLog(@"Loaded RootViewController");
	
	if (appDelegate.remoteHostStatus == NotReachable) {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Internet Connection" message:@"You don't have a valid internet connection.  Try again later." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[alert show];
	} else {
		if (appDelegate.url==NULL){
			NSLog(@"It was NULL");
			appDelegate.url = [[NSURL alloc] initWithString:@"http://fxfeeds.mozilla.com/rss20.xml"];//http://www.atomenabled.org/atom.xml"];
		}
		if(appDelegate.firstRun){
			[self beginBackgroundTasks];
			appDelegate.firstRun = FALSE;
		} else {
			[NSThread detachNewThreadSelector:@selector(beginBackgroundTasks) toTarget:self withObject:nil];
		}
	}
	
}

#pragma mark -
#pragma mark Table View Delegate Methods
- (UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryType:(NSIndexPath *)indexPath
{
	return UITableViewCellAccessoryDisclosureIndicator;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//	NSUInteger row = [indexPath row];
	DetailViewController *detailViewController = [[DetailViewController alloc] init];// self.detailViewController;
	if (appDelegate.globalFeedType == RSS_FEED) {
		RSS *aRSS = (appDelegate.entries)[indexPath.row];
		//NSLog(aRSS.description);
		detailViewController.title = aRSS.title;
		detailViewController.storeText = aRSS.description;
        (detailViewController.view).backgroundColor = [UIColor whiteColor];
		detailViewController.url = [aRSS.link stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];  //HERE IS THE LOAD OF THE URL
		[aRSS.link stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
		
		
		//detailViewController.textView.text = aRSS.description;//[NSString stringWithFormat:@"%@", aRSS.title];
		//NSLog(detailViewController.textView.text);
	} else if (appDelegate.globalFeedType == ATOM_FEED) {
		Atom *aAtom = (appDelegate.entries)[indexPath.row];
		detailViewController.title = aAtom.title;
		if ([aAtom.entrySummary isEqualToString:@""])
			detailViewController.storeText = aAtom.entrySummary;
		else
			detailViewController.storeText = aAtom.content;
	}
	
	iRSSAppDelegate *delegate = [UIApplication sharedApplication].delegate; //delegate];
	[delegate.navigationController pushViewController:detailViewController animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 66;
}

#pragma mark MULTI_THREAD

-(void)beginBackgroundTasks{
	@autoreleasepool {
    //[NSThread sleepForTimeInterval:.3];
        [self performSelector:@selector(loadURLAndParse) withObject:nil]; //spawn process as a separate, non-main thread
    }
}


-(void)loadURLAndParse{
	//NSString *path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"atom.xml"];
	//NSData *data = [[NSData alloc] initWithContentsOfFile:path];
	NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithContentsOfURL:appDelegate.url];
	//NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:data];
	appDelegate.url;
	
	//Initialize the delegate.
	XMLParser *parser = [[XMLParser alloc] initXMLParser];
	
	//Set delegate
	xmlParser.delegate = parser;
	
	//Start parsing the XML file.
	BOOL success = [xmlParser parse];
	appDelegate.globalFeedType = parser.typeOfFeed;
	if(success)
		NSLog(@"No Errors");
	else {
		NSLog(@"Error Error Error!!!");
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"iRSS" 
														message:@"This URL does not appear to be a valid ATOM or RSS feed. Please enter a valid URL for an RSS or ATOM feed in the Configuration page, such as \"http://fxfeeds.mozilla.com/rss20.xml\"." 
													   delegate:nil 
											  cancelButtonTitle:@"OK" 
											  otherButtonTitles:nil];
		[alert show];
		if (!(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad))
		{
			configurationController = [[ConfigurationController alloc] initWithNibName: @"ConfigurationController" bundle: nil];
			iRSSAppDelegate *delegate = [UIApplication sharedApplication].delegate; //delegate];
			[delegate.navigationController pushViewController:configurationController animated:YES];
		}
	}
	
	if(self.tableView)
		[self.tableView reloadData];
}

#pragma mark DEALLOC

- (void)dealloc {
	NSLog(@"begin dealloc");
	[[NSNotificationCenter defaultCenter] removeObserver:self];
	NSLog(@"end dealloc");
}


@end

