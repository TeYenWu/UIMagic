//
//  UIMagicNavigationBar.m
//  UIMagic
//
//  Created by 吳德彥 on 1/31/16.
//  Copyright © 2016 吳德彥. All rights reserved.
//

#import "UIMagicNavigationBar.h"

@implementation UIMagicNavigationBar

-(void)layoutSubviews
{
    [super layoutSubviews];
    if ([self.topItem isKindOfClass:[UIMagicNavigationItem class]])
    {
        UIMagicNavigationItem *topItem = (UIMagicNavigationItem *)self.topItem;
        [topItem connectBarItemsToRuntimeViews:self.subviews inNavigationBar:self];
    }
    
}

@end
