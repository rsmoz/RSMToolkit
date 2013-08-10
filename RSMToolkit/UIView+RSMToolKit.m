//
//  UIView+RSMToolKit.m
//  RSMToolkit
//
//  Created by Robert S Mozayeni on 8/10/13.
//  Copyright (c) 2013 Robert Mozayeni. All rights reserved.
//

#import "UIView+RSMToolKit.h"

@implementation UIView (RSMToolKit)

- (void)addSubviewsInArray:(NSArray *)subviews{
	[subviews enumerateObjectsUsingBlock:^(UIView *subview, NSUInteger idx, BOOL *stop) {
		[self addSubview:subview];
	}];
}

- (void)addSubviews:(id)view, ... {
	id eachView;
	va_list argMeBooty;
	if (view){
		[self addSubview:view];
		va_start(argMeBooty, view);
		while ((eachView = va_arg(argMeBooty, id))) {
			[self addSubview:eachView];
		}
		va_end(argMeBooty);
		
	}
}


@end
