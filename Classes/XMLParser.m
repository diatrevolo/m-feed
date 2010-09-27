//
//  XMLParser.m
//  ESBPOD
//
//  Created by Roberto J. Osorio-Goenaga on 3/25/09.
//  Copyright 2009 Malloc Media, LLC. All rights reserved.
//  
//  XMLParser class is responsible for parsing the XML data, in this case
//  in three steps: 1)didStartElement: finds the elements in the file. 
//  2)foundCharacters: parses the data contained within.  3)didEndElement:
//  finds the closing tag.


#import "XMLParser.h"
#import "iRSSAppDelegate.h"
#import "Atom.h"
#import "RSS.h"

@implementation XMLParser

@synthesize typeOfFeed;

- (XMLParser *) initXMLParser {
	
	[super init];
	
	appDelegate = (iRSSAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	return self;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName 
	attributes:(NSDictionary *)attributeDict {
	
	if ([elementName isEqualToString:@"feed"]) { // If it is an ATOM feed
		appDelegate.entries = [[NSMutableArray alloc] init];
		typeOfFeed = ATOM_FEED;
	} else if ([elementName isEqualToString:@"rss"]) {
		appDelegate.entries = [[NSMutableArray alloc] init];
		typeOfFeed = RSS_FEED;
	} else if([elementName isEqualToString:@"link"] && typeOfFeed == ATOM_FEED){//application"]) {
		aAtom.link = [attributeDict objectForKey:@"link"];
	} else if ([elementName isEqualToString:@"entry"] && typeOfFeed == ATOM_FEED) {
		aAtom = [[Atom alloc] init];
	} else if ([elementName isEqualToString:@"item"] && typeOfFeed == RSS_FEED) {  //THIS SETS THE PRECEDENT FOR THE BOTTOM STUFF
		aRSS = [[RSS alloc] init];
	}
	/*if([elementName isEqualToString:@"listings"]) {
		//Initialize the array.
		appDelegate.listings = [[NSMutableArray alloc] init];
	} else if([elementName isEqualToString:@"listing"]) {
		
		//Initialize the listing.
		aListing = [[Listing alloc] init];
		
		//Extract the attribute here.
		 
	} if ([elementName isEqualToString:@"numberCat"]) {
		aListing.noType = [attributeDict objectForKey:@"noType"];
		
		NSLog(@"Reading id value :%@", aListing.noType);
	} else {
		NSLog(@"No known elements");
	}
	
	NSLog(@"Processing Element: %@", elementName);*/
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string { 
	
	if(!currentElementValue) 
		currentElementValue = [[NSMutableString alloc] initWithString:string];
	else
		[currentElementValue appendString:string];
	
	//NSLog(@"Processing Value: %@", currentElementValue);
	
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
	
	if ([elementName isEqualToString:@"entry"] && typeOfFeed == ATOM_FEED) {
		[appDelegate.entries addObject:aAtom];
		[aAtom release];
		aAtom = nil;
	}
	
	if ([elementName isEqualToString:@"item"] && typeOfFeed == RSS_FEED) {
		[appDelegate.entries addObject:aRSS];
		[aRSS release];
		aRSS = nil;
	}
	
	//There is nothing to do if we encounter the listings element here.
	//If we encounter the listing element however, we want to add the listing object to the array
	// and release the object.
	//NSLog(@"I'm here now");
	//NSLog(elementName);
	if([elementName isEqualToString:@"title"] && typeOfFeed == ATOM_FEED) { //ATOM FEEDS
		[aAtom setValue:currentElementValue forKey:@"title"];		
	} else if ([elementName isEqualToString:@"subtitle"] && typeOfFeed == ATOM_FEED) {
		[aAtom setValue:currentElementValue forKey:@"subtitle"]; 
	} else if ([elementName isEqualToString:@"updated"] && typeOfFeed == ATOM_FEED) {
		[aAtom setValue:currentElementValue forKey:@"updated"]; 
	} else if ([elementName isEqualToString:@"name"] && typeOfFeed == ATOM_FEED) {
		[aAtom setValue:currentElementValue forKey:@"authorName"]; 
	} else if ([elementName isEqualToString:@"email"] && typeOfFeed == ATOM_FEED) {
		[aAtom setValue:currentElementValue forKey:@"authorEmail"]; 
	} else if ([elementName isEqualToString:@"id"] && typeOfFeed == ATOM_FEED) {
		[aAtom setValue:currentElementValue forKey:@"feedId"]; 
	} else if ([elementName isEqualToString:@"content"] && typeOfFeed == ATOM_FEED) {
		[aAtom setValue:currentElementValue forKey:@"content"]; 
	} else if ([elementName isEqualToString:@"title"] && typeOfFeed == RSS_FEED) {  //RSS FEEDS
		[aRSS setValue:currentElementValue forKey:@"title"]; 
	} else if ([elementName isEqualToString:@"link"] && typeOfFeed == RSS_FEED) {
		[aRSS setValue:currentElementValue forKey:@"link"]; 
	} else if ([elementName isEqualToString:@"description"] && typeOfFeed == RSS_FEED) {
		[aRSS setValue:currentElementValue forKey:@"description"]; 
	} else if ([elementName isEqualToString:@"pubDate"] && typeOfFeed == RSS_FEED) {
		[aRSS setValue:currentElementValue forKey:@"pubDate"]; 
	} else if ([elementName isEqualToString:@"guid"] && typeOfFeed == RSS_FEED) {
		[aRSS setValue:currentElementValue forKey:@"guid"]; 
	} else if ([elementName isEqualToString:@"category"] && typeOfFeed == RSS_FEED) {
		[aRSS setValue:currentElementValue forKey:@"category"]; 
	} else if ([elementName isEqualToString:@"media:thumbnail"] && typeOfFeed == RSS_FEED) {
		//NSLog(@"I caught that");
		[aRSS setValue:currentElementValue forKey:@"media"]; 
	} else if ([elementName isEqualToString:@"copyright"] && typeOfFeed == RSS_FEED) {
		//NSLog(@"I caught that");
		[aRSS setValue:currentElementValue forKey:@"copyright"]; 
	} else if ([elementName isEqualToString:@"image"] && typeOfFeed == RSS_FEED) {
		//NSLog(@"I caught that");
		[aRSS setValue:currentElementValue forKey:@"image"]; 
	} else if ([elementName isEqualToString:@"url"] && typeOfFeed == RSS_FEED) {
		//NSLog(@"I caught that");
		[aRSS setValue:currentElementValue forKey:@"url"]; 
	} else {
		if (typeOfFeed == RSS_FEED)
			[aRSS setValue:currentElementValue forKey:@"garbage"];
	}
	[currentElementValue release];
	currentElementValue = nil;
}

- (void) dealloc {
	if (typeOfFeed == RSS_FEED)
		[aRSS release];
	else if (typeOfFeed == ATOM_FEED)
		[aAtom release];
	[currentElementValue release];
	[super dealloc];
}

@end
