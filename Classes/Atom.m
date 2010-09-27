//
//  Atom.m
//  simpleFeed
//
//  Created by Roberto J. Osorio-Goenaga on 3/30/09.
//  Copyright 2009 Malloc Media, LLC. All rights reserved.
//

#import "Atom.h"


@implementation Atom
@synthesize title, subtitle, link, updated, authorName, authorEmail, feedId, entryTitle, entryLink, entryId, entryUpdated, entrySummary, content;

- (void) dealloc
{
	[title release];
	[subtitle release];
	[link release];
	[updated release];
	[authorName release];
	[authorEmail release];
	[feedId release];
	[entryTitle release];
	[entryLink release];
	[entryId release];
	[entryUpdated release];
	[entrySummary release];
	[content release];
	[super dealloc];
}

@end
