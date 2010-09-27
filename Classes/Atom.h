//
//  Atom.h
//  simpleFeed
//
//  Created by Roberto J. Osorio-Goenaga on 3/30/09.
//  Copyright 2009 Malloc Media, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Atom : NSObject {
	NSString *title;	
	NSString *subtitle;
	NSString *link;	
	NSString *updated;
	//NSString *author;
	NSString *authorName;
	NSString *authorEmail;
	NSString *feedId;
	NSString *entryTitle;
	NSString *entryLink;
	NSString *entryId;
	NSString *entryUpdated;
	NSString *entrySummary;
	NSString *content;
}

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *subtitle;
@property (nonatomic, retain) NSString *link;
@property (nonatomic, retain) NSString *updated;
@property (nonatomic, retain) NSString *authorName;
@property (nonatomic, retain) NSString *authorEmail;
@property (nonatomic, retain) NSString *feedId;
@property (nonatomic, retain) NSString *entryTitle;
@property (nonatomic, retain) NSString *entryLink;
@property (nonatomic, retain) NSString *entryId;
@property (nonatomic, retain) NSString *entryUpdated;
@property (nonatomic, retain) NSString *entrySummary;
@property (nonatomic, retain) NSString *content;

@end
