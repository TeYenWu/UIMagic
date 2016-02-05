//
//  NSMutableArray_IndexHelper.m
//  UIMagic
//
//  Created by 吳德彥 on 2/3/16.
//  Copyright © 2016 吳德彥. All rights reserved.
//

#import <Foundation/Foundation.h>
@implementation NSMutableArray (IndexHelper)
-(id) safeObjectAtIndex:(NSUInteger)index {
    if (index>=self.count) {
        return nil;
    }
    return [self objectAtIndex:index];
}
@end