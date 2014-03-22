//
//  NSDictionary+RSMToolKit.m
//  RSMToolkit
//
//  Created by Robert S Mozayeni on 1/2/14.
//  Copyright (c) 2014 Robert Mozayeni. All rights reserved.
//

#import "NSDictionary+RSMToolKit.h"

@implementation NSDictionary (RSMToolKit)




- (NSDictionary*) deepCopy {
    NSUInteger count = [self count];
    id cObjects[count];
    id cKeys[count];
	
    NSEnumerator *e = [self keyEnumerator];
    unsigned int i = 0;
    id thisKey;
    while ((thisKey = [e nextObject]) != nil) {
        id obj = self[thisKey];
		
        if ([obj respondsToSelector:@selector(deepCopy)])
            cObjects[i] = [obj deepCopy];
        else
            cObjects[i] = [obj copy];
		
        if ([thisKey respondsToSelector:@selector(deepCopy)])
            cKeys[i] = [thisKey deepCopy];
        else
            cKeys[i] = [thisKey copy];
		
        ++i;
    }
	
    NSDictionary *ret = [NSDictionary dictionaryWithObjects:cObjects forKeys:cKeys count:count] ;
	
    // The newly-created dictionary retained these, so now we need to balance the above copies
    
	
    return ret;
}
- (NSMutableDictionary*) mutableDeepCopy {
    NSUInteger count = [self count];
    id cObjects[count];
    id cKeys[count];
	
    NSEnumerator *e = [self keyEnumerator];
    unsigned int i = 0;
    id thisKey;
    while ((thisKey = [e nextObject]) != nil) {
        id obj = self[thisKey];
		
        // Try to do a deep mutable copy, if this object supports it
        if ([obj respondsToSelector:@selector(mutableDeepCopy)])
            cObjects[i] = [obj mutableDeepCopy];
		
        // Then try a shallow mutable copy, if the object supports that
        else if ([obj respondsToSelector:@selector(mutableCopyWithZone:)])
            cObjects[i] = [obj mutableCopy];
		
        // Next try to do a deep copy
        else if ([obj respondsToSelector:@selector(deepCopy)])
            cObjects[i] = [obj deepCopy];
		
        // If all else fails, fall back to an ordinary copy
        else
            cObjects[i] = [obj copy];
		
        // I don't think mutable keys make much sense, so just do an ordinary copy
        if ([thisKey respondsToSelector:@selector(deepCopy)])
            cKeys[i] = [thisKey deepCopy];
        else
            cKeys[i] = [thisKey copy];
		
        ++i;
    }
	
    NSMutableDictionary *ret = [NSMutableDictionary dictionaryWithObjects:cObjects forKeys:cKeys count:count] ;
	
    // The newly-created dictionary retained these, so now we need to balance the above copies
    
	
    return ret;
}


@end
