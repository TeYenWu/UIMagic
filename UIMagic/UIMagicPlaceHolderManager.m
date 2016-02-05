//
//  UIMagicPlaceHolderManager.m
//  UIMagic
//
//  Created by 吳德彥 on 1/31/16.
//  Copyright © 2016 吳德彥. All rights reserved.
//

#import "UIMagicPlaceHolderManager.h"

@implementation UIMagicPlaceHolderManager

-(void)producePlaceHoldersWithView:(UIView *)view
{
    for (UIMagicPlaceHolder * placeholder in self.placeholders){
        if (placeholder.content == view)
            continue;
    }
    UIMagicPlaceHolder * placeholder = [UIMagicPlaceHolder initWithContent:view];
    NSLog(@"%@", view);
    if (placeholder)
    {
        placeholder.placeholderManager = self;
        [_placeholders addObject:placeholder];
        [self addSubview:placeholder];
    }
}

-(BOOL)moveContent:(UIView *)content fromSourcePlaceHolder:(UIMagicPlaceHolder *)sourcePlaceHolder toProposedPlaceHolder:(UIMagicPlaceHolder *)proposedDestinationPlaceHolder
{
    return YES;
}

-(UIMagicPlaceHolder *)placeholderAtPoint:(CGPoint)point
{
    for (UIMagicPlaceHolder * placeholder in _placeholders) {
        CGPoint locationInView = [placeholder convertPoint:point fromView:placeholder.window];
        if (CGRectContainsPoint(placeholder.bounds, locationInView))
        {
            return placeholder;
        }
    }
    return nil;
}
@end
