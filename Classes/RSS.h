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

@property (nonatomic, strong) NSString *title;	
@property (nonatomic, strong) NSString *link;
@property (nonatomic, strong) NSString *description;	
@property (nonatomic, strong) NSString *language;
@property (nonatomic, strong) NSString *pubDate;
@property (nonatomic, strong) NSString *lastBuildDate;
@property (nonatomic, strong) NSString *docs;
@property (nonatomic, strong) NSString *generator;
@property (nonatomic, strong) NSString *managingEditor;
@property (nonatomic, strong) NSString *webMaster;
@property (nonatomic, strong) NSString *ttl;
@property (nonatomic, strong) NSString *guid;
@property (nonatomic, strong) NSString *category;
@property (nonatomic, strong) NSString *media;
@property (nonatomic, strong) NSString *copyright;
@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *garbage;

@end
