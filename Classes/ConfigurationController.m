//
//  ConfigurationController.m
//  simpleFeed
//
//  Created by Roberto J. Osorio-Goenaga on 10/18/09.
//  Copyright 2009 Malloc Media, LLC. All rights reserved.
//

#import <libxml/HTMLparser.h>
#import <libxml/xmlreader.h>
#import "ConfigurationController.h"
#import "iRSSAppDelegate.h"
	

@implementation ConfigurationController

@synthesize textField;
@synthesize button;
@synthesize mallocMedia;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

//<<<<<<< .mine
//- (void)findLinks:(htmlNodePtr)element{
//	printf("starting the FindLinks method\n");
//	xmlChar *feedLink;
//	for(htmlNodePtr node = element; node != NULL; node = node->next)
//	{
//		if(node->type == XML_ELEMENT_NODE)
//		{
//			if(xmlStrcasecmp(node->name, (const xmlChar*)"LINK") == 0)
//			{
//				for(xmlAttrPtr attr = node->properties; attr != NULL; attr = attr->next)
//				{
//					if(xmlStrcasecmp(attr->name, (const xmlChar*)"HREF") == 0)
//					{
//						feedLink = xmlGetProp(node, (const xmlChar*)"href");
//						if((xmlStrcasecmp(xmlGetProp(node, (const xmlChar*)"type"), (const xmlChar*)"application/rss+xml") == 0)||(xmlStrcasecmp(xmlGetProp(node, (const xmlChar*)"type"), (const xmlChar*)"application/atom+xml") == 0)){
//							printf("Found an RSS feed: %s\n", feedLink);
//							[appDelegate setUrl:[[NSURL alloc] initWithString:[NSString stringWithCString:feedLink]]];
//							xmlFree(feedLink);
//						}
//					}
//				}
//			}
//			if((node->children != NULL))
//			{
//				printf("RAN THIS\n");
//				[self findLinks:node->children];
//			}
//		}
//	}
//}
//=======
- (void)findLinks:(htmlNodePtr)element{
//>>>>>>> .r34

	printf("starting the FindLinks method\n");
	xmlChar *feedLink;
	for(htmlNodePtr node = element; node != NULL; node = node->next)
	{
		if(node->type == XML_ELEMENT_NODE)
		{
			if(xmlStrcasecmp(node->name, (const xmlChar*)"LINK") == 0)
			{
				for(xmlAttrPtr attr = node->properties; attr != NULL; attr = attr->next)
				{
					if(xmlStrcasecmp(attr->name, (const xmlChar*)"HREF") == 0)
					{
						//printf("Found link <%s>\n", node->name);//children->content);
						feedLink = xmlGetProp(node, (const xmlChar*)"href");
						if((xmlStrcasecmp(xmlGetProp(node, (const xmlChar*)"type"), (const xmlChar*)"application/rss+xml") == 0)||(xmlStrcasecmp(xmlGetProp(node, (const xmlChar*)"type"), (const xmlChar*)"application/atom+xml") == 0)){
							//feedLink = xmlGetProp(node, (const xmlChar*)"href");
							printf("Found an RSS feed: %s\n", feedLink);
							[appDelegate setUrl:[[NSURL alloc] initWithString:[NSString stringWithCString:feedLink]]];
							
							xmlFree(feedLink);
							//msg = (char *) malloc(sizeof((char*)feedLink));
							//strcpy(msg, (const char*)feedLink);
							//printf("Successfully copied to msg as %s\n", msg);
							//xmlFree(feedLink);
						}
					}
				}
			}
			
			if((node->children != NULL))
			{
				printf("RAN THIS\n");
				[self findLinks:node->children];
				//FindLinks(node->children);
			}
		}
		
	}
	//xmlFree(feedLink);
	//(msg);
	//free(msg);
	
}


// XML_PARSE_RECOVER	= 1<<0,	/* recover on errors */
//XML_PARSE_NOENT	= 1<<1,	/* substitute entities */
//XML_PARSE_DTDLOAD	= 1<<2,	/* load the external subset */
//XML_PARSE_DTDATTR	= 1<<3,	/* default DTD attributes */
//XML_PARSE_DTDVALID	= 1<<4,	/* validate with the DTD */
//XML_PARSE_NOERROR	= 1<<5,	/* suppress error reports */
//XML_PARSE_NOWARNING	= 1<<6,	/* suppress warning reports */
//XML_PARSE_PEDANTIC	= 1<<7,	/* pedantic error reporting */
//XML_PARSE_NOBLANKS	= 1<<8,	/* remove blank nodes */
//XML_PARSE_SAX1	= 1<<9,	/* use the SAX1 interface internally */
//XML_PARSE_XINCLUDE	= 1<<10,/* Implement XInclude substitition  */
//XML_PARSE_NONET	= 1<<11,/* Forbid network access */
//XML_PARSE_NODICT	= 1<<12,/* Do not reuse the context dictionnary */
//XML_PARSE_NSCLEAN	= 1<<13,/* remove redundant namespaces declarations */
//XML_PARSE_NOCDATA	= 1<<14,/* merge CDATA as text nodes */
//XML_PARSE_NOXINCNODE= 1<<15,/* do not generate XINCLUDE START/END nodes */
//XML_PARSE_COMPACT   = 1<<16,/* compact small text nodes; no modification of
//							 the tree allowed afterwards (will possibly
//							 crash if you try to modify the tree) */
//XML_PARSE_OLD10	= 1<<17,/* parse using XML-1.0 before update 5 */
//XML_PARSE_NOBASEFIX = 1<<18,/* do not fixup XINCLUDE xml:base uris */
//XML_PARSE_HUGE      = 1<<19, /* relax any hardcoded limit from the parser */
//XML_PARSE_OLDSAX    = 1<<20 /* parse using SAX2 interface from before 2.7.0 */



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {

	//htmlTag
	/////////////
	appDelegate = (iRSSAppDelegate *)[[UIApplication sharedApplication] delegate];
	self.title = @"Configuration";
    [super viewDidLoad];
}

-(IBAction)makeURL:(id)sender
{
	NSString *path = [[NSString alloc] initWithString:textField.text];//[appDelegate.url absoluteString]];
	NSURL *quickURL = [[NSURL alloc] initWithString:textField.text];
	NSData *xmlData = [NSData dataWithContentsOfURL:quickURL];
	//NSLog(@"%@", [xmlData bytes]);
	xmlDocPtr reader = xmlReadDoc([xmlData bytes], nil, [path UTF8String], (XML_PARSE_NOBLANKS|XML_PARSE_RECOVER|XML_PARSE_NOERROR));
	//htmlDocPtr reader =  htmlReadDoc([xmlData bytes], nil, [path UTF8String], 
	//								 (HTML_PARSE_NOBLANKS | HTML_PARSE_NOERROR | HTML_PARSE_RECOVER));
	if (!reader) {
		NSLog(@"Failed to load reader");
		return;
	} else {
		NSLog(@"HTML Parse Successful!");
		xmlDocPtr node = xmlDocGetRootElement(reader);
		//		NSString *testString = [[NSString alloc] initWithCString:node->name];
		//		NSLog(testString);
		//		
		//		NSString *aName = @"meta";
		//		xmlNode *child = NULL;
		//printf("STRING IS %s\n", FindLinks(node));
		[self findLinks:node];
		//xmlFree(feedLink);
	}
	
	///////
	//NSLog(@"Setting the url to %@", textField.text);
//	appDelegate.url = [[NSURL alloc] initWithString:textField.text];//[NSURL URLWithString:textField.text];//alloc] initWithString:textField.text];
//	
	NSLog(@"URL is now set to %@", appDelegate.url);
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
	{
		NSLog(@"Sending notification");
		[[NSNotificationCenter defaultCenter]
		 postNotificationName:@"makeURLPressed"
		 object:self];
	}
}
-(IBAction)goToMallocMedia:(id)sender {
	
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.mallocmedia.com"]];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

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
