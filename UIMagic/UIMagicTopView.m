//
//  UIMagicTopView.m
//  UIMagic
//
//  Created by 吳德彥 on 1/29/16.
//  Copyright © 2016 吳德彥. All rights reserved.
//

#import "UIMagicTopView.h"

@implementation UIMagicTopView


+ (UIMagicTopView *)sharedUIMagicTopView {
    static UIMagicTopView *sharedUIMagicTopView = nil;
    
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    UIView *topView = window.rootViewController.view;
    for (UIView * view in topView.subviews)
    {
        if ([view isMemberOfClass:[UIMagicTopView class]])
        {
            sharedUIMagicTopView = (UIMagicTopView *)view;
            
        }
    }
    
    @synchronized(self) {
        if (sharedUIMagicTopView == nil)
        {
            sharedUIMagicTopView = [[self alloc] initWithFrame:window.frame];
            
//            sharedUIMagicTopView.backgroundColor = [UIColor grayColor];
            
            [topView addSubview:sharedUIMagicTopView];
        }
    }
    
//    sharedUIMagicTopView.userInteractionEnabled = NO;
    return sharedUIMagicTopView;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    for (UIView *v in self.subviews) {
        CGPoint localPoint = [v convertPoint:point fromView:self];
        if (v.alpha > 0.01 && ![v isHidden] && v.userInteractionEnabled && [v pointInside:localPoint withEvent:event])
            return YES;
    }
    return NO;
}

-(UIMagicPlaceHolder *)addFBSPlaceHolderFromSourcePlaceHolder:(UIMagicPlaceHolder *)sourcePlaceHolder inPlaceHolderManager:(id<UIMagicProtocol>)manager
{
    if (sourcePlaceHolder == nil)
        return nil;
    
    UIMagicPlaceHolder *fbsPlaceHolder = [[UIMagicPlaceHolder alloc] init];
    
    fbsPlaceHolder.placeholderManager = manager;
    
    [self addSubview:fbsPlaceHolder];
    
    UIView * content = sourcePlaceHolder.content;
    
    if ([UIMagicRuntimeUtility isRuntimeView:content])
    {
        UIView * button = [UIMagicRuntimeUtility cloneGeneralViewFromRuntimeView:content];
        
        [self addSubview:button];
        
        CGPoint cloneCenter = [sourcePlaceHolder centerOfContentClone];
        
        button.frame = CGRectMake(cloneCenter.x - button.frame.size.width / 2, cloneCenter.y - button.frame.size.height / 2, button.frame.size.width, button.frame.size.height);
        fbsPlaceHolder.content = button;
    }
    
    if (sourcePlaceHolder.barItem) {
        fbsPlaceHolder.barItem = sourcePlaceHolder.barItem;
    }
    else
    {
        fbsPlaceHolder.barItem = [UIMagicRuntimeUtility getOriginalBarItemFromRuntimeView:content];
    }
    return fbsPlaceHolder;
}


@end
