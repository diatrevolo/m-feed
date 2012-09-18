//
//  FeedViewController.m
//  simpleFeed
//
//  Created by Roberto J. Osorio-Goenaga on 4/9/09.
//  Copyright Malloc Media, LLC 2009. All rights reserved.
//

#import "FeedViewController.h"
#import "iRSSAppDelegate.h"
#import "Atom.h"
#import "RSS.h"
#import "DetailViewController.h"
#import "XMLParser.h"
#import "Reachability.h"

@implementation FeedViewController

- (void)viewDidLoad {
	
	
	appDelegate = (iRSSAppDelegate *)[[UIApplication sharedApplication] delegate];
	self.title = @"m-feed";
	
    [super viewDidLoad];
	
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}



/*
 - (void)viewWillAppear:(BOOL)animated {
 [super viewWillAppear:animated];
 }
 */
/*
- (void)viewDidAppear:(BOOL)animated {
	
 [super viewDidAppear:animated];
}
*/
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
}


#pragma mark -
#pragma mark Table Data Source Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [appDelegate.entries count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//	NSUInteger row = [indexPath row];
	static NSString *TopLevelCellIdentifier = @"TopLevelCellIdentifier";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TopLevelCellIdentifier];
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:TopLevelCellIdentifier];
	}
	// Configure the cell
	//NSUInteger row = [indexPath row];
	//RootViewController *controller = [appDelegate.entries objectAtIndex:row];
	
	
	
	//Atom *aAtom = [appDelegate.entries objectAtIndex:indexPath.row];  //HERE IS WHERE THE VALUES GET LOADED IN AND I CAN USE THEM (from appDelegate)
	RSS *aRSS = (appDelegate.entries)[indexPath.row];
	
	
	
	//cell.text = aListing.name;
	
	
	
	//cell.text = [NSString stringWithFormat:@"%@", aAtom.title];
	[cell.textLabel setText:[NSString stringWithFormat:@"%@", aRSS.title]];
	
	//cell.image = controller.rowImage;
	
    //cell.textColor = [UIColor whiteColor];
	
	return cell;
}

#pragma mark -
#pragma mark Table View Delegate Methods
- (UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryType:(NSIndexPath *)indexPath
{
	return UITableViewCellAccessoryDisclosureIndicator;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	/*NSUInteger row = [indexPath row];
	DetailViewController *detailViewController = [[DetailViewController alloc] init];// self.detailViewController;
	RSS *aRSS = [appDelegate.entries objectAtIndex:indexPath.row];
	//NSLog(aRSS.description);
	detailViewController.title = aRSS.title;
	detailViewController.storeText = aRSS.description;
	detailViewController.url = aRSS.link;
	NSLog(@"Current link is %@ before passing.", aRSS.link);
	//detailViewController.tempRSS = [[RSS alloc] init];
	//NSURLRequest *t = [[NSURLRequest alloc] initWithURL:[[NSURL alloc]initWithString:aRSS.url]];
	//NSLog(@"%@", aRSS.link);
	
	//detailViewController.tempRSS = aRSS;//[appDelegate.entries objectAtIndex:indexPath.row];
	//detailViewController.textView.text = aRSS.description;//[NSString stringWithFormat:@"%@", aRSS.title];
	//NSLog(detailViewController.textView.text);
	
	iRSSAppDelegate *delegate = [[UIApplication sharedApplication] delegate]; //delegate];
	[delegate.navigationController pushViewController:detailViewController animated:YES];
	[detailViewController release];*/
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 66;
}



@end

