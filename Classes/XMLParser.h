//
//  XMLParser.h
//  ESBPOD
//
//  Created by Roberto J. Osorio-Goenaga on 3/25/09.
//  Copyright 2009 Malloc Media, LLC. All rights reserved.
//
//  XMLParser class is responsible for parsing the XML data, in this case
//  in three steps: 1)didStartElement: finds the elements in the file. 
//  2)foundCharacters: parses the data contained within.  3)didEndElement:
//  finds the closing tag.
#define ATOM_FEED 0
#define RSS_FEED 1

#import <UIKit/UIKit.h>

@class iRSSAppDelegate, Atom, RSS;

@interface XMLParser : NSObject {
	
	NSMutableString *currentElementValue;
	
	iRSSAppDelegate *appDelegate;
	NSInteger typeOfFeed;
	Atom *aAtom; 
	RSS *aRSS;
}

@property NSInteger typeOfFeed;

- (XMLParser *) initXMLParser;

@end
