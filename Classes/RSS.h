//
//  RSS.h
//  simpleFeed
//
//  Created by Roberto J. Osorio-Goenaga on 4/3/09.
//  Copyright 2009 Malloc Media, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>   


@interface RSS : NSObject {
	NSString *title;	
	NSString *link;
	NSString *description;	
	NSString *language;
	NSString *pubDate;
	NSString *lastBuildDate;
	NSString *docs;
	NSString *generator;
	NSString *managingEditor;
	NSString *webMaster;
	NSString *ttl;
	NSString *guid;
	NSString *category;
	NSString *media;
	NSString *copyright;
	NSString *image;
	NSString *url;
	NSString *garbage;
}

@property (nonatomic, retain) NSString *title;	
@property (nonatomic, retain) NSString *link;
@property (nonatomic, retain) NSString *description;	
@property (nonatomic, retain) NSString *language;
@property (nonatomic, retain) NSString *pubDate;
@property (nonatomic, retain) NSString *lastBuildDate;
@property (nonatomic, retain) NSString *docs;
@property (nonatomic, retain) NSString *generator;
@property (nonatomic, retain) NSString *managingEditor;
@property (nonatomic, retain) NSString *webMaster;
@property (nonatomic, retain) NSString *ttl;
@property (nonatomic, retain) NSString *guid;
@property (nonatomic, retain) NSString *category;
@property (nonatomic, retain) NSString *media;
@property (nonatomic, retain) NSString *copyright;
@property (nonatomic, retain) NSString *image;
@property (nonatomic, retain) NSString *url;
@property (nonatomic, retain) NSString *garbage;

@end
