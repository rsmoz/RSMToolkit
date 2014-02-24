//
//  NSArray+RSMToolKit.h
//  RSMToolkit
//
//  Created by Robert S Mozayeni on 1/2/14.
//  Copyright (c) 2014 Robert Mozayeni. All rights reserved.
//	Based off of Sherm Pendley's Deep Copy

#import <Foundation/Foundation.h>

@interface NSArray (RSMToolKit)

- (NSArray*) deepCopy;
- (NSMutableArray*) mutableDeepCopy;

@end