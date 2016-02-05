//
//  UIMagicPlaceHolder.m
//  UIMagic
//
//  Created by 吳德彥 on 1/29/16.
//  Copyright © 2016 吳德彥. All rights reserved.
//

#import "UIMagicPlaceHolder.h"


@implementation UIMagicPlaceHolder
{
    UIView * _clone;
    UIGestureRecognizer *_longPress;
}

@synthesize content;
-(void)setContent:(UIView *)newContent
{
    if (newContent) {
        self.frame = newContent.frame;
        content = newContent;
        [self initialize];
    }
}

-(void)setTargetPlaceHolder:(UIMagicPlaceHolder *)targetPlaceHolder
{
    if (_targetPlaceHolder) {
        _targetPlaceHolder.soucePlaceHolder = nil;
    }
    
    _targetPlaceHolder = targetPlaceHolder;
    
    if (_targetPlaceHolder) {
        _targetPlaceHolder.soucePlaceHolder = self;
    }
}



+ (UIMagicPlaceHolder *)initWithContent:(UIView *)content
{
    UIMagicPlaceHolder *placeholder = [[UIMagicPlaceHolder alloc] initWithFrame:content.frame];
    
     placeholder.content = content;
    
    [placeholder initialize];
    
    return placeholder;
}

-(instancetype)init
{
    if (self = [super init]) {
        self.userInteractionEnabled = NO;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = NO;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self.userInteractionEnabled = NO;
    }
    return self;
}

- (void)initialize
{
    if (content)
    {
        if (_longPress == nil || content.gestureRecognizers == nil || [content.gestureRecognizers indexOfObject:_longPress] == NSNotFound) {
            _longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressHandle:)];
            
            [content addGestureRecognizer:_longPress];
        }
    }
    
    
    [self.superview bringSubviewToFront:self];
    
    self.userInteractionEnabled = NO;
//    
//    self.backgroundColor = [UIColor redColor];

}

-(void) longPressHandle:(UIGestureRecognizer *)recogniger
{
    if (![self existContent])
        return;
    
    UIMagicTopView * magicTopView = [UIMagicTopView sharedUIMagicTopView];
    
    UILongPressGestureRecognizer *longPress = (UILongPressGestureRecognizer *)recogniger;
    UIGestureRecognizerState state = longPress.state;
    
    CGPoint location = [longPress locationInView:magicTopView];
    
    
    if (state == UIGestureRecognizerStateBegan) {
        // Take a snapshot of the selected row using helper method.
        _clone = [self customSnapshotFromView:self.content];
        
        // Add the snapshot as subview, centered at cell's center...
        __block CGPoint center = self.content.center;
        _clone.center = center;
        _clone.alpha = 0.0;
        [magicTopView addSubview:_clone];
        [UIView animateWithDuration:0.25 animations:^{
            
            // Offset for gesture location.
            center.y = location.y;
            _clone.center = center;
            _clone.transform = CGAffineTransformMakeScale(1.05, 1.05);
            _clone.alpha = 0.98;
            
            // Fade out.
            self.content.alpha = 0.0;
            
        } completion:^(BOOL finished) {
            
            self.content.hidden = YES;
            
        }];
    }
    else if (state == UIGestureRecognizerStateChanged)
    {
        _clone.center = location;
        UIMagicPlaceHolder * otherPlaceHolder = [_placeholderManager placeholderAtPoint:location];
        
        if (![otherPlaceHolder isEqual:self]  && ![otherPlaceHolder isEqual:_targetPlaceHolder])
        {
            [_placeholderManager moveContent:self.content fromSourcePlaceHolder:self toProposedPlaceHolder:otherPlaceHolder];
        }
    }
    else
    {
        [_placeholderManager exchangeContenstInSourcePlaceHolder:self toTargetPlaceHolder:_targetPlaceHolder];
    }
}

- (UIView *)customSnapshotFromView:(UIView *)inputView {
    
    // Make an image from the input view.
    UIGraphicsBeginImageContextWithOptions(inputView.bounds.size, NO, 0);
    [inputView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    // Create an image view.
    UIView *snapshot = [[UIImageView alloc] initWithImage:image];
    snapshot.layer.masksToBounds = NO;
    snapshot.layer.cornerRadius = 0.0;
//    snapshot.layer.shadowOffset = CGSizeMake(-5.0, 0.0);
//    snapshot.layer.shadowRadius = 5.0;
//    snapshot.layer.shadowOpacity = 0.4;
    
    return snapshot;
}

-(void)moveContentClonetoTargetPlaceHolder:(UIMagicPlaceHolder *)targetPlaceHolder animated:(BOOL)animated
{
    UIMagicTopView * magicTopView = [UIMagicTopView sharedUIMagicTopView];
    
    self.targetPlaceHolder = targetPlaceHolder;
    
    if (_clone == nil) {
         _clone = [self customSnapshotFromView:self.content];
        
        [magicTopView addSubview:_clone];
        
        _clone.center = [magicTopView convertPoint:self.center fromView:self.superview];
    }
    
    CGPoint targetCenter = [magicTopView convertPoint:targetPlaceHolder.center fromView:targetPlaceHolder.superview];
    
    
    if (animated)
    {
        [UIView animateWithDuration:0.25 animations:^{
            
            // Offset for gesture location.
            _clone.center =  targetCenter;
            CGRect frame = targetPlaceHolder.frame;
            // Fade out.
            self.content.alpha = 0.0;
            
        } completion:^(BOOL finished) {
//            _clone.center =  targetCenter;
            self.content.hidden = YES;
            
        }];
    }
    else
    {
        _clone.center = targetCenter;
        _clone.alpha = 1;
        self.content.alpha = 0.0;
        self.content.hidden = YES;
    }
}


-(void)retreiveContentCloneWithAnimated:(BOOL)animated
{
    if (_clone == nil)  return;

    self.targetPlaceHolder = nil;
    
    UIMagicTopView * magicTopView = [UIMagicTopView sharedUIMagicTopView];
    
    CGPoint targetCenter =[magicTopView convertPoint:self.center fromView:self.superview];

    if (animated)
    {
        [UIView animateWithDuration:0.25 animations:^{
            
            // Offset for gesture location.
            _clone.center = targetCenter;
            
            // Fade out.
            self.content.alpha = 1.0;
            
        } completion:^(BOOL finished) {
            
            self.content.hidden = NO;
            [_clone removeFromSuperview];
            
        }];
    }
    else
    {
        _clone.center = targetCenter;
        self.content.alpha = 1.0;
        self.content.hidden = NO;
        [_clone removeFromSuperview];
        _clone = nil;
    }
    
}

-(BOOL)isBarItemEqualTo:(UIBarItem *)barItem
{
    if (self.barItem) {
        return self.barItem; 
    }
    return NO;
}

-(BOOL)pointInside:(CGPoint)point
{
    
//    if ([self existContent]) {
    UIMagicTopView * magicTopView = [UIMagicTopView sharedUIMagicTopView];

    CGPoint locationInView = [self convertPoint:point fromView:magicTopView];
    if (CGRectContainsPoint(self.bounds, locationInView))
    {
        return YES;
    }
//    }
    return NO;
}

- (CGPoint)centerOfContentClone
{
    return _clone.center;
}

- (BOOL)existContent
{
    if (content.window == nil) {
        content = nil;
        [self removeFromSuperview];
        [self.placeholderManager removePlaceHolder:self];
    }
    if (content == nil)
        return NO;
    return YES;
}

@end
