//
//  WebViewController.h
//  ESBPOD
//
//  Created by Roberto J. Osorio-Goenaga on 5/15/09.
//  Copyright 2009 Malloc Media, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface WebViewController : UIViewController {
	
	IBOutlet UIWebView *webView;
	NSURLRequest *urlString;
}

@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) NSURLRequest *urlString;

@end
