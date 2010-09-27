//
//  RSS.m
//  simpleFeed
//
//  Created by Roberto J. Osorio-Goenaga on 4/2/09.
//  Copyright 2009 Malloc Media, LLC. All rights reserved.
//

#import "RSS.h"


@implementation RSS
@synthesize title, link, description, language, pubDate, lastBuildDate, docs, generator, managingEditor, webMaster, ttl, guid, category, media, copyright, image, url, garbage;

- (void) dealloc
{
	[title release];
	[link release];
	[description release];
	[language release];
	[pubDate release];
	[lastBuildDate release];
	[docs release];
	[generator release];
	[managingEditor release];
	[webMaster release];
	[ttl release];
	[guid release];
	[category release];
	[media release];
	[copyright release];
	[image release];
	[url release];
	[garbage release];
	[super dealloc];
}

@end
