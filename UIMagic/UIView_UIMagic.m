//
//  UIView_UIMagic.m
//  UIMagic
//
//  Created by 吳德彥 on 2/1/16.
//  Copyright © 2016 吳德彥. All rights reserved.
//

#import "UIView_UIMagic.h"

@implementation UIView(UIMagic)

@dynamic customizable;

-(BOOL)isRuntimeBarItem
{
    if ([self isMemberOfClass:[UINavigationButton class]]) {
        return YES;
    }
    return NO;
}

-(UIBarItem *)getOriginalBarItemInRuntime
{
    if ([self isRuntimeBarItem]) {
        if ([self isMemberOfClass:[UINavigationButton class]]) {
            UINavigationButton *button = (UINavigationButton *)self;
            return button.originatingButtonItem;
        }
    }
    return nil;
}


@end