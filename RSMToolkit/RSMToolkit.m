//
//  RSMToolkit.m
//  RSMToolkit
//
//  Created by Robert S Mozayeni on 8/10/13.
//  Copyright (c) 2013 Robert Mozayeni. All rights reserved.
//

#import "RSMToolkit.h"

@implementation RSMToolkit


+ (void)openURLStringsIfPossible:(NSArray *)strings {
	NSMutableArray *params = [[NSMutableArray alloc]init];
	[strings enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL *stop) {
		[params addObject:[NSURL URLWithString:obj]];
	}];
	
	[RSMToolkit openURLStringsIfPossible:params];
}

+ (void)openURLsIfPossible:(NSArray *)URLs {
	[URLs enumerateObjectsUsingBlock:^(NSURL *URL, NSUInteger idx, BOOL *stop) {
		if ([[UIApplication sharedApplication] canOpenURL:URL]){
			[[UIApplication sharedApplication] openURL:URL];
			return;
		}
	}];
}

@end
