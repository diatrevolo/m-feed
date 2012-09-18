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

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *subtitle;
@property (nonatomic, strong) NSString *link;
@property (nonatomic, strong) NSString *updated;
@property (nonatomic, strong) NSString *authorName;
@property (nonatomic, strong) NSString *authorEmail;
@property (nonatomic, strong) NSString *feedId;
@property (nonatomic, strong) NSString *entryTitle;
@property (nonatomic, strong) NSString *entryLink;
@property (nonatomic, strong) NSString *entryId;
@property (nonatomic, strong) NSString *entryUpdated;
@property (nonatomic, strong) NSString *entrySummary;
@property (nonatomic, strong) NSString *content;

@end
