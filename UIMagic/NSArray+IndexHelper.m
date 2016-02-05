//
//  NSArray+IndexHelper.m
//  C_POS
//
//  Created by Tomohisa Takaoka on 6/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSArray+IndexHelper.h"

@implementation NSArray (IndexHelper)
-(id) safeObjectAtIndex:(NSUInteger)index {
    if (index>=self.count) {
        return nil;
    }
    return [self objectAtIndex:index];
}
@end
